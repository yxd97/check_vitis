#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <cstdlib>
#include <chrono>

#include "hbm_kernel.h"

#include "xcl2.hpp"

//===================================================================
// OpenCL flags and maros for memory management
//===================================================================
#define MAX_HBM_CHANNEL_COUNT 32
#define CHANNEL_NAME(n) n | XCL_MEM_TOPOLOGY
const int HBM[MAX_HBM_CHANNEL_COUNT] = {
    CHANNEL_NAME(0),  CHANNEL_NAME(1),  CHANNEL_NAME(2),  CHANNEL_NAME(3),  CHANNEL_NAME(4),
    CHANNEL_NAME(5),  CHANNEL_NAME(6),  CHANNEL_NAME(7),  CHANNEL_NAME(8),  CHANNEL_NAME(9),
    CHANNEL_NAME(10), CHANNEL_NAME(11), CHANNEL_NAME(12), CHANNEL_NAME(13), CHANNEL_NAME(14),
    CHANNEL_NAME(15), CHANNEL_NAME(16), CHANNEL_NAME(17), CHANNEL_NAME(18), CHANNEL_NAME(19),
    CHANNEL_NAME(20), CHANNEL_NAME(21), CHANNEL_NAME(22), CHANNEL_NAME(23), CHANNEL_NAME(24),
    CHANNEL_NAME(25), CHANNEL_NAME(26), CHANNEL_NAME(27), CHANNEL_NAME(28), CHANNEL_NAME(29),
    CHANNEL_NAME(30), CHANNEL_NAME(31)};

const int DDR[2] = {CHANNEL_NAME(32), CHANNEL_NAME(33)};

#define CL_CREATE_EXT_PTR(name, data, channel)                  \
cl_mem_ext_ptr_t name;                                          \
name.obj = data;                                                \
name.param = 0;                                                 \
name.flags = channel;

#define CL_BUFFER_RDONLY(context, size, ext, err)               \
cl::Buffer(context,                                             \
CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR, \
size, &ext, &err);

#define CL_BUFFER_WRONLY(context, size, ext, err)               \
cl::Buffer(context,                                             \
CL_MEM_WRITE_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,\
size, &ext, &err);

#define CL_BUFFER(context, size, ext, err)                      \
cl::Buffer(context,                                             \
CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,\
size, &ext, &err);

//===================================================================
// global configuration
//===================================================================
std::string DEVICE_NAME = "xilinx_u280_gen3x16_xdma_1_202211_1";
const unsigned DEFAULT_RANDOM_RANGE = BUFFER_SIZE;
const unsigned NUM_RUNS = 20;

//===================================================================
// arugment parser
//===================================================================
class Arguments {
public:
    std::string xclbin_path;
    std::string exec_target;
    unsigned num_of_accesses;
    int traffic_pattern;
    unsigned random_access_range;

    void print_help_traffic_pattern(){
        std::cout << "Supported traffic patterns:" << std::endl;
        std::cout << "            | sequential | burst | random |" << std::endl;
        std::cout << "       read |     sr     |   br  |   dr   |" << std::endl;
        std::cout << "      write |     sw     |   bw  |   dw   |" << std::endl;
        std::cout << " read&write |            |       |   drw  |" << std::endl;
    }

    void print_help() {
        std::cout << "Usage: " << std::endl;
        std::cout << "\thost.exe <XCLBIN File> <target> <num_of_accesses> <traffic_pattern> [<random_access_range>]" << std::endl;
        std::cout << "\t\t<XCLBIN File>: path to the xclbin file" << std::endl;
        std::cout << "\t\t<target>: sw_emu, hw_emu, hw" << std::endl;
        std::cout << "\t\t<num_of_accesses>: number of memory accesses. Each access is 512-bit wide. Maximum: " << BUFFER_SIZE << std::endl;
        std::cout << "\t\t<traffic_pattern>: "
                     "r for read, w for write; s for sequential, d for random, b for sequential burst" << std::endl;
        std::cout << "\t\t<random_access_range> (optional): address range of random access. Default: "<< DEFAULT_RANDOM_RANGE << std::endl;
    }

    void parse_pattern(std::string options) {
        unsigned readwrite = 0; // one-hot encoding: 1 for read, 2 for write
        unsigned mode = 0; // one-hot encoding: 1 for sequential, 2 for burst, 4 for random
        for (auto &&c : options) {
            switch (c) {
                case 'r':
                    readwrite |= 1;
                    break;
                case 'w':
                    readwrite |= 2;
                    break;
                case 's':
                    mode |= 1;
                    break;
                case 'b':
                    mode |= 2;
                    break;
                case 'd':
                    mode |= 4;
                    break;
                default:
                    std::cout << "[ERROR]: invalid traffic pattern option \"" << c << "\"" << std::endl;
                    print_help_traffic_pattern();
                    exit(EXIT_FAILURE);
            }
        }
        if (readwrite == 0) {
            std::cout << "[ERROR]: invalid traffic pattern option\"" << options << "\": no read or write selected" << std::endl;
            print_help_traffic_pattern();
            exit(EXIT_FAILURE);
        }
        if (mode == 0) {
            std::cout << "[ERROR]: invalid traffic pattern option\"" << options << "\": no sequential, burst, or random selected" << std::endl;
            print_help_traffic_pattern();
            exit(EXIT_FAILURE);
        }
        if (__builtin_popcount(mode) > 1) {
            std::cout << "[ERROR]: invalid traffic pattern option\"" << options << "\": multiple sequential, burst, or random selected" << std::endl;
            print_help_traffic_pattern();
            exit(EXIT_FAILURE);
        }
        if (readwrite == 1) {
            this->traffic_pattern = mode == 1 ? HK_PATTERN_SEQ_RD :
                                    mode == 2 ? HK_PATTERN_SEQ_RD_BURST :
                                                HK_PATTERN_RANDOM_RD;
            return;
        }
        if (readwrite == 2) {
            this->traffic_pattern = mode == 1 ? HK_PATTERN_SEQ_WR :
                                    mode == 2 ? HK_PATTERN_SEQ_WR_BURST :
                                                HK_PATTERN_RANDOM_WR;
            return;
        }
        if (readwrite == 3) {
            if (mode != 4) {
                std::cout << "[ERROR]: invalid traffic pattern option\"" << options << "\": read&write must be random" << std::endl;
                print_help_traffic_pattern();
                exit(EXIT_FAILURE);
            }
            this->traffic_pattern = HK_PATTERN_RANDOM_RDWR;
        }
    }

    void parse(int argc, char** argv) {
        if (argc < 5 || argc > 6) {
            print_help();
            exit(EXIT_FAILURE);
        }
        this->xclbin_path = argv[1];
        this->exec_target = argv[2];
        if (this->exec_target != "sw_emu" && this->exec_target != "hw_emu" && this->exec_target != "hw") {
            std::cout << "[ERROR]: invalid target \"" << this->exec_target << "\"" << std::endl;
            std::cout << "         must be sw_emu, hw_emu, or hw" << std::endl;
            exit(EXIT_FAILURE);
        }
        this->num_of_accesses = std::stoi(argv[3]);
        if (this->num_of_accesses > BUFFER_SIZE) {
            std::cout << "[ERROR]: number of accesses too large: " << this->num_of_accesses << std::endl;
            std::cout << "         maximum: " << BUFFER_SIZE << std::endl;
            exit(EXIT_FAILURE);
        }
        this->parse_pattern(argv[4]);
        if (argc == 6 && this->traffic_pattern > HK_PATTERN_SEQ_WR_BURST) {
            this->random_access_range = std::stoi(argv[5]);
            if (this->random_access_range > BUFFER_SIZE) {
                std::cout << "[ERROR]: random access range too large: " << this->random_access_range << std::endl;
                std::cout << "         maximum: " << BUFFER_SIZE << std::endl;
                exit(EXIT_FAILURE);
            }
        } else {
            std::cout << "[INFO]: random access range not specified, using default: " << DEFAULT_RANDOM_RANGE << std::endl;
            this->random_access_range = DEFAULT_RANDOM_RANGE;
        }
    }
};

//===================================================================
// main function
//===================================================================
int main(int argc, char** argv) {

    Arguments args;
    args.parse(argc, argv);

    // set emulation environment
    if (args.exec_target == "sw_emu" || args.exec_target == "hw_emu") {
        setenv("XCL_EMULATION_MODE", args.exec_target.c_str(), true);
        std::cout << "[INFO]: XCL_EMULATION_MODE is set to " << getenv("XCL_EMULATION_MODE") << std::endl;;
    } else if (args.exec_target == "hw") {
        unsetenv("XCL_EMULATION_MODE");
    }

    // auto devices = xcl::get_xil_devices();
    // std::cout << "[INFO]: available devices:\n";
    // for (auto &&dev : devices) {
    //     std::cout << dev.getInfo<CL_DEVICE_NAME>() << std::endl;
    // }

    // find the correct device
    bool found_device = false;
    cl::Device device;
    std::cout << "[INFO]: Scanning installed devices to locate " << DEVICE_NAME << std::endl;
    auto devices = xcl::get_xil_devices();
    for (auto &&dev : devices) {
        if (dev.getInfo<CL_DEVICE_NAME>() == DEVICE_NAME) {
            device = dev;
            found_device = true;
            break;
        }
    }
    if (!found_device) {
        std::cout << "[ERROR]: Failed to find " << DEVICE_NAME << std::endl;
        std::cout << "[INFO]: available devices:\n";
        for (auto &&dev : devices) {
            std::cout << "        " << dev.getInfo<CL_DEVICE_NAME>() << '\n';
        }
        std::cout << "[INFO]: Aborting host program" << std::endl;
        exit(EXIT_FAILURE);
    }

    // load xclbin and setup command queue
    cl_int err;
    std::string binaryFile = argv[1];
    std::cout << "[INFO]: Loading " << binaryFile << std::endl;
    auto file = xcl::read_binary_file(binaryFile);
    cl::Context context(device, NULL, NULL, NULL);
    cl::Program::Binaries binaries{{file.data(), file.size()}};
    OCL_CHECK(err, cl::Program program(context, {device}, binaries, NULL, &err))
    OCL_CHECK(err, cl::CommandQueue cmdq(
        context, device,
        CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE | CL_QUEUE_PROFILING_ENABLE,
        &err));

    // create kernels
    cl::Kernel kernels[32];
    for (int i = 0; i < 32; ++i) {
        std::string kernel_name = i < 10 ? ("hbm_kernel:{hbm_kernel_0" + std::to_string(i) + "}") :
                                           ("hbm_kernel:{hbm_kernel_" + std::to_string(i) + "}");
        OCL_CHECK(err, kernels[i] = cl::Kernel(program, kernel_name.c_str(), &err));
    }

    std::cout << "[INFO]: Allocate Buffer on Device Memory\n";

    const unsigned data_size = BUFFER_SIZE * MEM_PACK_SIZE;
    const unsigned data_size_bytes = data_size * sizeof(unsigned);
    if (data_size_bytes > 256 * 1024 * 1024) {
        std::cout << "[ERROR]: data size exceeds HBM capacity " << std::endl;
        std::cout << "         maximum: 256 MB per channel " << std::endl;
        exit(EXIT_FAILURE);
    }
    std::vector<int, aligned_allocator<int>> data[32];
    cl::Buffer data_buf[32];
    for (int i = 0; i < 32; ++i) {
        data[i].resize(data_size);
        CL_CREATE_EXT_PTR(data_ext_ptr[i], data[i].data(), HBM[i])
        OCL_CHECK(err, data_buf[i] = CL_BUFFER(context, data_size_bytes, data_ext_ptr[i], err));
        OCL_CHECK(err, err = cmdq.enqueueMigrateMemObjects({data_buf[i]}, 0)); // 0 means from host
    }
    cmdq.finish();

    std::cout << "[INFO]: Start benchmarking\n";
    double throughput_MBPS[32][32];
    for (int kernel_id = 0; kernel_id < 32; ++kernel_id) {
        OCL_CHECK(err, err = kernels[kernel_id].setArg(1, args.num_of_accesses));
        OCL_CHECK(err, err = kernels[kernel_id].setArg(2, args.traffic_pattern));
        OCL_CHECK(err, err = kernels[kernel_id].setArg(3, args.random_access_range));
        for (int hbm_id = 0; hbm_id < 32; ++hbm_id) {
            OCL_CHECK(err, err = kernels[kernel_id].setArg(0, data_buf[hbm_id]));
            double avg_duration_us = 0;
            for(int i = 0; i < NUM_RUNS; i++) {
                auto start = std::chrono::high_resolution_clock::now();
                OCL_CHECK(err, err = cmdq.enqueueTask(kernels[kernel_id]));
                cmdq.finish();
                auto end = std::chrono::high_resolution_clock::now();
                double duration_us = std::chrono::duration<double, std::micro>(end - start).count();
                avg_duration_us += duration_us / NUM_RUNS;
            }
            throughput_MBPS[kernel_id][hbm_id] = data_size_bytes / avg_duration_us;
            throughput_MBPS[kernel_id][hbm_id] *= (1000.0/1024.0);
            throughput_MBPS[kernel_id][hbm_id] *= (1000.0/1024.0);
        }
    }

    std::cout << "[INFO]: Benchmarking finished." << std::endl;
    std::cout << "[INFO]: Throughput (MB/s) between each kernel and HBM channel:" << std::endl;
    std::cout << "hbm id \\ kernel id,";
    for (int kernel_id = 0; kernel_id < 32; ++kernel_id) {
        std::cout << kernel_id << ",";
    }
    std::cout << std::endl;
    for (int hbm_id = 0; hbm_id < 32; ++hbm_id) {
        std::cout << hbm_id << ",";
        for (int kernel_id = 0; kernel_id < 32; ++kernel_id) {
            std::cout << throughput_MBPS[kernel_id][hbm_id] << ",";
        }
        std::cout << std::endl;
    }
    return 0;
}
