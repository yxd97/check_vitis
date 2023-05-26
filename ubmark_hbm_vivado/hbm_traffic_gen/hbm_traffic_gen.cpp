#include "hbm_traffic_gen.h"
#include <ap_int.h>
#include <ap_utils.h>
#ifndef __SYNTHESIS__
#include <iostream>
#endif

void seq_read(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size
) {
    #pragma HLS inline off
    seq_read_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline off
        buffer[i] = maxi[i];
    }
}

void seq_read_burst(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size
) {
    #pragma HLS inline off
    seq_read_burst_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline II=1
        buffer[i] = maxi[i];
    }
}

void seq_write(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size
) {
    #pragma HLS inline off
    seq_write_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline off
        maxi[i] = buffer[i];
    }
}

void seq_write_burst(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size
) {
    #pragma HLS inline off
    seq_write_burst_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline II=1
        maxi[i] = buffer[i];
    }
}

class LfsrRng {
    public:
        LfsrRng(unsigned seed) {
            #pragma HLS inline
            this->state = seed;
        }

        unsigned next() {
            #pragma HLS inline
            unsigned bit = (state >> 0) ^ (state >> 1) ^ (state >> 3) ^ (state >> 4);
            state = (state >> 1) | (bit << 31);
            return state;
        }

        void reset(unsigned seed) {
            #pragma HLS inline
            this->state = seed;
        }

    private:
        unsigned state;
};

void random_read(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size,
    unsigned range
) {
    #pragma HLS inline off
    LfsrRng rng(0xdeafbeef);
    rand_read_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline II=1
        buffer[i] = maxi[rng.next() % range];
    }
}

void random_write(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size,
    unsigned range
) {
    #pragma HLS inline off
    LfsrRng rng(0xdeafbeef);
    rand_write_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline II=1
        maxi[rng.next() % range] = buffer[i];
    }
}

void random_read_write(
    mem_word_t* maxi,
    mem_word_t* buffer,
    unsigned size,
    unsigned range
) {
    #pragma HLS inline off
    LfsrRng rng(0xdeafbeef);
    rand_readwrite_loop: for (unsigned i = 0; i < size; i++) {
        #pragma HLS pipeline II=1
        #pragma HLS dependence variable=maxi inter false
        if (rng.next() % 2) {
            maxi[rng.next() % range] = buffer[i];
        } else {
            buffer[i] = maxi[rng.next() % range];
        }
    }
}

void hbm_traffic_gen(
    mem_word_t* hbm,
    cmd_t cmd_buf[CMD_BUF_SIZE]
) {
    #pragma HLS INTERFACE m_axi port=hbm offset=off bundle=gmem depth=BUFFER_SIZE
    #pragma HLS INTERFACE m_axi port=cmd_buf offset=off bundle=cmd depth=CMD_BUF_SIZE
    #pragma HLS aggregate variable=hbm

    #pragma HLS INTERFACE ap_ctrl_none port=return

    mem_word_t buffer[BUFFER_SIZE];
    #pragma HLS bind_storage variable=buffer type=ram_2p impl=uram
    #pragma HLS aggregate variable=buffer

    bool exit = false;
    cmd_t pattern;
    unsigned size;
    unsigned range;
    cmd_buf[CMD_RESP_VALID] = 0;
    cmd_buf[CMD_REQ_READY] = 0;
    while (!exit) {
        #pragma HLS pipeline off

        cmd_buf[CMD_REQ_READY] = 1;
        while (!cmd_buf[CMD_REQ_VALID]) {
        }
        pattern = cmd_buf[CMD_PATTERN];
        size = cmd_buf[CMD_SIZE];
        range = cmd_buf[CMD_RANGE];
        cmd_buf[CMD_REQ_READY] = 0;
        #ifndef __SYNTHESIS__
        std::cout << "pattern: " << (int)pattern << std::endl;
        std::cout << "size: " << size << std::endl;
        std::cout << "range: " << range << std::endl;
        #endif

        switch (pattern) {
            case PATTERN_SEQ_RD:
                seq_read(hbm, buffer, size);
                break;
            case PATTERN_SEQ_RD_BURST:
                seq_read_burst(hbm, buffer, size);
                break;
            case PATTERN_SEQ_WR:
                seq_write(hbm, buffer, size);
                break;
            case PATTERN_SEQ_WR_BURST:
                seq_write_burst(hbm, buffer, size);
                break;
            case PATTERN_RANDOM_RD:
                random_read(hbm, buffer, size, range);
                break;
            case PATTERN_RANDOM_WR:
                random_write(hbm, buffer, size, range);
                break;
            case PATTERN_RANDOM_RDWR:
                random_read_write(hbm, buffer, size, range);
                break;
            default:
                break;
        }

        cmd_buf[CMD_RESP_VALID] = 1;
        while (!cmd_buf[CMD_RESP_READY]) {
        }
        cmd_buf[CMD_RESP_VALID] = 0;
        exit = cmd_buf[CMD_EXIT];
    }
}

