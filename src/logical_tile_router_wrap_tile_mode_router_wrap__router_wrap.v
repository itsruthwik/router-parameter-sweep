//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: router_wrap
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Fri Apr 11 17:54:31 2025
//-------------------------------------------
//----- Default net type -----
`default_nettype none

// ----- Verilog module for logical_tile_router_wrap_tile_mode_router_wrap__router_wrap -----
module logical_tile_router_wrap_tile_mode_router_wrap__router_wrap(clk_usr,
                                                                   pReset,
                                                                   prog_clk,
                                                                   router_wrap_clk_noc,
                                                                   router_wrap_rst_n,
                                                                   router_wrap_data_in,
                                                                   router_wrap_dest_in,
                                                                   router_wrap_is_tail_in,
                                                                   router_wrap_send_in,
                                                                   router_wrap_credit_in,
                                                                   router_wrap_router_address,
                                                                   router_wrap_axis_in_tvalid,
                                                                   router_wrap_axis_in_tdata,
                                                                   router_wrap_axis_in_tlast,
                                                                   router_wrap_axis_in_tid,
                                                                   router_wrap_axis_in_tdest,
                                                                   router_wrap_axis_out_tready,
                                                                   ccff_head,
                                                                   router_wrap_credit_out,
                                                                   router_wrap_data_out,
                                                                   router_wrap_dest_out,
                                                                   router_wrap_is_tail_out,
                                                                   router_wrap_send_out,
                                                                   router_wrap_axis_in_tready,
                                                                   router_wrap_axis_out_tvalid,
                                                                   router_wrap_axis_out_tdata,
                                                                   router_wrap_axis_out_tlast,
                                                                   router_wrap_axis_out_tid,
                                                                   router_wrap_axis_out_tdest,
                                                                   ccff_tail,
                                                                   router_wrap_clk_usr);
//----- GLOBAL PORTS -----
input [0:0] clk_usr;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] router_wrap_clk_noc;
//----- INPUT PORTS -----
input [0:0] router_wrap_rst_n;
//----- INPUT PORTS -----
input [0:127] router_wrap_data_in;
//----- INPUT PORTS -----
input [0:23] router_wrap_dest_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_is_tail_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_send_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_credit_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_router_address;
//----- INPUT PORTS -----
input [0:0] router_wrap_axis_in_tvalid;
//----- INPUT PORTS -----
input [0:127] router_wrap_axis_in_tdata;
//----- INPUT PORTS -----
input [0:0] router_wrap_axis_in_tlast;
//----- INPUT PORTS -----
input [0:1] router_wrap_axis_in_tid;
//----- INPUT PORTS -----
input [0:3] router_wrap_axis_in_tdest;
//----- INPUT PORTS -----
input [0:0] router_wrap_axis_out_tready;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_credit_out;
//----- OUTPUT PORTS -----
output [0:127] router_wrap_data_out;
//----- OUTPUT PORTS -----
output [0:23] router_wrap_dest_out;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_is_tail_out;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_send_out;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_axis_in_tready;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_axis_out_tvalid;
//----- OUTPUT PORTS -----
output [0:127] router_wrap_axis_out_tdata;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_axis_out_tlast;
//----- OUTPUT PORTS -----
output [0:1] router_wrap_axis_out_tid;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_axis_out_tdest;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- CLOCK PORTS -----
input [0:0] router_wrap_clk_usr;

//----- BEGIN wire-connection ports -----
wire [0:0] router_wrap_clk_noc;
wire [0:0] router_wrap_rst_n;
wire [0:127] router_wrap_data_in;
wire [0:23] router_wrap_dest_in;
wire [0:3] router_wrap_is_tail_in;
wire [0:3] router_wrap_send_in;
wire [0:3] router_wrap_credit_in;
wire [0:3] router_wrap_router_address;
wire [0:0] router_wrap_axis_in_tvalid;
wire [0:127] router_wrap_axis_in_tdata;
wire [0:0] router_wrap_axis_in_tlast;
wire [0:1] router_wrap_axis_in_tid;
wire [0:3] router_wrap_axis_in_tdest;
wire [0:0] router_wrap_axis_out_tready;
wire [0:3] router_wrap_credit_out;
wire [0:127] router_wrap_data_out;
wire [0:23] router_wrap_dest_out;
wire [0:3] router_wrap_is_tail_out;
wire [0:3] router_wrap_send_out;
wire [0:0] router_wrap_axis_in_tready;
wire [0:0] router_wrap_axis_out_tvalid;
wire [0:127] router_wrap_axis_out_tdata;
wire [0:0] router_wrap_axis_out_tlast;
wire [0:1] router_wrap_axis_out_tid;
wire [0:3] router_wrap_axis_out_tdest;
wire [0:0] router_wrap_clk_usr;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:24] router_wrap_0__undriven_DISABLE_TURNS;
wire [0:63] router_wrap_0_noc_config;
wire [0:47] router_wrap_0_routing_table;
wire [0:111] router_wrap_DFFR_mem_undriven_mem_outb;
	assign router_wrap_0__undriven_DISABLE_TURNS[0:24] = {25{1'b0}};

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	router_wrap router_wrap_0_ (
		.clk_usr(clk_usr),
		.clk_noc(router_wrap_clk_noc),
		.rst_n(router_wrap_rst_n),
		.data_in(router_wrap_data_in[0:127]),
		.dest_in(router_wrap_dest_in[0:23]),
		.is_tail_in(router_wrap_is_tail_in[0:3]),
		.send_in(router_wrap_send_in[0:3]),
		.credit_in(router_wrap_credit_in[0:3]),
		.axis_in_tvalid(router_wrap_axis_in_tvalid),
		.axis_in_tdata(router_wrap_axis_in_tdata[0:127]),
		.axis_in_tlast(router_wrap_axis_in_tlast),
		.axis_in_tid(router_wrap_axis_in_tid[0:1]),
		.axis_in_tdest(router_wrap_axis_in_tdest[0:3]),
		.axis_out_tready(router_wrap_axis_out_tready),
		.router_address(router_wrap_router_address[0:3]),
		.DISABLE_TURNS(router_wrap_0__undriven_DISABLE_TURNS[0:24]),
		.routing_table(router_wrap_0_routing_table[0:47]),
		.noc_config(router_wrap_0_noc_config[0:63]),
		.credit_out(router_wrap_credit_out[0:3]),
		.data_out(router_wrap_data_out[0:127]),
		.dest_out(router_wrap_dest_out[0:23]),
		.is_tail_out(router_wrap_is_tail_out[0:3]),
		.send_out(router_wrap_send_out[0:3]),
		.axis_in_tready(router_wrap_axis_in_tready),
		.axis_out_tvalid(router_wrap_axis_out_tvalid),
		.axis_out_tdata(router_wrap_axis_out_tdata[0:127]),
		.axis_out_tlast(router_wrap_axis_out_tlast),
		.axis_out_tid(router_wrap_axis_out_tid[0:1]),
		.axis_out_tdest(router_wrap_axis_out_tdest[0:3]));

	router_wrap_DFFR_mem router_wrap_DFFR_mem (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out({router_wrap_0_routing_table[0:47], router_wrap_0_noc_config[0:63]}),
		.mem_outb(router_wrap_DFFR_mem_undriven_mem_outb[0:111]));

endmodule
// ----- END Verilog module for logical_tile_router_wrap_tile_mode_router_wrap__router_wrap -----

//----- Default net type -----
`default_nettype wire



