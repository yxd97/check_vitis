/**
* Copyright (C) 2019-2022 Xilinx, Inc
*
* Licensed under the Apache License, Version 2.0 (the "License"). You may
* not use this file except in compliance with the License. A copy of the
* License is located at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations
* under the License.
*/

#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <cstdlib>

// xcl2 includes
#include "xcl2.hpp"

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

#define DATA_SIZE 4096

std::string DEVICE_NAME = "xilinx_u280_gen3x16_xdma_base_1";

int main(int argc, char** argv) {

    // Read settings
    if (argc != 3) {
        std::cout << "[INFO]: Usage: " << argv[0] << " <XCLBIN File> <target>" << std::endl;
        exit(EXIT_FAILURE);
    }

    // set emulation environment
    std::string target = argv[2];
    if (target == "sw_emu" || target == "hw_emu") {
        setenv("XCL_EMULATION_MODE", target.c_str(), true);
        std::cout << "[INFO]: XCL_EMULATION_MODE is set to " << getenv("XCL_EMULATION_MODE") << std::endl;;
    } else if (target == "hw") {
        unsetenv("XCL_EMULATION_MODE");
    } else {
        std::cout << "[INFO]: invalid target " << target << '\n';
        std::cout << "        possible values: sw_emu, hw_emu, hw" << std::endl;
        exit(EXIT_FAILURE);
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

    // load xclbin
    cl_int err;
    std::string binaryFile = argv[1];
    std::cout << "[INFO]: Loading " << binaryFile << std::endl;
    auto file = xcl::read_binary_file(binaryFile);
    cl::Context context(device, NULL, NULL, NULL);
    cl::Program::Binaries binaries{{file.data(), file.size()}};
    OCL_CHECK(err, cl::Program program(context, {device}, binaries, NULL, &err))
    cl::Kernel krnl(program, "krnl_vadd", &err);
    OCL_CHECK(err, cl::CommandQueue cmdq(
        context, device,
        CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE | CL_QUEUE_PROFILING_ENABLE,
        &err));

    std::cout << "[INFO]: Allocate Buffer in Global Memory\n";

    // Create the test data
    std::vector<int> ref(DATA_SIZE);
    std::vector<int> out(DATA_SIZE);
    std::vector<int> in0(DATA_SIZE);
    std::vector<int> in1(DATA_SIZE);
    for (int i = 0; i < DATA_SIZE; ++i) {
        in0[i] = i;
        in1[i] = i;
        ref[i] = in0[i] + in1[i];
    }

    // Map the contents of the buffer object into device memory
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE;
    CL_CREATE_EXT_PTR(in0_ext, in0.data(), HBM[0])
    CL_CREATE_EXT_PTR(in1_ext, in1.data(), HBM[0])
    CL_CREATE_EXT_PTR(out_ext, out.data(), HBM[0])
    OCL_CHECK(err, cl::Buffer in0_buf = CL_BUFFER_RDONLY(context, vector_size_bytes, in0_ext, err));
    OCL_CHECK(err, cl::Buffer in1_buf = CL_BUFFER_RDONLY(context, vector_size_bytes, in1_ext, err));
    OCL_CHECK(err, cl::Buffer out_buf = CL_BUFFER_WRONLY(context, vector_size_bytes, out_ext, err));

    // Synchronize buffer content with device side
    std::cout << "[INFO]: Synchronize input buffer data to device global memory\n";
    OCL_CHECK(err, err = cmdq.enqueueMigrateMemObjects({in0_buf, in1_buf}, 0)); // 0 means from host

    std::cout << "[INFO]: Execution of the kernel\n";
    int argidx = 0;
    OCL_CHECK(err, err = krnl.setArg(argidx++, in0_buf));
    OCL_CHECK(err, err = krnl.setArg(argidx++, in1_buf));
    OCL_CHECK(err, err = krnl.setArg(argidx++, out_buf));
    OCL_CHECK(err, err = krnl.setArg(argidx++, DATA_SIZE));
    OCL_CHECK(err, err = cmdq.enqueueTask(krnl));
    cmdq.finish();

    // Get the output;
    std::cout << "[INFO]: Get the output data from the device" << std::endl;
    OCL_CHECK(err, err = cmdq.enqueueMigrateMemObjects({out_buf}, CL_MIGRATE_MEM_OBJECT_HOST));
    cmdq.finish();

    // Validate our results
    try {
        if (std::memcmp(out.data(), ref.data(), DATA_SIZE))
            throw std::runtime_error("[ERROR]: Value read back does not match reference");
    } catch (const std::runtime_error &e) {
        std::cout << e.what() << std::endl;
        for (int i = 0; i < DATA_SIZE; i++) {
            if (out[i] != ref[i]) {
                std::cout << "  Mismatch i = " << i << "\n"
                          << "  Ref: " << ref[i]
                          << "; Actual: " << out[i] << std::endl;
            }
        }
        std::cout << "[ERROR]: TEST FAILED" << std::endl;
        exit(EXIT_FAILURE);
    }

    std::cout << "[INFO]: TEST PASSED" << std::endl;
    return 0;
}
