#ifndef HBM_KERNEL_H
#define HBM_KERNEL_H

#include <stdint.h>

const unsigned MEM_PORT_WIDTH = 256;
const unsigned MEM_PACK_SIZE = MEM_PORT_WIDTH / 32;
struct mem_word_t {
    int data[MEM_PACK_SIZE];
};

typedef unsigned cmd_t;

const unsigned BUFFER_SIZE = 1024; // 32kB

const unsigned CMD_BUF_SIZE = 1024; // 4kB

// traffic patterns
const cmd_t PATTERN_SEQ_RD = 0;
const cmd_t PATTERN_SEQ_RD_BURST = 1;
const cmd_t PATTERN_SEQ_WR = 2;
const cmd_t PATTERN_SEQ_WR_BURST = 3;
const cmd_t PATTERN_RANDOM_RD = 4;
const cmd_t PATTERN_RANDOM_WR = 5;
const cmd_t PATTERN_RANDOM_RDWR = 6;

// command buffer syntax
#define CMD_REQ_VALID   0
#define CMD_REQ_READY   1
#define CMD_RESP_VALID  2
#define CMD_RESP_READY  3
#define CMD_PATTERN     4
#define CMD_SIZE        5
#define CMD_RANGE       6
#define CMD_EXIT        7

void hbm_traffic_gen(
    mem_word_t* maxi,
    cmd_t cmd_buf[CMD_BUF_SIZE]
);


#endif
