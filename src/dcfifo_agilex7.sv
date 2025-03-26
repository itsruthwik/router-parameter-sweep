// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files from any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Intel Program License Subscription
// Agreement, Intel FPGA IP License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Intel and sold by
// Intel or its authorized distributors.  Please refer to the applicable
// agreement for further details.



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module  dcfifo_agilex7 #(
    parameter WIDTH = 512,
    parameter DEPTH = 8,
    parameter EXTRA_SYNC_STAGES = 0,
    parameter SHOWAHEAD = "OFF",
    parameter bit FORCE_MLAB = 0
) (
    aclr,
    data,
    rdclk,
    rdreq,
    wrclk,
    wrreq,
    q,
    rdempty,
    wrfull,
    wrusedw);

    input    aclr;
    input  [WIDTH-1:0]  data;
    input    rdclk;
    input    rdreq;
    input    wrclk;
    input    wrreq;
    output [WIDTH-1:0]  q;
    output   rdempty;
    output   wrfull;
    output [$clog2(DEPTH):0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
    tri0     aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

    wire [WIDTH-1:0] sub_wire0;
    wire  sub_wire1;
    wire  sub_wire2;
    wire [WIDTH-1:0] q = sub_wire0[WIDTH-1:0];
    wire  rdempty = sub_wire1;
    wire  wrfull = sub_wire2;

    dcfifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .EXTRA_SYNC_STAGES(EXTRA_SYNC_STAGES),
        .SHOWAHEAD(SHOWAHEAD),
        .FORCE_MLAB(FORCE_MLAB)
    ) dcfifo_component (
        .aclr(aclr),
        .data(data),
        .rdclk(rdclk),
        .rdreq(rdreq),
        .wrclk(wrclk),
        .wrreq(wrreq),
        .q(sub_wire0),
        .rdempty(sub_wire1),
        .wrfull(sub_wire2),
        .wrusedw(wrusedw)
    );

endmodule


