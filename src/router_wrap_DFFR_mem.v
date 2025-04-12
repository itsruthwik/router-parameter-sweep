// ----- Verilog module for router_wrap_DFFR_mem -----
module router_wrap_DFFR_mem(pReset,
                            prog_clk,
                            ccff_head,
                            ccff_tail,
                            mem_out,
                            mem_outb);
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:111] mem_out;
//----- OUTPUT PORTS -----
output [0:111] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[111];
// ----- END Local output short connections -----

	DFFR DFFR_0_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(ccff_head),
		.Q(mem_out[0]),
		.QN(mem_outb[0]));

	DFFR DFFR_1_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[0]),
		.Q(mem_out[1]),
		.QN(mem_outb[1]));

	DFFR DFFR_2_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[1]),
		.Q(mem_out[2]),
		.QN(mem_outb[2]));

	DFFR DFFR_3_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[2]),
		.Q(mem_out[3]),
		.QN(mem_outb[3]));

	DFFR DFFR_4_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[3]),
		.Q(mem_out[4]),
		.QN(mem_outb[4]));

	DFFR DFFR_5_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[4]),
		.Q(mem_out[5]),
		.QN(mem_outb[5]));

	DFFR DFFR_6_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[5]),
		.Q(mem_out[6]),
		.QN(mem_outb[6]));

	DFFR DFFR_7_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[6]),
		.Q(mem_out[7]),
		.QN(mem_outb[7]));

	DFFR DFFR_8_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[7]),
		.Q(mem_out[8]),
		.QN(mem_outb[8]));

	DFFR DFFR_9_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[8]),
		.Q(mem_out[9]),
		.QN(mem_outb[9]));

	DFFR DFFR_10_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[9]),
		.Q(mem_out[10]),
		.QN(mem_outb[10]));

	DFFR DFFR_11_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[10]),
		.Q(mem_out[11]),
		.QN(mem_outb[11]));

	DFFR DFFR_12_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[11]),
		.Q(mem_out[12]),
		.QN(mem_outb[12]));

	DFFR DFFR_13_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[12]),
		.Q(mem_out[13]),
		.QN(mem_outb[13]));

	DFFR DFFR_14_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[13]),
		.Q(mem_out[14]),
		.QN(mem_outb[14]));

	DFFR DFFR_15_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[14]),
		.Q(mem_out[15]),
		.QN(mem_outb[15]));

	DFFR DFFR_16_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[15]),
		.Q(mem_out[16]),
		.QN(mem_outb[16]));

	DFFR DFFR_17_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[16]),
		.Q(mem_out[17]),
		.QN(mem_outb[17]));

	DFFR DFFR_18_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[17]),
		.Q(mem_out[18]),
		.QN(mem_outb[18]));

	DFFR DFFR_19_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[18]),
		.Q(mem_out[19]),
		.QN(mem_outb[19]));

	DFFR DFFR_20_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[19]),
		.Q(mem_out[20]),
		.QN(mem_outb[20]));

	DFFR DFFR_21_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[20]),
		.Q(mem_out[21]),
		.QN(mem_outb[21]));

	DFFR DFFR_22_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[21]),
		.Q(mem_out[22]),
		.QN(mem_outb[22]));

	DFFR DFFR_23_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[22]),
		.Q(mem_out[23]),
		.QN(mem_outb[23]));

	DFFR DFFR_24_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[23]),
		.Q(mem_out[24]),
		.QN(mem_outb[24]));

	DFFR DFFR_25_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[24]),
		.Q(mem_out[25]),
		.QN(mem_outb[25]));

	DFFR DFFR_26_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[25]),
		.Q(mem_out[26]),
		.QN(mem_outb[26]));

	DFFR DFFR_27_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[26]),
		.Q(mem_out[27]),
		.QN(mem_outb[27]));

	DFFR DFFR_28_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[27]),
		.Q(mem_out[28]),
		.QN(mem_outb[28]));

	DFFR DFFR_29_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[28]),
		.Q(mem_out[29]),
		.QN(mem_outb[29]));

	DFFR DFFR_30_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[29]),
		.Q(mem_out[30]),
		.QN(mem_outb[30]));

	DFFR DFFR_31_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[30]),
		.Q(mem_out[31]),
		.QN(mem_outb[31]));

	DFFR DFFR_32_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[31]),
		.Q(mem_out[32]),
		.QN(mem_outb[32]));

	DFFR DFFR_33_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[32]),
		.Q(mem_out[33]),
		.QN(mem_outb[33]));

	DFFR DFFR_34_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[33]),
		.Q(mem_out[34]),
		.QN(mem_outb[34]));

	DFFR DFFR_35_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[34]),
		.Q(mem_out[35]),
		.QN(mem_outb[35]));

	DFFR DFFR_36_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[35]),
		.Q(mem_out[36]),
		.QN(mem_outb[36]));

	DFFR DFFR_37_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[36]),
		.Q(mem_out[37]),
		.QN(mem_outb[37]));

	DFFR DFFR_38_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[37]),
		.Q(mem_out[38]),
		.QN(mem_outb[38]));

	DFFR DFFR_39_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[38]),
		.Q(mem_out[39]),
		.QN(mem_outb[39]));

	DFFR DFFR_40_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[39]),
		.Q(mem_out[40]),
		.QN(mem_outb[40]));

	DFFR DFFR_41_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[40]),
		.Q(mem_out[41]),
		.QN(mem_outb[41]));

	DFFR DFFR_42_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[41]),
		.Q(mem_out[42]),
		.QN(mem_outb[42]));

	DFFR DFFR_43_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[42]),
		.Q(mem_out[43]),
		.QN(mem_outb[43]));

	DFFR DFFR_44_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[43]),
		.Q(mem_out[44]),
		.QN(mem_outb[44]));

	DFFR DFFR_45_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[44]),
		.Q(mem_out[45]),
		.QN(mem_outb[45]));

	DFFR DFFR_46_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[45]),
		.Q(mem_out[46]),
		.QN(mem_outb[46]));

	DFFR DFFR_47_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[46]),
		.Q(mem_out[47]),
		.QN(mem_outb[47]));

	DFFR DFFR_48_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[47]),
		.Q(mem_out[48]),
		.QN(mem_outb[48]));

	DFFR DFFR_49_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[48]),
		.Q(mem_out[49]),
		.QN(mem_outb[49]));

	DFFR DFFR_50_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[49]),
		.Q(mem_out[50]),
		.QN(mem_outb[50]));

	DFFR DFFR_51_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[50]),
		.Q(mem_out[51]),
		.QN(mem_outb[51]));

	DFFR DFFR_52_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[51]),
		.Q(mem_out[52]),
		.QN(mem_outb[52]));

	DFFR DFFR_53_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[52]),
		.Q(mem_out[53]),
		.QN(mem_outb[53]));

	DFFR DFFR_54_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[53]),
		.Q(mem_out[54]),
		.QN(mem_outb[54]));

	DFFR DFFR_55_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[54]),
		.Q(mem_out[55]),
		.QN(mem_outb[55]));

	DFFR DFFR_56_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[55]),
		.Q(mem_out[56]),
		.QN(mem_outb[56]));

	DFFR DFFR_57_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[56]),
		.Q(mem_out[57]),
		.QN(mem_outb[57]));

	DFFR DFFR_58_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[57]),
		.Q(mem_out[58]),
		.QN(mem_outb[58]));

	DFFR DFFR_59_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[58]),
		.Q(mem_out[59]),
		.QN(mem_outb[59]));

	DFFR DFFR_60_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[59]),
		.Q(mem_out[60]),
		.QN(mem_outb[60]));

	DFFR DFFR_61_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[60]),
		.Q(mem_out[61]),
		.QN(mem_outb[61]));

	DFFR DFFR_62_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[61]),
		.Q(mem_out[62]),
		.QN(mem_outb[62]));

	DFFR DFFR_63_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[62]),
		.Q(mem_out[63]),
		.QN(mem_outb[63]));

	DFFR DFFR_64_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[63]),
		.Q(mem_out[64]),
		.QN(mem_outb[64]));

	DFFR DFFR_65_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[64]),
		.Q(mem_out[65]),
		.QN(mem_outb[65]));

	DFFR DFFR_66_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[65]),
		.Q(mem_out[66]),
		.QN(mem_outb[66]));

	DFFR DFFR_67_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[66]),
		.Q(mem_out[67]),
		.QN(mem_outb[67]));

	DFFR DFFR_68_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[67]),
		.Q(mem_out[68]),
		.QN(mem_outb[68]));

	DFFR DFFR_69_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[68]),
		.Q(mem_out[69]),
		.QN(mem_outb[69]));

	DFFR DFFR_70_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[69]),
		.Q(mem_out[70]),
		.QN(mem_outb[70]));

	DFFR DFFR_71_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[70]),
		.Q(mem_out[71]),
		.QN(mem_outb[71]));

	DFFR DFFR_72_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[71]),
		.Q(mem_out[72]),
		.QN(mem_outb[72]));

	DFFR DFFR_73_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[72]),
		.Q(mem_out[73]),
		.QN(mem_outb[73]));

	DFFR DFFR_74_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[73]),
		.Q(mem_out[74]),
		.QN(mem_outb[74]));

	DFFR DFFR_75_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[74]),
		.Q(mem_out[75]),
		.QN(mem_outb[75]));

	DFFR DFFR_76_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[75]),
		.Q(mem_out[76]),
		.QN(mem_outb[76]));

	DFFR DFFR_77_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[76]),
		.Q(mem_out[77]),
		.QN(mem_outb[77]));

	DFFR DFFR_78_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[77]),
		.Q(mem_out[78]),
		.QN(mem_outb[78]));

	DFFR DFFR_79_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[78]),
		.Q(mem_out[79]),
		.QN(mem_outb[79]));

	DFFR DFFR_80_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[79]),
		.Q(mem_out[80]),
		.QN(mem_outb[80]));

	DFFR DFFR_81_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[80]),
		.Q(mem_out[81]),
		.QN(mem_outb[81]));

	DFFR DFFR_82_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[81]),
		.Q(mem_out[82]),
		.QN(mem_outb[82]));

	DFFR DFFR_83_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[82]),
		.Q(mem_out[83]),
		.QN(mem_outb[83]));

	DFFR DFFR_84_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[83]),
		.Q(mem_out[84]),
		.QN(mem_outb[84]));

	DFFR DFFR_85_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[84]),
		.Q(mem_out[85]),
		.QN(mem_outb[85]));

	DFFR DFFR_86_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[85]),
		.Q(mem_out[86]),
		.QN(mem_outb[86]));

	DFFR DFFR_87_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[86]),
		.Q(mem_out[87]),
		.QN(mem_outb[87]));

	DFFR DFFR_88_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[87]),
		.Q(mem_out[88]),
		.QN(mem_outb[88]));

	DFFR DFFR_89_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[88]),
		.Q(mem_out[89]),
		.QN(mem_outb[89]));

	DFFR DFFR_90_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[89]),
		.Q(mem_out[90]),
		.QN(mem_outb[90]));

	DFFR DFFR_91_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[90]),
		.Q(mem_out[91]),
		.QN(mem_outb[91]));

	DFFR DFFR_92_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[91]),
		.Q(mem_out[92]),
		.QN(mem_outb[92]));

	DFFR DFFR_93_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[92]),
		.Q(mem_out[93]),
		.QN(mem_outb[93]));

	DFFR DFFR_94_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[93]),
		.Q(mem_out[94]),
		.QN(mem_outb[94]));

	DFFR DFFR_95_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[94]),
		.Q(mem_out[95]),
		.QN(mem_outb[95]));

	DFFR DFFR_96_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[95]),
		.Q(mem_out[96]),
		.QN(mem_outb[96]));

	DFFR DFFR_97_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[96]),
		.Q(mem_out[97]),
		.QN(mem_outb[97]));

	DFFR DFFR_98_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[97]),
		.Q(mem_out[98]),
		.QN(mem_outb[98]));

	DFFR DFFR_99_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[98]),
		.Q(mem_out[99]),
		.QN(mem_outb[99]));

	DFFR DFFR_100_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[99]),
		.Q(mem_out[100]),
		.QN(mem_outb[100]));

	DFFR DFFR_101_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[100]),
		.Q(mem_out[101]),
		.QN(mem_outb[101]));

	DFFR DFFR_102_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[101]),
		.Q(mem_out[102]),
		.QN(mem_outb[102]));

	DFFR DFFR_103_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[102]),
		.Q(mem_out[103]),
		.QN(mem_outb[103]));

	DFFR DFFR_104_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[103]),
		.Q(mem_out[104]),
		.QN(mem_outb[104]));

	DFFR DFFR_105_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[104]),
		.Q(mem_out[105]),
		.QN(mem_outb[105]));

	DFFR DFFR_106_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[105]),
		.Q(mem_out[106]),
		.QN(mem_outb[106]));

	DFFR DFFR_107_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[106]),
		.Q(mem_out[107]),
		.QN(mem_outb[107]));

	DFFR DFFR_108_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[107]),
		.Q(mem_out[108]),
		.QN(mem_outb[108]));

	DFFR DFFR_109_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[108]),
		.Q(mem_out[109]),
		.QN(mem_outb[109]));

	DFFR DFFR_110_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[109]),
		.Q(mem_out[110]),
		.QN(mem_outb[110]));

	DFFR DFFR_111_ (
		.RST(pReset),
		.CK(prog_clk),
		.D(mem_out[110]),
		.Q(mem_out[111]),
		.QN(mem_outb[111]));

endmodule
// ----- END Verilog module for router_wrap_DFFR_mem -----