//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for pb_type: router_wrap_tile
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Fri Apr 11 17:54:31 2025
//-------------------------------------------
// ----- BEGIN Physical programmable logic block Verilog module: router_wrap_tile -----
//----- Default net type -----
`default_nettype none

// ----- Verilog module for logical_tile_router_wrap_tile_mode_router_wrap_tile_ -----
module logical_tile_router_wrap_tile_mode_router_wrap_tile_(clk_usr,
                                                            pReset,
                                                            prog_clk,
                                                            router_wrap_tile_clk_noc,
                                                            router_wrap_tile_rst_n,
                                                            router_wrap_tile_data_in,
                                                            router_wrap_tile_dest_in,
                                                            router_wrap_tile_is_tail_in,
                                                            router_wrap_tile_send_in,
                                                            router_wrap_tile_credit_in,
                                                            router_wrap_tile_router_address,
                                                            router_wrap_tile_axis_in_tvalid,
                                                            router_wrap_tile_axis_in_tdata,
                                                            router_wrap_tile_axis_in_tlast,
                                                            router_wrap_tile_axis_in_tid,
                                                            router_wrap_tile_axis_in_tdest,
                                                            router_wrap_tile_axis_out_tready,
                                                            router_wrap_tile_clk_usr,
                                                            ccff_head,
                                                            router_wrap_tile_credit_out,
                                                            router_wrap_tile_data_out,
                                                            router_wrap_tile_dest_out,
                                                            router_wrap_tile_is_tail_out,
                                                            router_wrap_tile_send_out,
                                                            router_wrap_tile_axis_in_tready,
                                                            router_wrap_tile_axis_out_tvalid,
                                                            router_wrap_tile_axis_out_tdata,
                                                            router_wrap_tile_axis_out_tlast,
                                                            router_wrap_tile_axis_out_tid,
                                                            router_wrap_tile_axis_out_tdest,
                                                            ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] clk_usr;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_clk_noc;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_rst_n;
//----- INPUT PORTS -----
input [0:127] router_wrap_tile_data_in;
//----- INPUT PORTS -----
input [0:23] router_wrap_tile_dest_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_tile_is_tail_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_tile_send_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_tile_credit_in;
//----- INPUT PORTS -----
input [0:3] router_wrap_tile_router_address;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_axis_in_tvalid;
//----- INPUT PORTS -----
input [0:127] router_wrap_tile_axis_in_tdata;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_axis_in_tlast;
//----- INPUT PORTS -----
input [0:1] router_wrap_tile_axis_in_tid;
//----- INPUT PORTS -----
input [0:3] router_wrap_tile_axis_in_tdest;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_axis_out_tready;
//----- INPUT PORTS -----
input [0:0] router_wrap_tile_clk_usr;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_tile_credit_out;
//----- OUTPUT PORTS -----
output [0:127] router_wrap_tile_data_out;
//----- OUTPUT PORTS -----
output [0:23] router_wrap_tile_dest_out;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_tile_is_tail_out;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_tile_send_out;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_tile_axis_in_tready;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_tile_axis_out_tvalid;
//----- OUTPUT PORTS -----
output [0:127] router_wrap_tile_axis_out_tdata;
//----- OUTPUT PORTS -----
output [0:0] router_wrap_tile_axis_out_tlast;
//----- OUTPUT PORTS -----
output [0:1] router_wrap_tile_axis_out_tid;
//----- OUTPUT PORTS -----
output [0:3] router_wrap_tile_axis_out_tdest;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:0] router_wrap_tile_clk_noc;
wire [0:0] router_wrap_tile_rst_n;
wire [0:127] router_wrap_tile_data_in;
wire [0:23] router_wrap_tile_dest_in;
wire [0:3] router_wrap_tile_is_tail_in;
wire [0:3] router_wrap_tile_send_in;
wire [0:3] router_wrap_tile_credit_in;
wire [0:3] router_wrap_tile_router_address;
wire [0:0] router_wrap_tile_axis_in_tvalid;
wire [0:127] router_wrap_tile_axis_in_tdata;
wire [0:0] router_wrap_tile_axis_in_tlast;
wire [0:1] router_wrap_tile_axis_in_tid;
wire [0:3] router_wrap_tile_axis_in_tdest;
wire [0:0] router_wrap_tile_axis_out_tready;
wire [0:0] router_wrap_tile_clk_usr;
wire [0:3] router_wrap_tile_credit_out;
wire [0:127] router_wrap_tile_data_out;
wire [0:23] router_wrap_tile_dest_out;
wire [0:3] router_wrap_tile_is_tail_out;
wire [0:3] router_wrap_tile_send_out;
wire [0:0] router_wrap_tile_axis_in_tready;
wire [0:0] router_wrap_tile_axis_out_tvalid;
wire [0:127] router_wrap_tile_axis_out_tdata;
wire [0:0] router_wrap_tile_axis_out_tlast;
wire [0:1] router_wrap_tile_axis_out_tid;
wire [0:3] router_wrap_tile_axis_out_tdest;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] direct_interc_301_out;
wire [0:0] direct_interc_302_out;
wire [0:0] direct_interc_303_out;
wire [0:0] direct_interc_304_out;
wire [0:0] direct_interc_305_out;
wire [0:0] direct_interc_306_out;
wire [0:0] direct_interc_307_out;
wire [0:0] direct_interc_308_out;
wire [0:0] direct_interc_309_out;
wire [0:0] direct_interc_310_out;
wire [0:0] direct_interc_311_out;
wire [0:0] direct_interc_312_out;
wire [0:0] direct_interc_313_out;
wire [0:0] direct_interc_314_out;
wire [0:0] direct_interc_315_out;
wire [0:0] direct_interc_316_out;
wire [0:0] direct_interc_317_out;
wire [0:0] direct_interc_318_out;
wire [0:0] direct_interc_319_out;
wire [0:0] direct_interc_320_out;
wire [0:0] direct_interc_321_out;
wire [0:0] direct_interc_322_out;
wire [0:0] direct_interc_323_out;
wire [0:0] direct_interc_324_out;
wire [0:0] direct_interc_325_out;
wire [0:0] direct_interc_326_out;
wire [0:0] direct_interc_327_out;
wire [0:0] direct_interc_328_out;
wire [0:0] direct_interc_329_out;
wire [0:0] direct_interc_330_out;
wire [0:0] direct_interc_331_out;
wire [0:0] direct_interc_332_out;
wire [0:0] direct_interc_333_out;
wire [0:0] direct_interc_334_out;
wire [0:0] direct_interc_335_out;
wire [0:0] direct_interc_336_out;
wire [0:0] direct_interc_337_out;
wire [0:0] direct_interc_338_out;
wire [0:0] direct_interc_339_out;
wire [0:0] direct_interc_340_out;
wire [0:0] direct_interc_341_out;
wire [0:0] direct_interc_342_out;
wire [0:0] direct_interc_343_out;
wire [0:0] direct_interc_344_out;
wire [0:0] direct_interc_345_out;
wire [0:0] direct_interc_346_out;
wire [0:0] direct_interc_347_out;
wire [0:0] direct_interc_348_out;
wire [0:0] direct_interc_349_out;
wire [0:0] direct_interc_350_out;
wire [0:0] direct_interc_351_out;
wire [0:0] direct_interc_352_out;
wire [0:0] direct_interc_353_out;
wire [0:0] direct_interc_354_out;
wire [0:0] direct_interc_355_out;
wire [0:0] direct_interc_356_out;
wire [0:0] direct_interc_357_out;
wire [0:0] direct_interc_358_out;
wire [0:0] direct_interc_359_out;
wire [0:0] direct_interc_360_out;
wire [0:0] direct_interc_361_out;
wire [0:0] direct_interc_362_out;
wire [0:0] direct_interc_363_out;
wire [0:0] direct_interc_364_out;
wire [0:0] direct_interc_365_out;
wire [0:0] direct_interc_366_out;
wire [0:0] direct_interc_367_out;
wire [0:0] direct_interc_368_out;
wire [0:0] direct_interc_369_out;
wire [0:0] direct_interc_370_out;
wire [0:0] direct_interc_371_out;
wire [0:0] direct_interc_372_out;
wire [0:0] direct_interc_373_out;
wire [0:0] direct_interc_374_out;
wire [0:0] direct_interc_375_out;
wire [0:0] direct_interc_376_out;
wire [0:0] direct_interc_377_out;
wire [0:0] direct_interc_378_out;
wire [0:0] direct_interc_379_out;
wire [0:0] direct_interc_380_out;
wire [0:0] direct_interc_381_out;
wire [0:0] direct_interc_382_out;
wire [0:0] direct_interc_383_out;
wire [0:0] direct_interc_384_out;
wire [0:0] direct_interc_385_out;
wire [0:0] direct_interc_386_out;
wire [0:0] direct_interc_387_out;
wire [0:0] direct_interc_388_out;
wire [0:0] direct_interc_389_out;
wire [0:0] direct_interc_390_out;
wire [0:0] direct_interc_391_out;
wire [0:0] direct_interc_392_out;
wire [0:0] direct_interc_393_out;
wire [0:0] direct_interc_394_out;
wire [0:0] direct_interc_395_out;
wire [0:0] direct_interc_396_out;
wire [0:0] direct_interc_397_out;
wire [0:0] direct_interc_398_out;
wire [0:0] direct_interc_399_out;
wire [0:0] direct_interc_400_out;
wire [0:0] direct_interc_401_out;
wire [0:0] direct_interc_402_out;
wire [0:0] direct_interc_403_out;
wire [0:0] direct_interc_404_out;
wire [0:0] direct_interc_405_out;
wire [0:0] direct_interc_406_out;
wire [0:0] direct_interc_407_out;
wire [0:0] direct_interc_408_out;
wire [0:0] direct_interc_409_out;
wire [0:0] direct_interc_410_out;
wire [0:0] direct_interc_411_out;
wire [0:0] direct_interc_412_out;
wire [0:0] direct_interc_413_out;
wire [0:0] direct_interc_414_out;
wire [0:0] direct_interc_415_out;
wire [0:0] direct_interc_416_out;
wire [0:0] direct_interc_417_out;
wire [0:0] direct_interc_418_out;
wire [0:0] direct_interc_419_out;
wire [0:0] direct_interc_420_out;
wire [0:0] direct_interc_421_out;
wire [0:0] direct_interc_422_out;
wire [0:0] direct_interc_423_out;
wire [0:0] direct_interc_424_out;
wire [0:0] direct_interc_425_out;
wire [0:0] direct_interc_426_out;
wire [0:0] direct_interc_427_out;
wire [0:0] direct_interc_428_out;
wire [0:0] direct_interc_429_out;
wire [0:0] direct_interc_430_out;
wire [0:0] direct_interc_431_out;
wire [0:0] direct_interc_432_out;
wire [0:0] direct_interc_433_out;
wire [0:0] direct_interc_434_out;
wire [0:0] direct_interc_435_out;
wire [0:0] direct_interc_436_out;
wire [0:0] direct_interc_437_out;
wire [0:0] direct_interc_438_out;
wire [0:0] direct_interc_439_out;
wire [0:0] direct_interc_440_out;
wire [0:0] direct_interc_441_out;
wire [0:0] direct_interc_442_out;
wire [0:0] direct_interc_443_out;
wire [0:0] direct_interc_444_out;
wire [0:0] direct_interc_445_out;
wire [0:0] direct_interc_446_out;
wire [0:0] direct_interc_447_out;
wire [0:0] direct_interc_448_out;
wire [0:0] direct_interc_449_out;
wire [0:0] direct_interc_450_out;
wire [0:0] direct_interc_451_out;
wire [0:0] direct_interc_452_out;
wire [0:0] direct_interc_453_out;
wire [0:0] direct_interc_454_out;
wire [0:0] direct_interc_455_out;
wire [0:0] direct_interc_456_out;
wire [0:0] direct_interc_457_out;
wire [0:0] direct_interc_458_out;
wire [0:0] direct_interc_459_out;
wire [0:0] direct_interc_460_out;
wire [0:0] direct_interc_461_out;
wire [0:0] direct_interc_462_out;
wire [0:0] direct_interc_463_out;
wire [0:0] direct_interc_464_out;
wire [0:0] direct_interc_465_out;
wire [0:0] direct_interc_466_out;
wire [0:0] direct_interc_467_out;
wire [0:0] direct_interc_468_out;
wire [0:0] direct_interc_469_out;
wire [0:0] direct_interc_470_out;
wire [0:0] direct_interc_471_out;
wire [0:0] direct_interc_472_out;
wire [0:0] direct_interc_473_out;
wire [0:0] direct_interc_474_out;
wire [0:0] direct_interc_475_out;
wire [0:0] direct_interc_476_out;
wire [0:0] direct_interc_477_out;
wire [0:0] direct_interc_478_out;
wire [0:0] direct_interc_479_out;
wire [0:0] direct_interc_480_out;
wire [0:0] direct_interc_481_out;
wire [0:0] direct_interc_482_out;
wire [0:0] direct_interc_483_out;
wire [0:0] direct_interc_484_out;
wire [0:0] direct_interc_485_out;
wire [0:0] direct_interc_486_out;
wire [0:0] direct_interc_487_out;
wire [0:0] direct_interc_488_out;
wire [0:0] direct_interc_489_out;
wire [0:0] direct_interc_490_out;
wire [0:0] direct_interc_491_out;
wire [0:0] direct_interc_492_out;
wire [0:0] direct_interc_493_out;
wire [0:0] direct_interc_494_out;
wire [0:0] direct_interc_495_out;
wire [0:0] direct_interc_496_out;
wire [0:0] direct_interc_497_out;
wire [0:0] direct_interc_498_out;
wire [0:0] direct_interc_499_out;
wire [0:0] direct_interc_500_out;
wire [0:0] direct_interc_501_out;
wire [0:0] direct_interc_502_out;
wire [0:0] direct_interc_503_out;
wire [0:0] direct_interc_504_out;
wire [0:0] direct_interc_505_out;
wire [0:0] direct_interc_506_out;
wire [0:0] direct_interc_507_out;
wire [0:0] direct_interc_508_out;
wire [0:0] direct_interc_509_out;
wire [0:0] direct_interc_510_out;
wire [0:0] direct_interc_511_out;
wire [0:0] direct_interc_512_out;
wire [0:0] direct_interc_513_out;
wire [0:0] direct_interc_514_out;
wire [0:0] direct_interc_515_out;
wire [0:0] direct_interc_516_out;
wire [0:0] direct_interc_517_out;
wire [0:0] direct_interc_518_out;
wire [0:0] direct_interc_519_out;
wire [0:0] direct_interc_520_out;
wire [0:0] direct_interc_521_out;
wire [0:0] direct_interc_522_out;
wire [0:0] direct_interc_523_out;
wire [0:0] direct_interc_524_out;
wire [0:0] direct_interc_525_out;
wire [0:0] direct_interc_526_out;
wire [0:0] direct_interc_527_out;
wire [0:0] direct_interc_528_out;
wire [0:0] direct_interc_529_out;
wire [0:0] direct_interc_530_out;
wire [0:0] direct_interc_531_out;
wire [0:0] direct_interc_532_out;
wire [0:0] direct_interc_533_out;
wire [0:0] direct_interc_534_out;
wire [0:0] direct_interc_535_out;
wire [0:0] direct_interc_536_out;
wire [0:0] direct_interc_537_out;
wire [0:0] direct_interc_538_out;
wire [0:0] direct_interc_539_out;
wire [0:0] direct_interc_540_out;
wire [0:0] direct_interc_541_out;
wire [0:0] direct_interc_542_out;
wire [0:0] direct_interc_543_out;
wire [0:0] direct_interc_544_out;
wire [0:0] direct_interc_545_out;
wire [0:0] direct_interc_546_out;
wire [0:0] direct_interc_547_out;
wire [0:0] direct_interc_548_out;
wire [0:0] direct_interc_549_out;
wire [0:0] direct_interc_550_out;
wire [0:0] direct_interc_551_out;
wire [0:0] direct_interc_552_out;
wire [0:0] direct_interc_553_out;
wire [0:0] direct_interc_554_out;
wire [0:0] direct_interc_555_out;
wire [0:0] direct_interc_556_out;
wire [0:0] direct_interc_557_out;
wire [0:0] direct_interc_558_out;
wire [0:0] direct_interc_559_out;
wire [0:0] direct_interc_560_out;
wire [0:0] direct_interc_561_out;
wire [0:0] direct_interc_562_out;
wire [0:0] direct_interc_563_out;
wire [0:0] direct_interc_564_out;
wire [0:0] direct_interc_565_out;
wire [0:0] direct_interc_566_out;
wire [0:0] direct_interc_567_out;
wire [0:0] direct_interc_568_out;
wire [0:0] direct_interc_569_out;
wire [0:0] direct_interc_570_out;
wire [0:0] direct_interc_571_out;
wire [0:0] direct_interc_572_out;
wire [0:0] direct_interc_573_out;
wire [0:0] direct_interc_574_out;
wire [0:0] direct_interc_575_out;
wire [0:0] direct_interc_576_out;
wire [0:0] direct_interc_577_out;
wire [0:0] direct_interc_578_out;
wire [0:0] direct_interc_579_out;
wire [0:0] direct_interc_580_out;
wire [0:0] direct_interc_581_out;
wire [0:0] direct_interc_582_out;
wire [0:0] direct_interc_583_out;
wire [0:0] direct_interc_584_out;
wire [0:0] direct_interc_585_out;
wire [0:0] direct_interc_586_out;
wire [0:0] direct_interc_587_out;
wire [0:0] direct_interc_588_out;
wire [0:0] direct_interc_589_out;
wire [0:0] direct_interc_590_out;
wire [0:0] direct_interc_591_out;
wire [0:0] direct_interc_592_out;
wire [0:0] direct_interc_593_out;
wire [0:0] direct_interc_594_out;
wire [0:0] direct_interc_595_out;
wire [0:0] direct_interc_596_out;
wire [0:0] direct_interc_597_out;
wire [0:0] direct_interc_598_out;
wire [0:0] direct_interc_599_out;
wire [0:0] direct_interc_600_out;
wire [0:0] direct_interc_601_out;
wire [0:0] direct_interc_602_out;
wire [0:0] direct_interc_603_out;
wire [0:0] direct_interc_604_out;
wire [0:0] direct_interc_605_out;
wire [0:0] direct_interc_606_out;
wire [0:0] direct_interc_607_out;
wire [0:0] direct_interc_608_out;
wire [0:0] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_in_tready;
wire [0:127] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata;
wire [0:3] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest;
wire [0:1] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tid;
wire [0:0] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tlast;
wire [0:0] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tvalid;
wire [0:3] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out;
wire [0:127] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out;
wire [0:23] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out;
wire [0:3] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out;
wire [0:3] logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	logical_tile_router_wrap_tile_mode_router_wrap__router_wrap logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0 (
		.clk_usr(clk_usr),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.router_wrap_clk_noc(direct_interc_301_out),
		.router_wrap_rst_n(direct_interc_302_out),
		.router_wrap_data_in({direct_interc_303_out, direct_interc_304_out, direct_interc_305_out, direct_interc_306_out, direct_interc_307_out, direct_interc_308_out, direct_interc_309_out, direct_interc_310_out, direct_interc_311_out, direct_interc_312_out, direct_interc_313_out, direct_interc_314_out, direct_interc_315_out, direct_interc_316_out, direct_interc_317_out, direct_interc_318_out, direct_interc_319_out, direct_interc_320_out, direct_interc_321_out, direct_interc_322_out, direct_interc_323_out, direct_interc_324_out, direct_interc_325_out, direct_interc_326_out, direct_interc_327_out, direct_interc_328_out, direct_interc_329_out, direct_interc_330_out, direct_interc_331_out, direct_interc_332_out, direct_interc_333_out, direct_interc_334_out, direct_interc_335_out, direct_interc_336_out, direct_interc_337_out, direct_interc_338_out, direct_interc_339_out, direct_interc_340_out, direct_interc_341_out, direct_interc_342_out, direct_interc_343_out, direct_interc_344_out, direct_interc_345_out, direct_interc_346_out, direct_interc_347_out, direct_interc_348_out, direct_interc_349_out, direct_interc_350_out, direct_interc_351_out, direct_interc_352_out, direct_interc_353_out, direct_interc_354_out, direct_interc_355_out, direct_interc_356_out, direct_interc_357_out, direct_interc_358_out, direct_interc_359_out, direct_interc_360_out, direct_interc_361_out, direct_interc_362_out, direct_interc_363_out, direct_interc_364_out, direct_interc_365_out, direct_interc_366_out, direct_interc_367_out, direct_interc_368_out, direct_interc_369_out, direct_interc_370_out, direct_interc_371_out, direct_interc_372_out, direct_interc_373_out, direct_interc_374_out, direct_interc_375_out, direct_interc_376_out, direct_interc_377_out, direct_interc_378_out, direct_interc_379_out, direct_interc_380_out, direct_interc_381_out, direct_interc_382_out, direct_interc_383_out, direct_interc_384_out, direct_interc_385_out, direct_interc_386_out, direct_interc_387_out, direct_interc_388_out, direct_interc_389_out, direct_interc_390_out, direct_interc_391_out, direct_interc_392_out, direct_interc_393_out, direct_interc_394_out, direct_interc_395_out, direct_interc_396_out, direct_interc_397_out, direct_interc_398_out, direct_interc_399_out, direct_interc_400_out, direct_interc_401_out, direct_interc_402_out, direct_interc_403_out, direct_interc_404_out, direct_interc_405_out, direct_interc_406_out, direct_interc_407_out, direct_interc_408_out, direct_interc_409_out, direct_interc_410_out, direct_interc_411_out, direct_interc_412_out, direct_interc_413_out, direct_interc_414_out, direct_interc_415_out, direct_interc_416_out, direct_interc_417_out, direct_interc_418_out, direct_interc_419_out, direct_interc_420_out, direct_interc_421_out, direct_interc_422_out, direct_interc_423_out, direct_interc_424_out, direct_interc_425_out, direct_interc_426_out, direct_interc_427_out, direct_interc_428_out, direct_interc_429_out, direct_interc_430_out}),
		.router_wrap_dest_in({direct_interc_431_out, direct_interc_432_out, direct_interc_433_out, direct_interc_434_out, direct_interc_435_out, direct_interc_436_out, direct_interc_437_out, direct_interc_438_out, direct_interc_439_out, direct_interc_440_out, direct_interc_441_out, direct_interc_442_out, direct_interc_443_out, direct_interc_444_out, direct_interc_445_out, direct_interc_446_out, direct_interc_447_out, direct_interc_448_out, direct_interc_449_out, direct_interc_450_out, direct_interc_451_out, direct_interc_452_out, direct_interc_453_out, direct_interc_454_out}),
		.router_wrap_is_tail_in({direct_interc_455_out, direct_interc_456_out, direct_interc_457_out, direct_interc_458_out}),
		.router_wrap_send_in({direct_interc_459_out, direct_interc_460_out, direct_interc_461_out, direct_interc_462_out}),
		.router_wrap_credit_in({direct_interc_463_out, direct_interc_464_out, direct_interc_465_out, direct_interc_466_out}),
		.router_wrap_router_address({direct_interc_467_out, direct_interc_468_out, direct_interc_469_out, direct_interc_470_out}),
		.router_wrap_axis_in_tvalid(direct_interc_471_out),
		.router_wrap_axis_in_tdata({direct_interc_472_out, direct_interc_473_out, direct_interc_474_out, direct_interc_475_out, direct_interc_476_out, direct_interc_477_out, direct_interc_478_out, direct_interc_479_out, direct_interc_480_out, direct_interc_481_out, direct_interc_482_out, direct_interc_483_out, direct_interc_484_out, direct_interc_485_out, direct_interc_486_out, direct_interc_487_out, direct_interc_488_out, direct_interc_489_out, direct_interc_490_out, direct_interc_491_out, direct_interc_492_out, direct_interc_493_out, direct_interc_494_out, direct_interc_495_out, direct_interc_496_out, direct_interc_497_out, direct_interc_498_out, direct_interc_499_out, direct_interc_500_out, direct_interc_501_out, direct_interc_502_out, direct_interc_503_out, direct_interc_504_out, direct_interc_505_out, direct_interc_506_out, direct_interc_507_out, direct_interc_508_out, direct_interc_509_out, direct_interc_510_out, direct_interc_511_out, direct_interc_512_out, direct_interc_513_out, direct_interc_514_out, direct_interc_515_out, direct_interc_516_out, direct_interc_517_out, direct_interc_518_out, direct_interc_519_out, direct_interc_520_out, direct_interc_521_out, direct_interc_522_out, direct_interc_523_out, direct_interc_524_out, direct_interc_525_out, direct_interc_526_out, direct_interc_527_out, direct_interc_528_out, direct_interc_529_out, direct_interc_530_out, direct_interc_531_out, direct_interc_532_out, direct_interc_533_out, direct_interc_534_out, direct_interc_535_out, direct_interc_536_out, direct_interc_537_out, direct_interc_538_out, direct_interc_539_out, direct_interc_540_out, direct_interc_541_out, direct_interc_542_out, direct_interc_543_out, direct_interc_544_out, direct_interc_545_out, direct_interc_546_out, direct_interc_547_out, direct_interc_548_out, direct_interc_549_out, direct_interc_550_out, direct_interc_551_out, direct_interc_552_out, direct_interc_553_out, direct_interc_554_out, direct_interc_555_out, direct_interc_556_out, direct_interc_557_out, direct_interc_558_out, direct_interc_559_out, direct_interc_560_out, direct_interc_561_out, direct_interc_562_out, direct_interc_563_out, direct_interc_564_out, direct_interc_565_out, direct_interc_566_out, direct_interc_567_out, direct_interc_568_out, direct_interc_569_out, direct_interc_570_out, direct_interc_571_out, direct_interc_572_out, direct_interc_573_out, direct_interc_574_out, direct_interc_575_out, direct_interc_576_out, direct_interc_577_out, direct_interc_578_out, direct_interc_579_out, direct_interc_580_out, direct_interc_581_out, direct_interc_582_out, direct_interc_583_out, direct_interc_584_out, direct_interc_585_out, direct_interc_586_out, direct_interc_587_out, direct_interc_588_out, direct_interc_589_out, direct_interc_590_out, direct_interc_591_out, direct_interc_592_out, direct_interc_593_out, direct_interc_594_out, direct_interc_595_out, direct_interc_596_out, direct_interc_597_out, direct_interc_598_out, direct_interc_599_out}),
		.router_wrap_axis_in_tlast(direct_interc_600_out),
		.router_wrap_axis_in_tid({direct_interc_601_out, direct_interc_602_out}),
		.router_wrap_axis_in_tdest({direct_interc_603_out, direct_interc_604_out, direct_interc_605_out, direct_interc_606_out}),
		.router_wrap_axis_out_tready(direct_interc_607_out),
		.ccff_head(ccff_head),
		.router_wrap_credit_out(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out[0:3]),
		.router_wrap_data_out(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[0:127]),
		.router_wrap_dest_out(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[0:23]),
		.router_wrap_is_tail_out(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out[0:3]),
		.router_wrap_send_out(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out[0:3]),
		.router_wrap_axis_in_tready(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_in_tready),
		.router_wrap_axis_out_tvalid(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tvalid),
		.router_wrap_axis_out_tdata(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[0:127]),
		.router_wrap_axis_out_tlast(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tlast),
		.router_wrap_axis_out_tid(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tid[0:1]),
		.router_wrap_axis_out_tdest(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest[0:3]),
		.ccff_tail(ccff_tail),
		.router_wrap_clk_usr(direct_interc_608_out));

	direct_interc direct_interc_0_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out[0]),
		.out(router_wrap_tile_credit_out[0]));

	direct_interc direct_interc_1_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out[1]),
		.out(router_wrap_tile_credit_out[1]));

	direct_interc direct_interc_2_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out[2]),
		.out(router_wrap_tile_credit_out[2]));

	direct_interc direct_interc_3_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_credit_out[3]),
		.out(router_wrap_tile_credit_out[3]));

	direct_interc direct_interc_4_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[0]),
		.out(router_wrap_tile_data_out[0]));

	direct_interc direct_interc_5_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[1]),
		.out(router_wrap_tile_data_out[1]));

	direct_interc direct_interc_6_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[2]),
		.out(router_wrap_tile_data_out[2]));

	direct_interc direct_interc_7_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[3]),
		.out(router_wrap_tile_data_out[3]));

	direct_interc direct_interc_8_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[4]),
		.out(router_wrap_tile_data_out[4]));

	direct_interc direct_interc_9_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[5]),
		.out(router_wrap_tile_data_out[5]));

	direct_interc direct_interc_10_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[6]),
		.out(router_wrap_tile_data_out[6]));

	direct_interc direct_interc_11_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[7]),
		.out(router_wrap_tile_data_out[7]));

	direct_interc direct_interc_12_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[8]),
		.out(router_wrap_tile_data_out[8]));

	direct_interc direct_interc_13_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[9]),
		.out(router_wrap_tile_data_out[9]));

	direct_interc direct_interc_14_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[10]),
		.out(router_wrap_tile_data_out[10]));

	direct_interc direct_interc_15_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[11]),
		.out(router_wrap_tile_data_out[11]));

	direct_interc direct_interc_16_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[12]),
		.out(router_wrap_tile_data_out[12]));

	direct_interc direct_interc_17_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[13]),
		.out(router_wrap_tile_data_out[13]));

	direct_interc direct_interc_18_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[14]),
		.out(router_wrap_tile_data_out[14]));

	direct_interc direct_interc_19_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[15]),
		.out(router_wrap_tile_data_out[15]));

	direct_interc direct_interc_20_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[16]),
		.out(router_wrap_tile_data_out[16]));

	direct_interc direct_interc_21_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[17]),
		.out(router_wrap_tile_data_out[17]));

	direct_interc direct_interc_22_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[18]),
		.out(router_wrap_tile_data_out[18]));

	direct_interc direct_interc_23_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[19]),
		.out(router_wrap_tile_data_out[19]));

	direct_interc direct_interc_24_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[20]),
		.out(router_wrap_tile_data_out[20]));

	direct_interc direct_interc_25_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[21]),
		.out(router_wrap_tile_data_out[21]));

	direct_interc direct_interc_26_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[22]),
		.out(router_wrap_tile_data_out[22]));

	direct_interc direct_interc_27_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[23]),
		.out(router_wrap_tile_data_out[23]));

	direct_interc direct_interc_28_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[24]),
		.out(router_wrap_tile_data_out[24]));

	direct_interc direct_interc_29_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[25]),
		.out(router_wrap_tile_data_out[25]));

	direct_interc direct_interc_30_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[26]),
		.out(router_wrap_tile_data_out[26]));

	direct_interc direct_interc_31_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[27]),
		.out(router_wrap_tile_data_out[27]));

	direct_interc direct_interc_32_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[28]),
		.out(router_wrap_tile_data_out[28]));

	direct_interc direct_interc_33_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[29]),
		.out(router_wrap_tile_data_out[29]));

	direct_interc direct_interc_34_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[30]),
		.out(router_wrap_tile_data_out[30]));

	direct_interc direct_interc_35_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[31]),
		.out(router_wrap_tile_data_out[31]));

	direct_interc direct_interc_36_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[32]),
		.out(router_wrap_tile_data_out[32]));

	direct_interc direct_interc_37_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[33]),
		.out(router_wrap_tile_data_out[33]));

	direct_interc direct_interc_38_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[34]),
		.out(router_wrap_tile_data_out[34]));

	direct_interc direct_interc_39_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[35]),
		.out(router_wrap_tile_data_out[35]));

	direct_interc direct_interc_40_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[36]),
		.out(router_wrap_tile_data_out[36]));

	direct_interc direct_interc_41_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[37]),
		.out(router_wrap_tile_data_out[37]));

	direct_interc direct_interc_42_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[38]),
		.out(router_wrap_tile_data_out[38]));

	direct_interc direct_interc_43_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[39]),
		.out(router_wrap_tile_data_out[39]));

	direct_interc direct_interc_44_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[40]),
		.out(router_wrap_tile_data_out[40]));

	direct_interc direct_interc_45_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[41]),
		.out(router_wrap_tile_data_out[41]));

	direct_interc direct_interc_46_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[42]),
		.out(router_wrap_tile_data_out[42]));

	direct_interc direct_interc_47_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[43]),
		.out(router_wrap_tile_data_out[43]));

	direct_interc direct_interc_48_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[44]),
		.out(router_wrap_tile_data_out[44]));

	direct_interc direct_interc_49_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[45]),
		.out(router_wrap_tile_data_out[45]));

	direct_interc direct_interc_50_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[46]),
		.out(router_wrap_tile_data_out[46]));

	direct_interc direct_interc_51_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[47]),
		.out(router_wrap_tile_data_out[47]));

	direct_interc direct_interc_52_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[48]),
		.out(router_wrap_tile_data_out[48]));

	direct_interc direct_interc_53_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[49]),
		.out(router_wrap_tile_data_out[49]));

	direct_interc direct_interc_54_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[50]),
		.out(router_wrap_tile_data_out[50]));

	direct_interc direct_interc_55_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[51]),
		.out(router_wrap_tile_data_out[51]));

	direct_interc direct_interc_56_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[52]),
		.out(router_wrap_tile_data_out[52]));

	direct_interc direct_interc_57_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[53]),
		.out(router_wrap_tile_data_out[53]));

	direct_interc direct_interc_58_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[54]),
		.out(router_wrap_tile_data_out[54]));

	direct_interc direct_interc_59_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[55]),
		.out(router_wrap_tile_data_out[55]));

	direct_interc direct_interc_60_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[56]),
		.out(router_wrap_tile_data_out[56]));

	direct_interc direct_interc_61_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[57]),
		.out(router_wrap_tile_data_out[57]));

	direct_interc direct_interc_62_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[58]),
		.out(router_wrap_tile_data_out[58]));

	direct_interc direct_interc_63_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[59]),
		.out(router_wrap_tile_data_out[59]));

	direct_interc direct_interc_64_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[60]),
		.out(router_wrap_tile_data_out[60]));

	direct_interc direct_interc_65_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[61]),
		.out(router_wrap_tile_data_out[61]));

	direct_interc direct_interc_66_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[62]),
		.out(router_wrap_tile_data_out[62]));

	direct_interc direct_interc_67_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[63]),
		.out(router_wrap_tile_data_out[63]));

	direct_interc direct_interc_68_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[64]),
		.out(router_wrap_tile_data_out[64]));

	direct_interc direct_interc_69_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[65]),
		.out(router_wrap_tile_data_out[65]));

	direct_interc direct_interc_70_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[66]),
		.out(router_wrap_tile_data_out[66]));

	direct_interc direct_interc_71_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[67]),
		.out(router_wrap_tile_data_out[67]));

	direct_interc direct_interc_72_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[68]),
		.out(router_wrap_tile_data_out[68]));

	direct_interc direct_interc_73_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[69]),
		.out(router_wrap_tile_data_out[69]));

	direct_interc direct_interc_74_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[70]),
		.out(router_wrap_tile_data_out[70]));

	direct_interc direct_interc_75_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[71]),
		.out(router_wrap_tile_data_out[71]));

	direct_interc direct_interc_76_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[72]),
		.out(router_wrap_tile_data_out[72]));

	direct_interc direct_interc_77_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[73]),
		.out(router_wrap_tile_data_out[73]));

	direct_interc direct_interc_78_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[74]),
		.out(router_wrap_tile_data_out[74]));

	direct_interc direct_interc_79_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[75]),
		.out(router_wrap_tile_data_out[75]));

	direct_interc direct_interc_80_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[76]),
		.out(router_wrap_tile_data_out[76]));

	direct_interc direct_interc_81_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[77]),
		.out(router_wrap_tile_data_out[77]));

	direct_interc direct_interc_82_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[78]),
		.out(router_wrap_tile_data_out[78]));

	direct_interc direct_interc_83_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[79]),
		.out(router_wrap_tile_data_out[79]));

	direct_interc direct_interc_84_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[80]),
		.out(router_wrap_tile_data_out[80]));

	direct_interc direct_interc_85_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[81]),
		.out(router_wrap_tile_data_out[81]));

	direct_interc direct_interc_86_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[82]),
		.out(router_wrap_tile_data_out[82]));

	direct_interc direct_interc_87_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[83]),
		.out(router_wrap_tile_data_out[83]));

	direct_interc direct_interc_88_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[84]),
		.out(router_wrap_tile_data_out[84]));

	direct_interc direct_interc_89_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[85]),
		.out(router_wrap_tile_data_out[85]));

	direct_interc direct_interc_90_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[86]),
		.out(router_wrap_tile_data_out[86]));

	direct_interc direct_interc_91_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[87]),
		.out(router_wrap_tile_data_out[87]));

	direct_interc direct_interc_92_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[88]),
		.out(router_wrap_tile_data_out[88]));

	direct_interc direct_interc_93_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[89]),
		.out(router_wrap_tile_data_out[89]));

	direct_interc direct_interc_94_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[90]),
		.out(router_wrap_tile_data_out[90]));

	direct_interc direct_interc_95_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[91]),
		.out(router_wrap_tile_data_out[91]));

	direct_interc direct_interc_96_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[92]),
		.out(router_wrap_tile_data_out[92]));

	direct_interc direct_interc_97_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[93]),
		.out(router_wrap_tile_data_out[93]));

	direct_interc direct_interc_98_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[94]),
		.out(router_wrap_tile_data_out[94]));

	direct_interc direct_interc_99_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[95]),
		.out(router_wrap_tile_data_out[95]));

	direct_interc direct_interc_100_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[96]),
		.out(router_wrap_tile_data_out[96]));

	direct_interc direct_interc_101_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[97]),
		.out(router_wrap_tile_data_out[97]));

	direct_interc direct_interc_102_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[98]),
		.out(router_wrap_tile_data_out[98]));

	direct_interc direct_interc_103_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[99]),
		.out(router_wrap_tile_data_out[99]));

	direct_interc direct_interc_104_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[100]),
		.out(router_wrap_tile_data_out[100]));

	direct_interc direct_interc_105_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[101]),
		.out(router_wrap_tile_data_out[101]));

	direct_interc direct_interc_106_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[102]),
		.out(router_wrap_tile_data_out[102]));

	direct_interc direct_interc_107_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[103]),
		.out(router_wrap_tile_data_out[103]));

	direct_interc direct_interc_108_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[104]),
		.out(router_wrap_tile_data_out[104]));

	direct_interc direct_interc_109_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[105]),
		.out(router_wrap_tile_data_out[105]));

	direct_interc direct_interc_110_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[106]),
		.out(router_wrap_tile_data_out[106]));

	direct_interc direct_interc_111_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[107]),
		.out(router_wrap_tile_data_out[107]));

	direct_interc direct_interc_112_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[108]),
		.out(router_wrap_tile_data_out[108]));

	direct_interc direct_interc_113_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[109]),
		.out(router_wrap_tile_data_out[109]));

	direct_interc direct_interc_114_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[110]),
		.out(router_wrap_tile_data_out[110]));

	direct_interc direct_interc_115_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[111]),
		.out(router_wrap_tile_data_out[111]));

	direct_interc direct_interc_116_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[112]),
		.out(router_wrap_tile_data_out[112]));

	direct_interc direct_interc_117_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[113]),
		.out(router_wrap_tile_data_out[113]));

	direct_interc direct_interc_118_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[114]),
		.out(router_wrap_tile_data_out[114]));

	direct_interc direct_interc_119_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[115]),
		.out(router_wrap_tile_data_out[115]));

	direct_interc direct_interc_120_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[116]),
		.out(router_wrap_tile_data_out[116]));

	direct_interc direct_interc_121_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[117]),
		.out(router_wrap_tile_data_out[117]));

	direct_interc direct_interc_122_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[118]),
		.out(router_wrap_tile_data_out[118]));

	direct_interc direct_interc_123_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[119]),
		.out(router_wrap_tile_data_out[119]));

	direct_interc direct_interc_124_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[120]),
		.out(router_wrap_tile_data_out[120]));

	direct_interc direct_interc_125_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[121]),
		.out(router_wrap_tile_data_out[121]));

	direct_interc direct_interc_126_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[122]),
		.out(router_wrap_tile_data_out[122]));

	direct_interc direct_interc_127_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[123]),
		.out(router_wrap_tile_data_out[123]));

	direct_interc direct_interc_128_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[124]),
		.out(router_wrap_tile_data_out[124]));

	direct_interc direct_interc_129_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[125]),
		.out(router_wrap_tile_data_out[125]));

	direct_interc direct_interc_130_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[126]),
		.out(router_wrap_tile_data_out[126]));

	direct_interc direct_interc_131_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_data_out[127]),
		.out(router_wrap_tile_data_out[127]));

	direct_interc direct_interc_132_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[0]),
		.out(router_wrap_tile_dest_out[0]));

	direct_interc direct_interc_133_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[1]),
		.out(router_wrap_tile_dest_out[1]));

	direct_interc direct_interc_134_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[2]),
		.out(router_wrap_tile_dest_out[2]));

	direct_interc direct_interc_135_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[3]),
		.out(router_wrap_tile_dest_out[3]));

	direct_interc direct_interc_136_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[4]),
		.out(router_wrap_tile_dest_out[4]));

	direct_interc direct_interc_137_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[5]),
		.out(router_wrap_tile_dest_out[5]));

	direct_interc direct_interc_138_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[6]),
		.out(router_wrap_tile_dest_out[6]));

	direct_interc direct_interc_139_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[7]),
		.out(router_wrap_tile_dest_out[7]));

	direct_interc direct_interc_140_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[8]),
		.out(router_wrap_tile_dest_out[8]));

	direct_interc direct_interc_141_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[9]),
		.out(router_wrap_tile_dest_out[9]));

	direct_interc direct_interc_142_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[10]),
		.out(router_wrap_tile_dest_out[10]));

	direct_interc direct_interc_143_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[11]),
		.out(router_wrap_tile_dest_out[11]));

	direct_interc direct_interc_144_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[12]),
		.out(router_wrap_tile_dest_out[12]));

	direct_interc direct_interc_145_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[13]),
		.out(router_wrap_tile_dest_out[13]));

	direct_interc direct_interc_146_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[14]),
		.out(router_wrap_tile_dest_out[14]));

	direct_interc direct_interc_147_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[15]),
		.out(router_wrap_tile_dest_out[15]));

	direct_interc direct_interc_148_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[16]),
		.out(router_wrap_tile_dest_out[16]));

	direct_interc direct_interc_149_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[17]),
		.out(router_wrap_tile_dest_out[17]));

	direct_interc direct_interc_150_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[18]),
		.out(router_wrap_tile_dest_out[18]));

	direct_interc direct_interc_151_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[19]),
		.out(router_wrap_tile_dest_out[19]));

	direct_interc direct_interc_152_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[20]),
		.out(router_wrap_tile_dest_out[20]));

	direct_interc direct_interc_153_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[21]),
		.out(router_wrap_tile_dest_out[21]));

	direct_interc direct_interc_154_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[22]),
		.out(router_wrap_tile_dest_out[22]));

	direct_interc direct_interc_155_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_dest_out[23]),
		.out(router_wrap_tile_dest_out[23]));

	direct_interc direct_interc_156_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out[0]),
		.out(router_wrap_tile_is_tail_out[0]));

	direct_interc direct_interc_157_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out[1]),
		.out(router_wrap_tile_is_tail_out[1]));

	direct_interc direct_interc_158_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out[2]),
		.out(router_wrap_tile_is_tail_out[2]));

	direct_interc direct_interc_159_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_is_tail_out[3]),
		.out(router_wrap_tile_is_tail_out[3]));

	direct_interc direct_interc_160_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out[0]),
		.out(router_wrap_tile_send_out[0]));

	direct_interc direct_interc_161_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out[1]),
		.out(router_wrap_tile_send_out[1]));

	direct_interc direct_interc_162_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out[2]),
		.out(router_wrap_tile_send_out[2]));

	direct_interc direct_interc_163_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_send_out[3]),
		.out(router_wrap_tile_send_out[3]));

	direct_interc direct_interc_164_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_in_tready),
		.out(router_wrap_tile_axis_in_tready));

	direct_interc direct_interc_165_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tvalid),
		.out(router_wrap_tile_axis_out_tvalid));

	direct_interc direct_interc_166_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[0]),
		.out(router_wrap_tile_axis_out_tdata[0]));

	direct_interc direct_interc_167_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[1]),
		.out(router_wrap_tile_axis_out_tdata[1]));

	direct_interc direct_interc_168_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[2]),
		.out(router_wrap_tile_axis_out_tdata[2]));

	direct_interc direct_interc_169_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[3]),
		.out(router_wrap_tile_axis_out_tdata[3]));

	direct_interc direct_interc_170_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[4]),
		.out(router_wrap_tile_axis_out_tdata[4]));

	direct_interc direct_interc_171_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[5]),
		.out(router_wrap_tile_axis_out_tdata[5]));

	direct_interc direct_interc_172_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[6]),
		.out(router_wrap_tile_axis_out_tdata[6]));

	direct_interc direct_interc_173_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[7]),
		.out(router_wrap_tile_axis_out_tdata[7]));

	direct_interc direct_interc_174_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[8]),
		.out(router_wrap_tile_axis_out_tdata[8]));

	direct_interc direct_interc_175_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[9]),
		.out(router_wrap_tile_axis_out_tdata[9]));

	direct_interc direct_interc_176_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[10]),
		.out(router_wrap_tile_axis_out_tdata[10]));

	direct_interc direct_interc_177_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[11]),
		.out(router_wrap_tile_axis_out_tdata[11]));

	direct_interc direct_interc_178_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[12]),
		.out(router_wrap_tile_axis_out_tdata[12]));

	direct_interc direct_interc_179_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[13]),
		.out(router_wrap_tile_axis_out_tdata[13]));

	direct_interc direct_interc_180_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[14]),
		.out(router_wrap_tile_axis_out_tdata[14]));

	direct_interc direct_interc_181_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[15]),
		.out(router_wrap_tile_axis_out_tdata[15]));

	direct_interc direct_interc_182_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[16]),
		.out(router_wrap_tile_axis_out_tdata[16]));

	direct_interc direct_interc_183_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[17]),
		.out(router_wrap_tile_axis_out_tdata[17]));

	direct_interc direct_interc_184_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[18]),
		.out(router_wrap_tile_axis_out_tdata[18]));

	direct_interc direct_interc_185_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[19]),
		.out(router_wrap_tile_axis_out_tdata[19]));

	direct_interc direct_interc_186_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[20]),
		.out(router_wrap_tile_axis_out_tdata[20]));

	direct_interc direct_interc_187_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[21]),
		.out(router_wrap_tile_axis_out_tdata[21]));

	direct_interc direct_interc_188_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[22]),
		.out(router_wrap_tile_axis_out_tdata[22]));

	direct_interc direct_interc_189_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[23]),
		.out(router_wrap_tile_axis_out_tdata[23]));

	direct_interc direct_interc_190_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[24]),
		.out(router_wrap_tile_axis_out_tdata[24]));

	direct_interc direct_interc_191_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[25]),
		.out(router_wrap_tile_axis_out_tdata[25]));

	direct_interc direct_interc_192_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[26]),
		.out(router_wrap_tile_axis_out_tdata[26]));

	direct_interc direct_interc_193_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[27]),
		.out(router_wrap_tile_axis_out_tdata[27]));

	direct_interc direct_interc_194_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[28]),
		.out(router_wrap_tile_axis_out_tdata[28]));

	direct_interc direct_interc_195_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[29]),
		.out(router_wrap_tile_axis_out_tdata[29]));

	direct_interc direct_interc_196_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[30]),
		.out(router_wrap_tile_axis_out_tdata[30]));

	direct_interc direct_interc_197_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[31]),
		.out(router_wrap_tile_axis_out_tdata[31]));

	direct_interc direct_interc_198_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[32]),
		.out(router_wrap_tile_axis_out_tdata[32]));

	direct_interc direct_interc_199_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[33]),
		.out(router_wrap_tile_axis_out_tdata[33]));

	direct_interc direct_interc_200_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[34]),
		.out(router_wrap_tile_axis_out_tdata[34]));

	direct_interc direct_interc_201_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[35]),
		.out(router_wrap_tile_axis_out_tdata[35]));

	direct_interc direct_interc_202_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[36]),
		.out(router_wrap_tile_axis_out_tdata[36]));

	direct_interc direct_interc_203_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[37]),
		.out(router_wrap_tile_axis_out_tdata[37]));

	direct_interc direct_interc_204_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[38]),
		.out(router_wrap_tile_axis_out_tdata[38]));

	direct_interc direct_interc_205_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[39]),
		.out(router_wrap_tile_axis_out_tdata[39]));

	direct_interc direct_interc_206_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[40]),
		.out(router_wrap_tile_axis_out_tdata[40]));

	direct_interc direct_interc_207_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[41]),
		.out(router_wrap_tile_axis_out_tdata[41]));

	direct_interc direct_interc_208_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[42]),
		.out(router_wrap_tile_axis_out_tdata[42]));

	direct_interc direct_interc_209_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[43]),
		.out(router_wrap_tile_axis_out_tdata[43]));

	direct_interc direct_interc_210_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[44]),
		.out(router_wrap_tile_axis_out_tdata[44]));

	direct_interc direct_interc_211_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[45]),
		.out(router_wrap_tile_axis_out_tdata[45]));

	direct_interc direct_interc_212_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[46]),
		.out(router_wrap_tile_axis_out_tdata[46]));

	direct_interc direct_interc_213_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[47]),
		.out(router_wrap_tile_axis_out_tdata[47]));

	direct_interc direct_interc_214_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[48]),
		.out(router_wrap_tile_axis_out_tdata[48]));

	direct_interc direct_interc_215_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[49]),
		.out(router_wrap_tile_axis_out_tdata[49]));

	direct_interc direct_interc_216_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[50]),
		.out(router_wrap_tile_axis_out_tdata[50]));

	direct_interc direct_interc_217_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[51]),
		.out(router_wrap_tile_axis_out_tdata[51]));

	direct_interc direct_interc_218_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[52]),
		.out(router_wrap_tile_axis_out_tdata[52]));

	direct_interc direct_interc_219_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[53]),
		.out(router_wrap_tile_axis_out_tdata[53]));

	direct_interc direct_interc_220_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[54]),
		.out(router_wrap_tile_axis_out_tdata[54]));

	direct_interc direct_interc_221_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[55]),
		.out(router_wrap_tile_axis_out_tdata[55]));

	direct_interc direct_interc_222_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[56]),
		.out(router_wrap_tile_axis_out_tdata[56]));

	direct_interc direct_interc_223_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[57]),
		.out(router_wrap_tile_axis_out_tdata[57]));

	direct_interc direct_interc_224_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[58]),
		.out(router_wrap_tile_axis_out_tdata[58]));

	direct_interc direct_interc_225_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[59]),
		.out(router_wrap_tile_axis_out_tdata[59]));

	direct_interc direct_interc_226_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[60]),
		.out(router_wrap_tile_axis_out_tdata[60]));

	direct_interc direct_interc_227_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[61]),
		.out(router_wrap_tile_axis_out_tdata[61]));

	direct_interc direct_interc_228_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[62]),
		.out(router_wrap_tile_axis_out_tdata[62]));

	direct_interc direct_interc_229_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[63]),
		.out(router_wrap_tile_axis_out_tdata[63]));

	direct_interc direct_interc_230_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[64]),
		.out(router_wrap_tile_axis_out_tdata[64]));

	direct_interc direct_interc_231_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[65]),
		.out(router_wrap_tile_axis_out_tdata[65]));

	direct_interc direct_interc_232_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[66]),
		.out(router_wrap_tile_axis_out_tdata[66]));

	direct_interc direct_interc_233_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[67]),
		.out(router_wrap_tile_axis_out_tdata[67]));

	direct_interc direct_interc_234_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[68]),
		.out(router_wrap_tile_axis_out_tdata[68]));

	direct_interc direct_interc_235_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[69]),
		.out(router_wrap_tile_axis_out_tdata[69]));

	direct_interc direct_interc_236_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[70]),
		.out(router_wrap_tile_axis_out_tdata[70]));

	direct_interc direct_interc_237_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[71]),
		.out(router_wrap_tile_axis_out_tdata[71]));

	direct_interc direct_interc_238_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[72]),
		.out(router_wrap_tile_axis_out_tdata[72]));

	direct_interc direct_interc_239_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[73]),
		.out(router_wrap_tile_axis_out_tdata[73]));

	direct_interc direct_interc_240_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[74]),
		.out(router_wrap_tile_axis_out_tdata[74]));

	direct_interc direct_interc_241_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[75]),
		.out(router_wrap_tile_axis_out_tdata[75]));

	direct_interc direct_interc_242_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[76]),
		.out(router_wrap_tile_axis_out_tdata[76]));

	direct_interc direct_interc_243_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[77]),
		.out(router_wrap_tile_axis_out_tdata[77]));

	direct_interc direct_interc_244_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[78]),
		.out(router_wrap_tile_axis_out_tdata[78]));

	direct_interc direct_interc_245_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[79]),
		.out(router_wrap_tile_axis_out_tdata[79]));

	direct_interc direct_interc_246_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[80]),
		.out(router_wrap_tile_axis_out_tdata[80]));

	direct_interc direct_interc_247_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[81]),
		.out(router_wrap_tile_axis_out_tdata[81]));

	direct_interc direct_interc_248_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[82]),
		.out(router_wrap_tile_axis_out_tdata[82]));

	direct_interc direct_interc_249_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[83]),
		.out(router_wrap_tile_axis_out_tdata[83]));

	direct_interc direct_interc_250_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[84]),
		.out(router_wrap_tile_axis_out_tdata[84]));

	direct_interc direct_interc_251_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[85]),
		.out(router_wrap_tile_axis_out_tdata[85]));

	direct_interc direct_interc_252_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[86]),
		.out(router_wrap_tile_axis_out_tdata[86]));

	direct_interc direct_interc_253_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[87]),
		.out(router_wrap_tile_axis_out_tdata[87]));

	direct_interc direct_interc_254_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[88]),
		.out(router_wrap_tile_axis_out_tdata[88]));

	direct_interc direct_interc_255_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[89]),
		.out(router_wrap_tile_axis_out_tdata[89]));

	direct_interc direct_interc_256_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[90]),
		.out(router_wrap_tile_axis_out_tdata[90]));

	direct_interc direct_interc_257_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[91]),
		.out(router_wrap_tile_axis_out_tdata[91]));

	direct_interc direct_interc_258_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[92]),
		.out(router_wrap_tile_axis_out_tdata[92]));

	direct_interc direct_interc_259_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[93]),
		.out(router_wrap_tile_axis_out_tdata[93]));

	direct_interc direct_interc_260_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[94]),
		.out(router_wrap_tile_axis_out_tdata[94]));

	direct_interc direct_interc_261_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[95]),
		.out(router_wrap_tile_axis_out_tdata[95]));

	direct_interc direct_interc_262_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[96]),
		.out(router_wrap_tile_axis_out_tdata[96]));

	direct_interc direct_interc_263_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[97]),
		.out(router_wrap_tile_axis_out_tdata[97]));

	direct_interc direct_interc_264_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[98]),
		.out(router_wrap_tile_axis_out_tdata[98]));

	direct_interc direct_interc_265_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[99]),
		.out(router_wrap_tile_axis_out_tdata[99]));

	direct_interc direct_interc_266_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[100]),
		.out(router_wrap_tile_axis_out_tdata[100]));

	direct_interc direct_interc_267_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[101]),
		.out(router_wrap_tile_axis_out_tdata[101]));

	direct_interc direct_interc_268_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[102]),
		.out(router_wrap_tile_axis_out_tdata[102]));

	direct_interc direct_interc_269_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[103]),
		.out(router_wrap_tile_axis_out_tdata[103]));

	direct_interc direct_interc_270_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[104]),
		.out(router_wrap_tile_axis_out_tdata[104]));

	direct_interc direct_interc_271_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[105]),
		.out(router_wrap_tile_axis_out_tdata[105]));

	direct_interc direct_interc_272_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[106]),
		.out(router_wrap_tile_axis_out_tdata[106]));

	direct_interc direct_interc_273_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[107]),
		.out(router_wrap_tile_axis_out_tdata[107]));

	direct_interc direct_interc_274_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[108]),
		.out(router_wrap_tile_axis_out_tdata[108]));

	direct_interc direct_interc_275_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[109]),
		.out(router_wrap_tile_axis_out_tdata[109]));

	direct_interc direct_interc_276_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[110]),
		.out(router_wrap_tile_axis_out_tdata[110]));

	direct_interc direct_interc_277_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[111]),
		.out(router_wrap_tile_axis_out_tdata[111]));

	direct_interc direct_interc_278_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[112]),
		.out(router_wrap_tile_axis_out_tdata[112]));

	direct_interc direct_interc_279_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[113]),
		.out(router_wrap_tile_axis_out_tdata[113]));

	direct_interc direct_interc_280_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[114]),
		.out(router_wrap_tile_axis_out_tdata[114]));

	direct_interc direct_interc_281_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[115]),
		.out(router_wrap_tile_axis_out_tdata[115]));

	direct_interc direct_interc_282_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[116]),
		.out(router_wrap_tile_axis_out_tdata[116]));

	direct_interc direct_interc_283_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[117]),
		.out(router_wrap_tile_axis_out_tdata[117]));

	direct_interc direct_interc_284_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[118]),
		.out(router_wrap_tile_axis_out_tdata[118]));

	direct_interc direct_interc_285_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[119]),
		.out(router_wrap_tile_axis_out_tdata[119]));

	direct_interc direct_interc_286_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[120]),
		.out(router_wrap_tile_axis_out_tdata[120]));

	direct_interc direct_interc_287_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[121]),
		.out(router_wrap_tile_axis_out_tdata[121]));

	direct_interc direct_interc_288_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[122]),
		.out(router_wrap_tile_axis_out_tdata[122]));

	direct_interc direct_interc_289_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[123]),
		.out(router_wrap_tile_axis_out_tdata[123]));

	direct_interc direct_interc_290_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[124]),
		.out(router_wrap_tile_axis_out_tdata[124]));

	direct_interc direct_interc_291_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[125]),
		.out(router_wrap_tile_axis_out_tdata[125]));

	direct_interc direct_interc_292_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[126]),
		.out(router_wrap_tile_axis_out_tdata[126]));

	direct_interc direct_interc_293_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdata[127]),
		.out(router_wrap_tile_axis_out_tdata[127]));

	direct_interc direct_interc_294_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tlast),
		.out(router_wrap_tile_axis_out_tlast));

	direct_interc direct_interc_295_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tid[0]),
		.out(router_wrap_tile_axis_out_tid[0]));

	direct_interc direct_interc_296_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tid[1]),
		.out(router_wrap_tile_axis_out_tid[1]));

	direct_interc direct_interc_297_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest[0]),
		.out(router_wrap_tile_axis_out_tdest[0]));

	direct_interc direct_interc_298_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest[1]),
		.out(router_wrap_tile_axis_out_tdest[1]));

	direct_interc direct_interc_299_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest[2]),
		.out(router_wrap_tile_axis_out_tdest[2]));

	direct_interc direct_interc_300_ (
		.in(logical_tile_router_wrap_tile_mode_router_wrap__router_wrap_0_router_wrap_axis_out_tdest[3]),
		.out(router_wrap_tile_axis_out_tdest[3]));

	direct_interc direct_interc_301_ (
		.in(router_wrap_tile_clk_noc),
		.out(direct_interc_301_out));

	direct_interc direct_interc_302_ (
		.in(router_wrap_tile_rst_n),
		.out(direct_interc_302_out));

	direct_interc direct_interc_303_ (
		.in(router_wrap_tile_data_in[0]),
		.out(direct_interc_303_out));

	direct_interc direct_interc_304_ (
		.in(router_wrap_tile_data_in[1]),
		.out(direct_interc_304_out));

	direct_interc direct_interc_305_ (
		.in(router_wrap_tile_data_in[2]),
		.out(direct_interc_305_out));

	direct_interc direct_interc_306_ (
		.in(router_wrap_tile_data_in[3]),
		.out(direct_interc_306_out));

	direct_interc direct_interc_307_ (
		.in(router_wrap_tile_data_in[4]),
		.out(direct_interc_307_out));

	direct_interc direct_interc_308_ (
		.in(router_wrap_tile_data_in[5]),
		.out(direct_interc_308_out));

	direct_interc direct_interc_309_ (
		.in(router_wrap_tile_data_in[6]),
		.out(direct_interc_309_out));

	direct_interc direct_interc_310_ (
		.in(router_wrap_tile_data_in[7]),
		.out(direct_interc_310_out));

	direct_interc direct_interc_311_ (
		.in(router_wrap_tile_data_in[8]),
		.out(direct_interc_311_out));

	direct_interc direct_interc_312_ (
		.in(router_wrap_tile_data_in[9]),
		.out(direct_interc_312_out));

	direct_interc direct_interc_313_ (
		.in(router_wrap_tile_data_in[10]),
		.out(direct_interc_313_out));

	direct_interc direct_interc_314_ (
		.in(router_wrap_tile_data_in[11]),
		.out(direct_interc_314_out));

	direct_interc direct_interc_315_ (
		.in(router_wrap_tile_data_in[12]),
		.out(direct_interc_315_out));

	direct_interc direct_interc_316_ (
		.in(router_wrap_tile_data_in[13]),
		.out(direct_interc_316_out));

	direct_interc direct_interc_317_ (
		.in(router_wrap_tile_data_in[14]),
		.out(direct_interc_317_out));

	direct_interc direct_interc_318_ (
		.in(router_wrap_tile_data_in[15]),
		.out(direct_interc_318_out));

	direct_interc direct_interc_319_ (
		.in(router_wrap_tile_data_in[16]),
		.out(direct_interc_319_out));

	direct_interc direct_interc_320_ (
		.in(router_wrap_tile_data_in[17]),
		.out(direct_interc_320_out));

	direct_interc direct_interc_321_ (
		.in(router_wrap_tile_data_in[18]),
		.out(direct_interc_321_out));

	direct_interc direct_interc_322_ (
		.in(router_wrap_tile_data_in[19]),
		.out(direct_interc_322_out));

	direct_interc direct_interc_323_ (
		.in(router_wrap_tile_data_in[20]),
		.out(direct_interc_323_out));

	direct_interc direct_interc_324_ (
		.in(router_wrap_tile_data_in[21]),
		.out(direct_interc_324_out));

	direct_interc direct_interc_325_ (
		.in(router_wrap_tile_data_in[22]),
		.out(direct_interc_325_out));

	direct_interc direct_interc_326_ (
		.in(router_wrap_tile_data_in[23]),
		.out(direct_interc_326_out));

	direct_interc direct_interc_327_ (
		.in(router_wrap_tile_data_in[24]),
		.out(direct_interc_327_out));

	direct_interc direct_interc_328_ (
		.in(router_wrap_tile_data_in[25]),
		.out(direct_interc_328_out));

	direct_interc direct_interc_329_ (
		.in(router_wrap_tile_data_in[26]),
		.out(direct_interc_329_out));

	direct_interc direct_interc_330_ (
		.in(router_wrap_tile_data_in[27]),
		.out(direct_interc_330_out));

	direct_interc direct_interc_331_ (
		.in(router_wrap_tile_data_in[28]),
		.out(direct_interc_331_out));

	direct_interc direct_interc_332_ (
		.in(router_wrap_tile_data_in[29]),
		.out(direct_interc_332_out));

	direct_interc direct_interc_333_ (
		.in(router_wrap_tile_data_in[30]),
		.out(direct_interc_333_out));

	direct_interc direct_interc_334_ (
		.in(router_wrap_tile_data_in[31]),
		.out(direct_interc_334_out));

	direct_interc direct_interc_335_ (
		.in(router_wrap_tile_data_in[32]),
		.out(direct_interc_335_out));

	direct_interc direct_interc_336_ (
		.in(router_wrap_tile_data_in[33]),
		.out(direct_interc_336_out));

	direct_interc direct_interc_337_ (
		.in(router_wrap_tile_data_in[34]),
		.out(direct_interc_337_out));

	direct_interc direct_interc_338_ (
		.in(router_wrap_tile_data_in[35]),
		.out(direct_interc_338_out));

	direct_interc direct_interc_339_ (
		.in(router_wrap_tile_data_in[36]),
		.out(direct_interc_339_out));

	direct_interc direct_interc_340_ (
		.in(router_wrap_tile_data_in[37]),
		.out(direct_interc_340_out));

	direct_interc direct_interc_341_ (
		.in(router_wrap_tile_data_in[38]),
		.out(direct_interc_341_out));

	direct_interc direct_interc_342_ (
		.in(router_wrap_tile_data_in[39]),
		.out(direct_interc_342_out));

	direct_interc direct_interc_343_ (
		.in(router_wrap_tile_data_in[40]),
		.out(direct_interc_343_out));

	direct_interc direct_interc_344_ (
		.in(router_wrap_tile_data_in[41]),
		.out(direct_interc_344_out));

	direct_interc direct_interc_345_ (
		.in(router_wrap_tile_data_in[42]),
		.out(direct_interc_345_out));

	direct_interc direct_interc_346_ (
		.in(router_wrap_tile_data_in[43]),
		.out(direct_interc_346_out));

	direct_interc direct_interc_347_ (
		.in(router_wrap_tile_data_in[44]),
		.out(direct_interc_347_out));

	direct_interc direct_interc_348_ (
		.in(router_wrap_tile_data_in[45]),
		.out(direct_interc_348_out));

	direct_interc direct_interc_349_ (
		.in(router_wrap_tile_data_in[46]),
		.out(direct_interc_349_out));

	direct_interc direct_interc_350_ (
		.in(router_wrap_tile_data_in[47]),
		.out(direct_interc_350_out));

	direct_interc direct_interc_351_ (
		.in(router_wrap_tile_data_in[48]),
		.out(direct_interc_351_out));

	direct_interc direct_interc_352_ (
		.in(router_wrap_tile_data_in[49]),
		.out(direct_interc_352_out));

	direct_interc direct_interc_353_ (
		.in(router_wrap_tile_data_in[50]),
		.out(direct_interc_353_out));

	direct_interc direct_interc_354_ (
		.in(router_wrap_tile_data_in[51]),
		.out(direct_interc_354_out));

	direct_interc direct_interc_355_ (
		.in(router_wrap_tile_data_in[52]),
		.out(direct_interc_355_out));

	direct_interc direct_interc_356_ (
		.in(router_wrap_tile_data_in[53]),
		.out(direct_interc_356_out));

	direct_interc direct_interc_357_ (
		.in(router_wrap_tile_data_in[54]),
		.out(direct_interc_357_out));

	direct_interc direct_interc_358_ (
		.in(router_wrap_tile_data_in[55]),
		.out(direct_interc_358_out));

	direct_interc direct_interc_359_ (
		.in(router_wrap_tile_data_in[56]),
		.out(direct_interc_359_out));

	direct_interc direct_interc_360_ (
		.in(router_wrap_tile_data_in[57]),
		.out(direct_interc_360_out));

	direct_interc direct_interc_361_ (
		.in(router_wrap_tile_data_in[58]),
		.out(direct_interc_361_out));

	direct_interc direct_interc_362_ (
		.in(router_wrap_tile_data_in[59]),
		.out(direct_interc_362_out));

	direct_interc direct_interc_363_ (
		.in(router_wrap_tile_data_in[60]),
		.out(direct_interc_363_out));

	direct_interc direct_interc_364_ (
		.in(router_wrap_tile_data_in[61]),
		.out(direct_interc_364_out));

	direct_interc direct_interc_365_ (
		.in(router_wrap_tile_data_in[62]),
		.out(direct_interc_365_out));

	direct_interc direct_interc_366_ (
		.in(router_wrap_tile_data_in[63]),
		.out(direct_interc_366_out));

	direct_interc direct_interc_367_ (
		.in(router_wrap_tile_data_in[64]),
		.out(direct_interc_367_out));

	direct_interc direct_interc_368_ (
		.in(router_wrap_tile_data_in[65]),
		.out(direct_interc_368_out));

	direct_interc direct_interc_369_ (
		.in(router_wrap_tile_data_in[66]),
		.out(direct_interc_369_out));

	direct_interc direct_interc_370_ (
		.in(router_wrap_tile_data_in[67]),
		.out(direct_interc_370_out));

	direct_interc direct_interc_371_ (
		.in(router_wrap_tile_data_in[68]),
		.out(direct_interc_371_out));

	direct_interc direct_interc_372_ (
		.in(router_wrap_tile_data_in[69]),
		.out(direct_interc_372_out));

	direct_interc direct_interc_373_ (
		.in(router_wrap_tile_data_in[70]),
		.out(direct_interc_373_out));

	direct_interc direct_interc_374_ (
		.in(router_wrap_tile_data_in[71]),
		.out(direct_interc_374_out));

	direct_interc direct_interc_375_ (
		.in(router_wrap_tile_data_in[72]),
		.out(direct_interc_375_out));

	direct_interc direct_interc_376_ (
		.in(router_wrap_tile_data_in[73]),
		.out(direct_interc_376_out));

	direct_interc direct_interc_377_ (
		.in(router_wrap_tile_data_in[74]),
		.out(direct_interc_377_out));

	direct_interc direct_interc_378_ (
		.in(router_wrap_tile_data_in[75]),
		.out(direct_interc_378_out));

	direct_interc direct_interc_379_ (
		.in(router_wrap_tile_data_in[76]),
		.out(direct_interc_379_out));

	direct_interc direct_interc_380_ (
		.in(router_wrap_tile_data_in[77]),
		.out(direct_interc_380_out));

	direct_interc direct_interc_381_ (
		.in(router_wrap_tile_data_in[78]),
		.out(direct_interc_381_out));

	direct_interc direct_interc_382_ (
		.in(router_wrap_tile_data_in[79]),
		.out(direct_interc_382_out));

	direct_interc direct_interc_383_ (
		.in(router_wrap_tile_data_in[80]),
		.out(direct_interc_383_out));

	direct_interc direct_interc_384_ (
		.in(router_wrap_tile_data_in[81]),
		.out(direct_interc_384_out));

	direct_interc direct_interc_385_ (
		.in(router_wrap_tile_data_in[82]),
		.out(direct_interc_385_out));

	direct_interc direct_interc_386_ (
		.in(router_wrap_tile_data_in[83]),
		.out(direct_interc_386_out));

	direct_interc direct_interc_387_ (
		.in(router_wrap_tile_data_in[84]),
		.out(direct_interc_387_out));

	direct_interc direct_interc_388_ (
		.in(router_wrap_tile_data_in[85]),
		.out(direct_interc_388_out));

	direct_interc direct_interc_389_ (
		.in(router_wrap_tile_data_in[86]),
		.out(direct_interc_389_out));

	direct_interc direct_interc_390_ (
		.in(router_wrap_tile_data_in[87]),
		.out(direct_interc_390_out));

	direct_interc direct_interc_391_ (
		.in(router_wrap_tile_data_in[88]),
		.out(direct_interc_391_out));

	direct_interc direct_interc_392_ (
		.in(router_wrap_tile_data_in[89]),
		.out(direct_interc_392_out));

	direct_interc direct_interc_393_ (
		.in(router_wrap_tile_data_in[90]),
		.out(direct_interc_393_out));

	direct_interc direct_interc_394_ (
		.in(router_wrap_tile_data_in[91]),
		.out(direct_interc_394_out));

	direct_interc direct_interc_395_ (
		.in(router_wrap_tile_data_in[92]),
		.out(direct_interc_395_out));

	direct_interc direct_interc_396_ (
		.in(router_wrap_tile_data_in[93]),
		.out(direct_interc_396_out));

	direct_interc direct_interc_397_ (
		.in(router_wrap_tile_data_in[94]),
		.out(direct_interc_397_out));

	direct_interc direct_interc_398_ (
		.in(router_wrap_tile_data_in[95]),
		.out(direct_interc_398_out));

	direct_interc direct_interc_399_ (
		.in(router_wrap_tile_data_in[96]),
		.out(direct_interc_399_out));

	direct_interc direct_interc_400_ (
		.in(router_wrap_tile_data_in[97]),
		.out(direct_interc_400_out));

	direct_interc direct_interc_401_ (
		.in(router_wrap_tile_data_in[98]),
		.out(direct_interc_401_out));

	direct_interc direct_interc_402_ (
		.in(router_wrap_tile_data_in[99]),
		.out(direct_interc_402_out));

	direct_interc direct_interc_403_ (
		.in(router_wrap_tile_data_in[100]),
		.out(direct_interc_403_out));

	direct_interc direct_interc_404_ (
		.in(router_wrap_tile_data_in[101]),
		.out(direct_interc_404_out));

	direct_interc direct_interc_405_ (
		.in(router_wrap_tile_data_in[102]),
		.out(direct_interc_405_out));

	direct_interc direct_interc_406_ (
		.in(router_wrap_tile_data_in[103]),
		.out(direct_interc_406_out));

	direct_interc direct_interc_407_ (
		.in(router_wrap_tile_data_in[104]),
		.out(direct_interc_407_out));

	direct_interc direct_interc_408_ (
		.in(router_wrap_tile_data_in[105]),
		.out(direct_interc_408_out));

	direct_interc direct_interc_409_ (
		.in(router_wrap_tile_data_in[106]),
		.out(direct_interc_409_out));

	direct_interc direct_interc_410_ (
		.in(router_wrap_tile_data_in[107]),
		.out(direct_interc_410_out));

	direct_interc direct_interc_411_ (
		.in(router_wrap_tile_data_in[108]),
		.out(direct_interc_411_out));

	direct_interc direct_interc_412_ (
		.in(router_wrap_tile_data_in[109]),
		.out(direct_interc_412_out));

	direct_interc direct_interc_413_ (
		.in(router_wrap_tile_data_in[110]),
		.out(direct_interc_413_out));

	direct_interc direct_interc_414_ (
		.in(router_wrap_tile_data_in[111]),
		.out(direct_interc_414_out));

	direct_interc direct_interc_415_ (
		.in(router_wrap_tile_data_in[112]),
		.out(direct_interc_415_out));

	direct_interc direct_interc_416_ (
		.in(router_wrap_tile_data_in[113]),
		.out(direct_interc_416_out));

	direct_interc direct_interc_417_ (
		.in(router_wrap_tile_data_in[114]),
		.out(direct_interc_417_out));

	direct_interc direct_interc_418_ (
		.in(router_wrap_tile_data_in[115]),
		.out(direct_interc_418_out));

	direct_interc direct_interc_419_ (
		.in(router_wrap_tile_data_in[116]),
		.out(direct_interc_419_out));

	direct_interc direct_interc_420_ (
		.in(router_wrap_tile_data_in[117]),
		.out(direct_interc_420_out));

	direct_interc direct_interc_421_ (
		.in(router_wrap_tile_data_in[118]),
		.out(direct_interc_421_out));

	direct_interc direct_interc_422_ (
		.in(router_wrap_tile_data_in[119]),
		.out(direct_interc_422_out));

	direct_interc direct_interc_423_ (
		.in(router_wrap_tile_data_in[120]),
		.out(direct_interc_423_out));

	direct_interc direct_interc_424_ (
		.in(router_wrap_tile_data_in[121]),
		.out(direct_interc_424_out));

	direct_interc direct_interc_425_ (
		.in(router_wrap_tile_data_in[122]),
		.out(direct_interc_425_out));

	direct_interc direct_interc_426_ (
		.in(router_wrap_tile_data_in[123]),
		.out(direct_interc_426_out));

	direct_interc direct_interc_427_ (
		.in(router_wrap_tile_data_in[124]),
		.out(direct_interc_427_out));

	direct_interc direct_interc_428_ (
		.in(router_wrap_tile_data_in[125]),
		.out(direct_interc_428_out));

	direct_interc direct_interc_429_ (
		.in(router_wrap_tile_data_in[126]),
		.out(direct_interc_429_out));

	direct_interc direct_interc_430_ (
		.in(router_wrap_tile_data_in[127]),
		.out(direct_interc_430_out));

	direct_interc direct_interc_431_ (
		.in(router_wrap_tile_dest_in[0]),
		.out(direct_interc_431_out));

	direct_interc direct_interc_432_ (
		.in(router_wrap_tile_dest_in[1]),
		.out(direct_interc_432_out));

	direct_interc direct_interc_433_ (
		.in(router_wrap_tile_dest_in[2]),
		.out(direct_interc_433_out));

	direct_interc direct_interc_434_ (
		.in(router_wrap_tile_dest_in[3]),
		.out(direct_interc_434_out));

	direct_interc direct_interc_435_ (
		.in(router_wrap_tile_dest_in[4]),
		.out(direct_interc_435_out));

	direct_interc direct_interc_436_ (
		.in(router_wrap_tile_dest_in[5]),
		.out(direct_interc_436_out));

	direct_interc direct_interc_437_ (
		.in(router_wrap_tile_dest_in[6]),
		.out(direct_interc_437_out));

	direct_interc direct_interc_438_ (
		.in(router_wrap_tile_dest_in[7]),
		.out(direct_interc_438_out));

	direct_interc direct_interc_439_ (
		.in(router_wrap_tile_dest_in[8]),
		.out(direct_interc_439_out));

	direct_interc direct_interc_440_ (
		.in(router_wrap_tile_dest_in[9]),
		.out(direct_interc_440_out));

	direct_interc direct_interc_441_ (
		.in(router_wrap_tile_dest_in[10]),
		.out(direct_interc_441_out));

	direct_interc direct_interc_442_ (
		.in(router_wrap_tile_dest_in[11]),
		.out(direct_interc_442_out));

	direct_interc direct_interc_443_ (
		.in(router_wrap_tile_dest_in[12]),
		.out(direct_interc_443_out));

	direct_interc direct_interc_444_ (
		.in(router_wrap_tile_dest_in[13]),
		.out(direct_interc_444_out));

	direct_interc direct_interc_445_ (
		.in(router_wrap_tile_dest_in[14]),
		.out(direct_interc_445_out));

	direct_interc direct_interc_446_ (
		.in(router_wrap_tile_dest_in[15]),
		.out(direct_interc_446_out));

	direct_interc direct_interc_447_ (
		.in(router_wrap_tile_dest_in[16]),
		.out(direct_interc_447_out));

	direct_interc direct_interc_448_ (
		.in(router_wrap_tile_dest_in[17]),
		.out(direct_interc_448_out));

	direct_interc direct_interc_449_ (
		.in(router_wrap_tile_dest_in[18]),
		.out(direct_interc_449_out));

	direct_interc direct_interc_450_ (
		.in(router_wrap_tile_dest_in[19]),
		.out(direct_interc_450_out));

	direct_interc direct_interc_451_ (
		.in(router_wrap_tile_dest_in[20]),
		.out(direct_interc_451_out));

	direct_interc direct_interc_452_ (
		.in(router_wrap_tile_dest_in[21]),
		.out(direct_interc_452_out));

	direct_interc direct_interc_453_ (
		.in(router_wrap_tile_dest_in[22]),
		.out(direct_interc_453_out));

	direct_interc direct_interc_454_ (
		.in(router_wrap_tile_dest_in[23]),
		.out(direct_interc_454_out));

	direct_interc direct_interc_455_ (
		.in(router_wrap_tile_is_tail_in[0]),
		.out(direct_interc_455_out));

	direct_interc direct_interc_456_ (
		.in(router_wrap_tile_is_tail_in[1]),
		.out(direct_interc_456_out));

	direct_interc direct_interc_457_ (
		.in(router_wrap_tile_is_tail_in[2]),
		.out(direct_interc_457_out));

	direct_interc direct_interc_458_ (
		.in(router_wrap_tile_is_tail_in[3]),
		.out(direct_interc_458_out));

	direct_interc direct_interc_459_ (
		.in(router_wrap_tile_send_in[0]),
		.out(direct_interc_459_out));

	direct_interc direct_interc_460_ (
		.in(router_wrap_tile_send_in[1]),
		.out(direct_interc_460_out));

	direct_interc direct_interc_461_ (
		.in(router_wrap_tile_send_in[2]),
		.out(direct_interc_461_out));

	direct_interc direct_interc_462_ (
		.in(router_wrap_tile_send_in[3]),
		.out(direct_interc_462_out));

	direct_interc direct_interc_463_ (
		.in(router_wrap_tile_credit_in[0]),
		.out(direct_interc_463_out));

	direct_interc direct_interc_464_ (
		.in(router_wrap_tile_credit_in[1]),
		.out(direct_interc_464_out));

	direct_interc direct_interc_465_ (
		.in(router_wrap_tile_credit_in[2]),
		.out(direct_interc_465_out));

	direct_interc direct_interc_466_ (
		.in(router_wrap_tile_credit_in[3]),
		.out(direct_interc_466_out));

	direct_interc direct_interc_467_ (
		.in(router_wrap_tile_router_address[0]),
		.out(direct_interc_467_out));

	direct_interc direct_interc_468_ (
		.in(router_wrap_tile_router_address[1]),
		.out(direct_interc_468_out));

	direct_interc direct_interc_469_ (
		.in(router_wrap_tile_router_address[2]),
		.out(direct_interc_469_out));

	direct_interc direct_interc_470_ (
		.in(router_wrap_tile_router_address[3]),
		.out(direct_interc_470_out));

	direct_interc direct_interc_471_ (
		.in(router_wrap_tile_axis_in_tvalid),
		.out(direct_interc_471_out));

	direct_interc direct_interc_472_ (
		.in(router_wrap_tile_axis_in_tdata[0]),
		.out(direct_interc_472_out));

	direct_interc direct_interc_473_ (
		.in(router_wrap_tile_axis_in_tdata[1]),
		.out(direct_interc_473_out));

	direct_interc direct_interc_474_ (
		.in(router_wrap_tile_axis_in_tdata[2]),
		.out(direct_interc_474_out));

	direct_interc direct_interc_475_ (
		.in(router_wrap_tile_axis_in_tdata[3]),
		.out(direct_interc_475_out));

	direct_interc direct_interc_476_ (
		.in(router_wrap_tile_axis_in_tdata[4]),
		.out(direct_interc_476_out));

	direct_interc direct_interc_477_ (
		.in(router_wrap_tile_axis_in_tdata[5]),
		.out(direct_interc_477_out));

	direct_interc direct_interc_478_ (
		.in(router_wrap_tile_axis_in_tdata[6]),
		.out(direct_interc_478_out));

	direct_interc direct_interc_479_ (
		.in(router_wrap_tile_axis_in_tdata[7]),
		.out(direct_interc_479_out));

	direct_interc direct_interc_480_ (
		.in(router_wrap_tile_axis_in_tdata[8]),
		.out(direct_interc_480_out));

	direct_interc direct_interc_481_ (
		.in(router_wrap_tile_axis_in_tdata[9]),
		.out(direct_interc_481_out));

	direct_interc direct_interc_482_ (
		.in(router_wrap_tile_axis_in_tdata[10]),
		.out(direct_interc_482_out));

	direct_interc direct_interc_483_ (
		.in(router_wrap_tile_axis_in_tdata[11]),
		.out(direct_interc_483_out));

	direct_interc direct_interc_484_ (
		.in(router_wrap_tile_axis_in_tdata[12]),
		.out(direct_interc_484_out));

	direct_interc direct_interc_485_ (
		.in(router_wrap_tile_axis_in_tdata[13]),
		.out(direct_interc_485_out));

	direct_interc direct_interc_486_ (
		.in(router_wrap_tile_axis_in_tdata[14]),
		.out(direct_interc_486_out));

	direct_interc direct_interc_487_ (
		.in(router_wrap_tile_axis_in_tdata[15]),
		.out(direct_interc_487_out));

	direct_interc direct_interc_488_ (
		.in(router_wrap_tile_axis_in_tdata[16]),
		.out(direct_interc_488_out));

	direct_interc direct_interc_489_ (
		.in(router_wrap_tile_axis_in_tdata[17]),
		.out(direct_interc_489_out));

	direct_interc direct_interc_490_ (
		.in(router_wrap_tile_axis_in_tdata[18]),
		.out(direct_interc_490_out));

	direct_interc direct_interc_491_ (
		.in(router_wrap_tile_axis_in_tdata[19]),
		.out(direct_interc_491_out));

	direct_interc direct_interc_492_ (
		.in(router_wrap_tile_axis_in_tdata[20]),
		.out(direct_interc_492_out));

	direct_interc direct_interc_493_ (
		.in(router_wrap_tile_axis_in_tdata[21]),
		.out(direct_interc_493_out));

	direct_interc direct_interc_494_ (
		.in(router_wrap_tile_axis_in_tdata[22]),
		.out(direct_interc_494_out));

	direct_interc direct_interc_495_ (
		.in(router_wrap_tile_axis_in_tdata[23]),
		.out(direct_interc_495_out));

	direct_interc direct_interc_496_ (
		.in(router_wrap_tile_axis_in_tdata[24]),
		.out(direct_interc_496_out));

	direct_interc direct_interc_497_ (
		.in(router_wrap_tile_axis_in_tdata[25]),
		.out(direct_interc_497_out));

	direct_interc direct_interc_498_ (
		.in(router_wrap_tile_axis_in_tdata[26]),
		.out(direct_interc_498_out));

	direct_interc direct_interc_499_ (
		.in(router_wrap_tile_axis_in_tdata[27]),
		.out(direct_interc_499_out));

	direct_interc direct_interc_500_ (
		.in(router_wrap_tile_axis_in_tdata[28]),
		.out(direct_interc_500_out));

	direct_interc direct_interc_501_ (
		.in(router_wrap_tile_axis_in_tdata[29]),
		.out(direct_interc_501_out));

	direct_interc direct_interc_502_ (
		.in(router_wrap_tile_axis_in_tdata[30]),
		.out(direct_interc_502_out));

	direct_interc direct_interc_503_ (
		.in(router_wrap_tile_axis_in_tdata[31]),
		.out(direct_interc_503_out));

	direct_interc direct_interc_504_ (
		.in(router_wrap_tile_axis_in_tdata[32]),
		.out(direct_interc_504_out));

	direct_interc direct_interc_505_ (
		.in(router_wrap_tile_axis_in_tdata[33]),
		.out(direct_interc_505_out));

	direct_interc direct_interc_506_ (
		.in(router_wrap_tile_axis_in_tdata[34]),
		.out(direct_interc_506_out));

	direct_interc direct_interc_507_ (
		.in(router_wrap_tile_axis_in_tdata[35]),
		.out(direct_interc_507_out));

	direct_interc direct_interc_508_ (
		.in(router_wrap_tile_axis_in_tdata[36]),
		.out(direct_interc_508_out));

	direct_interc direct_interc_509_ (
		.in(router_wrap_tile_axis_in_tdata[37]),
		.out(direct_interc_509_out));

	direct_interc direct_interc_510_ (
		.in(router_wrap_tile_axis_in_tdata[38]),
		.out(direct_interc_510_out));

	direct_interc direct_interc_511_ (
		.in(router_wrap_tile_axis_in_tdata[39]),
		.out(direct_interc_511_out));

	direct_interc direct_interc_512_ (
		.in(router_wrap_tile_axis_in_tdata[40]),
		.out(direct_interc_512_out));

	direct_interc direct_interc_513_ (
		.in(router_wrap_tile_axis_in_tdata[41]),
		.out(direct_interc_513_out));

	direct_interc direct_interc_514_ (
		.in(router_wrap_tile_axis_in_tdata[42]),
		.out(direct_interc_514_out));

	direct_interc direct_interc_515_ (
		.in(router_wrap_tile_axis_in_tdata[43]),
		.out(direct_interc_515_out));

	direct_interc direct_interc_516_ (
		.in(router_wrap_tile_axis_in_tdata[44]),
		.out(direct_interc_516_out));

	direct_interc direct_interc_517_ (
		.in(router_wrap_tile_axis_in_tdata[45]),
		.out(direct_interc_517_out));

	direct_interc direct_interc_518_ (
		.in(router_wrap_tile_axis_in_tdata[46]),
		.out(direct_interc_518_out));

	direct_interc direct_interc_519_ (
		.in(router_wrap_tile_axis_in_tdata[47]),
		.out(direct_interc_519_out));

	direct_interc direct_interc_520_ (
		.in(router_wrap_tile_axis_in_tdata[48]),
		.out(direct_interc_520_out));

	direct_interc direct_interc_521_ (
		.in(router_wrap_tile_axis_in_tdata[49]),
		.out(direct_interc_521_out));

	direct_interc direct_interc_522_ (
		.in(router_wrap_tile_axis_in_tdata[50]),
		.out(direct_interc_522_out));

	direct_interc direct_interc_523_ (
		.in(router_wrap_tile_axis_in_tdata[51]),
		.out(direct_interc_523_out));

	direct_interc direct_interc_524_ (
		.in(router_wrap_tile_axis_in_tdata[52]),
		.out(direct_interc_524_out));

	direct_interc direct_interc_525_ (
		.in(router_wrap_tile_axis_in_tdata[53]),
		.out(direct_interc_525_out));

	direct_interc direct_interc_526_ (
		.in(router_wrap_tile_axis_in_tdata[54]),
		.out(direct_interc_526_out));

	direct_interc direct_interc_527_ (
		.in(router_wrap_tile_axis_in_tdata[55]),
		.out(direct_interc_527_out));

	direct_interc direct_interc_528_ (
		.in(router_wrap_tile_axis_in_tdata[56]),
		.out(direct_interc_528_out));

	direct_interc direct_interc_529_ (
		.in(router_wrap_tile_axis_in_tdata[57]),
		.out(direct_interc_529_out));

	direct_interc direct_interc_530_ (
		.in(router_wrap_tile_axis_in_tdata[58]),
		.out(direct_interc_530_out));

	direct_interc direct_interc_531_ (
		.in(router_wrap_tile_axis_in_tdata[59]),
		.out(direct_interc_531_out));

	direct_interc direct_interc_532_ (
		.in(router_wrap_tile_axis_in_tdata[60]),
		.out(direct_interc_532_out));

	direct_interc direct_interc_533_ (
		.in(router_wrap_tile_axis_in_tdata[61]),
		.out(direct_interc_533_out));

	direct_interc direct_interc_534_ (
		.in(router_wrap_tile_axis_in_tdata[62]),
		.out(direct_interc_534_out));

	direct_interc direct_interc_535_ (
		.in(router_wrap_tile_axis_in_tdata[63]),
		.out(direct_interc_535_out));

	direct_interc direct_interc_536_ (
		.in(router_wrap_tile_axis_in_tdata[64]),
		.out(direct_interc_536_out));

	direct_interc direct_interc_537_ (
		.in(router_wrap_tile_axis_in_tdata[65]),
		.out(direct_interc_537_out));

	direct_interc direct_interc_538_ (
		.in(router_wrap_tile_axis_in_tdata[66]),
		.out(direct_interc_538_out));

	direct_interc direct_interc_539_ (
		.in(router_wrap_tile_axis_in_tdata[67]),
		.out(direct_interc_539_out));

	direct_interc direct_interc_540_ (
		.in(router_wrap_tile_axis_in_tdata[68]),
		.out(direct_interc_540_out));

	direct_interc direct_interc_541_ (
		.in(router_wrap_tile_axis_in_tdata[69]),
		.out(direct_interc_541_out));

	direct_interc direct_interc_542_ (
		.in(router_wrap_tile_axis_in_tdata[70]),
		.out(direct_interc_542_out));

	direct_interc direct_interc_543_ (
		.in(router_wrap_tile_axis_in_tdata[71]),
		.out(direct_interc_543_out));

	direct_interc direct_interc_544_ (
		.in(router_wrap_tile_axis_in_tdata[72]),
		.out(direct_interc_544_out));

	direct_interc direct_interc_545_ (
		.in(router_wrap_tile_axis_in_tdata[73]),
		.out(direct_interc_545_out));

	direct_interc direct_interc_546_ (
		.in(router_wrap_tile_axis_in_tdata[74]),
		.out(direct_interc_546_out));

	direct_interc direct_interc_547_ (
		.in(router_wrap_tile_axis_in_tdata[75]),
		.out(direct_interc_547_out));

	direct_interc direct_interc_548_ (
		.in(router_wrap_tile_axis_in_tdata[76]),
		.out(direct_interc_548_out));

	direct_interc direct_interc_549_ (
		.in(router_wrap_tile_axis_in_tdata[77]),
		.out(direct_interc_549_out));

	direct_interc direct_interc_550_ (
		.in(router_wrap_tile_axis_in_tdata[78]),
		.out(direct_interc_550_out));

	direct_interc direct_interc_551_ (
		.in(router_wrap_tile_axis_in_tdata[79]),
		.out(direct_interc_551_out));

	direct_interc direct_interc_552_ (
		.in(router_wrap_tile_axis_in_tdata[80]),
		.out(direct_interc_552_out));

	direct_interc direct_interc_553_ (
		.in(router_wrap_tile_axis_in_tdata[81]),
		.out(direct_interc_553_out));

	direct_interc direct_interc_554_ (
		.in(router_wrap_tile_axis_in_tdata[82]),
		.out(direct_interc_554_out));

	direct_interc direct_interc_555_ (
		.in(router_wrap_tile_axis_in_tdata[83]),
		.out(direct_interc_555_out));

	direct_interc direct_interc_556_ (
		.in(router_wrap_tile_axis_in_tdata[84]),
		.out(direct_interc_556_out));

	direct_interc direct_interc_557_ (
		.in(router_wrap_tile_axis_in_tdata[85]),
		.out(direct_interc_557_out));

	direct_interc direct_interc_558_ (
		.in(router_wrap_tile_axis_in_tdata[86]),
		.out(direct_interc_558_out));

	direct_interc direct_interc_559_ (
		.in(router_wrap_tile_axis_in_tdata[87]),
		.out(direct_interc_559_out));

	direct_interc direct_interc_560_ (
		.in(router_wrap_tile_axis_in_tdata[88]),
		.out(direct_interc_560_out));

	direct_interc direct_interc_561_ (
		.in(router_wrap_tile_axis_in_tdata[89]),
		.out(direct_interc_561_out));

	direct_interc direct_interc_562_ (
		.in(router_wrap_tile_axis_in_tdata[90]),
		.out(direct_interc_562_out));

	direct_interc direct_interc_563_ (
		.in(router_wrap_tile_axis_in_tdata[91]),
		.out(direct_interc_563_out));

	direct_interc direct_interc_564_ (
		.in(router_wrap_tile_axis_in_tdata[92]),
		.out(direct_interc_564_out));

	direct_interc direct_interc_565_ (
		.in(router_wrap_tile_axis_in_tdata[93]),
		.out(direct_interc_565_out));

	direct_interc direct_interc_566_ (
		.in(router_wrap_tile_axis_in_tdata[94]),
		.out(direct_interc_566_out));

	direct_interc direct_interc_567_ (
		.in(router_wrap_tile_axis_in_tdata[95]),
		.out(direct_interc_567_out));

	direct_interc direct_interc_568_ (
		.in(router_wrap_tile_axis_in_tdata[96]),
		.out(direct_interc_568_out));

	direct_interc direct_interc_569_ (
		.in(router_wrap_tile_axis_in_tdata[97]),
		.out(direct_interc_569_out));

	direct_interc direct_interc_570_ (
		.in(router_wrap_tile_axis_in_tdata[98]),
		.out(direct_interc_570_out));

	direct_interc direct_interc_571_ (
		.in(router_wrap_tile_axis_in_tdata[99]),
		.out(direct_interc_571_out));

	direct_interc direct_interc_572_ (
		.in(router_wrap_tile_axis_in_tdata[100]),
		.out(direct_interc_572_out));

	direct_interc direct_interc_573_ (
		.in(router_wrap_tile_axis_in_tdata[101]),
		.out(direct_interc_573_out));

	direct_interc direct_interc_574_ (
		.in(router_wrap_tile_axis_in_tdata[102]),
		.out(direct_interc_574_out));

	direct_interc direct_interc_575_ (
		.in(router_wrap_tile_axis_in_tdata[103]),
		.out(direct_interc_575_out));

	direct_interc direct_interc_576_ (
		.in(router_wrap_tile_axis_in_tdata[104]),
		.out(direct_interc_576_out));

	direct_interc direct_interc_577_ (
		.in(router_wrap_tile_axis_in_tdata[105]),
		.out(direct_interc_577_out));

	direct_interc direct_interc_578_ (
		.in(router_wrap_tile_axis_in_tdata[106]),
		.out(direct_interc_578_out));

	direct_interc direct_interc_579_ (
		.in(router_wrap_tile_axis_in_tdata[107]),
		.out(direct_interc_579_out));

	direct_interc direct_interc_580_ (
		.in(router_wrap_tile_axis_in_tdata[108]),
		.out(direct_interc_580_out));

	direct_interc direct_interc_581_ (
		.in(router_wrap_tile_axis_in_tdata[109]),
		.out(direct_interc_581_out));

	direct_interc direct_interc_582_ (
		.in(router_wrap_tile_axis_in_tdata[110]),
		.out(direct_interc_582_out));

	direct_interc direct_interc_583_ (
		.in(router_wrap_tile_axis_in_tdata[111]),
		.out(direct_interc_583_out));

	direct_interc direct_interc_584_ (
		.in(router_wrap_tile_axis_in_tdata[112]),
		.out(direct_interc_584_out));

	direct_interc direct_interc_585_ (
		.in(router_wrap_tile_axis_in_tdata[113]),
		.out(direct_interc_585_out));

	direct_interc direct_interc_586_ (
		.in(router_wrap_tile_axis_in_tdata[114]),
		.out(direct_interc_586_out));

	direct_interc direct_interc_587_ (
		.in(router_wrap_tile_axis_in_tdata[115]),
		.out(direct_interc_587_out));

	direct_interc direct_interc_588_ (
		.in(router_wrap_tile_axis_in_tdata[116]),
		.out(direct_interc_588_out));

	direct_interc direct_interc_589_ (
		.in(router_wrap_tile_axis_in_tdata[117]),
		.out(direct_interc_589_out));

	direct_interc direct_interc_590_ (
		.in(router_wrap_tile_axis_in_tdata[118]),
		.out(direct_interc_590_out));

	direct_interc direct_interc_591_ (
		.in(router_wrap_tile_axis_in_tdata[119]),
		.out(direct_interc_591_out));

	direct_interc direct_interc_592_ (
		.in(router_wrap_tile_axis_in_tdata[120]),
		.out(direct_interc_592_out));

	direct_interc direct_interc_593_ (
		.in(router_wrap_tile_axis_in_tdata[121]),
		.out(direct_interc_593_out));

	direct_interc direct_interc_594_ (
		.in(router_wrap_tile_axis_in_tdata[122]),
		.out(direct_interc_594_out));

	direct_interc direct_interc_595_ (
		.in(router_wrap_tile_axis_in_tdata[123]),
		.out(direct_interc_595_out));

	direct_interc direct_interc_596_ (
		.in(router_wrap_tile_axis_in_tdata[124]),
		.out(direct_interc_596_out));

	direct_interc direct_interc_597_ (
		.in(router_wrap_tile_axis_in_tdata[125]),
		.out(direct_interc_597_out));

	direct_interc direct_interc_598_ (
		.in(router_wrap_tile_axis_in_tdata[126]),
		.out(direct_interc_598_out));

	direct_interc direct_interc_599_ (
		.in(router_wrap_tile_axis_in_tdata[127]),
		.out(direct_interc_599_out));

	direct_interc direct_interc_600_ (
		.in(router_wrap_tile_axis_in_tlast),
		.out(direct_interc_600_out));

	direct_interc direct_interc_601_ (
		.in(router_wrap_tile_axis_in_tid[0]),
		.out(direct_interc_601_out));

	direct_interc direct_interc_602_ (
		.in(router_wrap_tile_axis_in_tid[1]),
		.out(direct_interc_602_out));

	direct_interc direct_interc_603_ (
		.in(router_wrap_tile_axis_in_tdest[0]),
		.out(direct_interc_603_out));

	direct_interc direct_interc_604_ (
		.in(router_wrap_tile_axis_in_tdest[1]),
		.out(direct_interc_604_out));

	direct_interc direct_interc_605_ (
		.in(router_wrap_tile_axis_in_tdest[2]),
		.out(direct_interc_605_out));

	direct_interc direct_interc_606_ (
		.in(router_wrap_tile_axis_in_tdest[3]),
		.out(direct_interc_606_out));

	direct_interc direct_interc_607_ (
		.in(router_wrap_tile_axis_out_tready),
		.out(direct_interc_607_out));

	direct_interc direct_interc_608_ (
		.in(router_wrap_tile_clk_usr),
		.out(direct_interc_608_out));

endmodule
// ----- END Verilog module for logical_tile_router_wrap_tile_mode_router_wrap_tile_ -----

//----- Default net type -----
`default_nettype wire



// ----- END Physical programmable logic block Verilog module: router_wrap_tile -----
