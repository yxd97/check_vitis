#include "hbm_traffic_gen.h"
#include <vector>
#include <cassert>
#include <iostream>

void run_test(cmd_t pattern, unsigned size, unsigned range, std::string& pattern_name) {
    std::cout << "Running " << pattern_name << " test... ";
    std::vector<mem_word_t> mem_on_hbm(size);
    std::vector<cmd_t> cmd_buf(CMD_BUF_SIZE);
    cmd_buf[CMD_EXIT] = 1; // exit after one iteration
    cmd_buf[CMD_REQ_VALID] = 1;
    cmd_buf[CMD_RESP_READY] = 1;
    cmd_buf[CMD_PATTERN] = pattern;
    cmd_buf[CMD_SIZE] = size;
    cmd_buf[CMD_RANGE] = range;

    hbm_traffic_gen(mem_on_hbm.data(), cmd_buf.data());
    std::cout << "Done." << std::endl;
}


int main(int argc, char** argv) {
    unsigned size = 128;
    assert(size < BUFFER_SIZE);

    std::vector<std::string> pattern_name(7);
    pattern_name[PATTERN_SEQ_RD] = "sequential read";
    pattern_name[PATTERN_SEQ_RD_BURST] = "sequential read burst";
    pattern_name[PATTERN_SEQ_WR] = "sequential write";
    pattern_name[PATTERN_SEQ_WR_BURST] = "sequential write burst";
    pattern_name[PATTERN_RANDOM_RD] = "random read";
    pattern_name[PATTERN_RANDOM_WR] = "random write";
    pattern_name[PATTERN_RANDOM_RDWR] = "random read/write";

    std::vector<cmd_t> pattern_list = {
        PATTERN_SEQ_RD,
        PATTERN_SEQ_RD_BURST,
        PATTERN_SEQ_WR,
        PATTERN_SEQ_WR_BURST,
        PATTERN_RANDOM_RD,
        PATTERN_RANDOM_WR,
        PATTERN_RANDOM_RDWR
    };

    for (auto pattern : pattern_list) {
        run_test(pattern, size, size, pattern_name[pattern]);
    }

    return 0;
}
