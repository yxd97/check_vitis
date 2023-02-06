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

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"

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

    // find the correct device
    bool found_device = false;
    int device_idx = 0;
    if (target == "hw") {
        std::cout << "[INFO]: Scanning installed devices to locate " << DEVICE_NAME << std::endl;
        std::vector<std::string> avail_devices;
        for (int i = 0; ; i++) {
            try {
                auto device = xrt::device(i);
                if (device.get_info<xrt::info::device::name>() == DEVICE_NAME) {
                    std::cout << "        Found device at index " << i << std::endl;
                    std::cout << "        Scan finished at index " << i << std::endl;
                    found_device = true;
                    device_idx = i;
                    break;
                } else {
                    avail_devices.push_back(device.get_info<xrt::info::device::name>());
                }
            }
            catch(const std::runtime_error& e) {
                std::string err_info = e.what();
                if (err_info.find("Could not open device with index")) {
                    std::cout << "[ERROR]: Scan aborted due to std::runtime_error at index " << i << std::endl;
                    std::cout << "         std::runtime_error: " << err_info << std::endl;
                    break;
                }
            }
        }
        if (!found_device) {
            std::cout << "[ERROR]: Failed to find " << DEVICE_NAME << std::endl;
            std::cout << "[INFO]: available devices:\n";
            for (auto &&dev : avail_devices) {
                std::cout << "        " << dev << '\n';
            }
            std::cout << "[INFO]: Aborting host program" << std::endl;
            exit(EXIT_FAILURE);
        }
        std::cout << "[INFO]: Opening device " << device_idx << std::endl;
    } else {
        std::cout << "[INFO]: Device scanning skipped for emulation." << std::endl;
    }
    auto device = xrt::device(device_idx);

    // load xclbin
    std::string binaryFile = argv[1];
    std::cout << "[INFO]: Loading " << binaryFile << std::endl;
    auto uuid = device.load_xclbin(binaryFile);

    size_t vector_size_bytes = sizeof(int) * DATA_SIZE;

    auto krnl = xrt::kernel(device, uuid, "krnl_vadd");

    std::cout << "[INFO]: Allocate Buffer in Global Memory\n";
    auto bo0 = xrt::bo(device, vector_size_bytes, krnl.group_id(0));
    auto bo1 = xrt::bo(device, vector_size_bytes, krnl.group_id(1));
    auto bo_out = xrt::bo(device, vector_size_bytes, krnl.group_id(2));

    // Map the contents of the buffer object into host memory
    auto bo0_map = bo0.map<int*>();
    auto bo1_map = bo1.map<int*>();
    auto bo_out_map = bo_out.map<int*>();
    std::fill(bo0_map, bo0_map + DATA_SIZE, 0);
    std::fill(bo1_map, bo1_map + DATA_SIZE, 0);
    std::fill(bo_out_map, bo_out_map + DATA_SIZE, 0);

    // Create the test data
    int bufReference[DATA_SIZE];
    for (int i = 0; i < DATA_SIZE; ++i) {
        bo0_map[i] = i;
        bo1_map[i] = i;
        bufReference[i] = bo0_map[i] + bo1_map[i];
    }

    // Synchronize buffer content with device side
    std::cout << "[INFO]: Synchronize input buffer data to device global memory\n";

    bo0.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    bo1.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    std::cout << "[INFO]: Execution of the kernel\n";
    auto run = krnl(bo0, bo1, bo_out, DATA_SIZE);
    run.wait();

    // Get the output;
    std::cout << "[INFO]: Get the output data from the device" << std::endl;
    bo_out.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    // Validate our results
    if (std::memcmp(bo_out_map, bufReference, DATA_SIZE))
        throw std::runtime_error("[ERROR]: Value read back does not match reference");

    std::cout << "[INFO]: TEST PASSED" << std::endl;
    return 0;
}
