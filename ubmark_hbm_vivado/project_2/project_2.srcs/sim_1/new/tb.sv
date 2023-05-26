`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/24/2023 08:55:11 PM
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
import axi_vip_pkg::*;
import design_1_axi_vip_0_1_pkg::*;
import design_1_axi_vip_1_0_pkg::*;

module tb();

// Declare AXI agents
design_1_axi_vip_1_0_passthrough_t probe_agent;
design_1_axi_vip_0_1_slv_mem_t host_agent;

// system signals
bit clk_100MHz = 0;
bit rst_n = 0;

// command buffer addresses
bit [31:0] CMD_REQ_VALID = 32'd0;
bit [31:0] CMD_REQ_READY = 32'd4;
bit [31:0] CMD_RESP_VALID = 32'd8;
bit [31:0] CMD_RESP_READY = 32'd12;
bit [31:0] CMD_PATTERN = 32'd16;
bit [31:0] CMD_SIZE = 32'd20;
bit [31:0] CMD_RANGE = 32'd24;
bit [31:0] CMD_EXIT = 32'd28;

// pattern codes
localparam PATTERN_SEQ_RD = 32'd0;
localparam PATTERN_SEQ_RD_BURST = 32'd1;
localparam PATTERN_SEQ_WR = 32'd2;
localparam PATTERN_SEQ_WR_BURST = 32'd3;
localparam PATTERN_RANDOM_RD = 32'd4;
localparam PATTERN_RANDOM_WR = 32'd5;
localparam PATTERN_RANDOM_RDWR = 32'd6;

// test size
localparam TEST_SIZE = 1024;

// command buffer
// localparam CMD_BUF_SIZE = 1024;
// bit [31:0] cmd_buf [0:CMD_BUF_SIZE-1];


// helper funcions
task tick;
  input integer cycles;
  #(cycles*10);
endtask

task reset;
    input integer cycles;
    rst_n = 0;
    tick(cycles);
    rst_n = 1;
endtask

// taken from example tb
task user_gen_wready();
    axi_ready_gen                           wready_gen;
    wready_gen = host_agent.wr_driver.create_ready("wready");
    wready_gen.set_ready_policy(XIL_AXI_READY_GEN_AFTER_VALID_OSC);
    wready_gen.set_low_time(1);
    wready_gen.set_high_time(2);
    host_agent.wr_driver.send_wready(wready_gen);
endtask

task set_mem_default_value_fixed(input bit [32-1:0] fill_payload);
    host_agent.mem_model.set_memory_fill_policy(XIL_AXI_MEMORY_FILL_FIXED);
    host_agent.mem_model.set_default_memory_value(fill_payload);
endtask

task set_mem_default_value_rand();
    host_agent.mem_model.set_memory_fill_policy(XIL_AXI_MEMORY_FILL_RANDOM);
endtask

task backdoor_mem_write(
    input xil_axi_ulong                         addr,
    input bit [32-1:0]           wr_data,
    input bit [(32/8)-1:0]       wr_strb ={(32/8){1'b1}}
);
    host_agent.mem_model.backdoor_memory_write(addr, wr_data, wr_strb);
endtask

task backdoor_mem_read(
    input xil_axi_ulong mem_rd_addr,
    output bit [32-1:0] mem_rd_data
);
    mem_rd_data= host_agent.mem_model.backdoor_memory_read(mem_rd_addr);
endtask

task run_test(
    input bit [32-1:0] pattern,
    input bit [32-1:0] size,
    input bit [32-1:0] range,
    input string test_case_name
);
    $display("Running test: %s", test_case_name);
    rst_n = 0;
    backdoor_mem_write(CMD_EXIT, 1, 1);
    backdoor_mem_write(CMD_REQ_VALID, 1, 1);
    backdoor_mem_write(CMD_RESP_READY, 1, 1);
    backdoor_mem_write(CMD_PATTERN, pattern, 1);
    backdoor_mem_write(CMD_SIZE, size, 1);
    backdoor_mem_write(CMD_RANGE, range, 1);
    tick(5);
    rst_n = 1;
    $display("Test %s done", test_case_name);
endtask

// connect the dut
design_1_wrapper dut (
    .clk_100MHz(clk_100MHz),
    .resetn(rst_n),
    .resetn_0(rst_n)
);

// test stimulus
// clock
always #5ns clk_100MHz = ~clk_100MHz;

// axi agents
bit [31:0] cmd_buf_init_value = 0;
initial begin
    // create agent instances
    probe_agent = new("probe_agent", dut.design_1_i.axi_vip_1.inst.IF);
    probe_agent.set_agent_tag("probe between kernel and hbm");
    host_agent = new("host_agent", dut.design_1_i.axi_vip_0.inst.IF);
    host_agent.set_agent_tag("host");

    // set up host
    host_agent.set_verbosity(0);
    host_agent.start_slave();

    // fill in command buffer
    set_mem_default_value_fixed(cmd_buf_init_value);

    // run tests
    run_test(PATTERN_SEQ_RD, TEST_SIZE, TEST_SIZE, "PATTERN_SEQ_RD");


end

endmodule
