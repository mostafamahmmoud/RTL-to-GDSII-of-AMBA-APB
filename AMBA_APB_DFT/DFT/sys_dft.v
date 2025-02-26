/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Feb 26 23:00:40 2025
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(SEL), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(SEL), .Y(OUT) );
endmodule


module APB_MASTER_test_1 ( PCLK, PRESERn, READ_WRITE, PREADY, transfer, prdata, 
        apb_write_paddr, apb_write_data, apb_read_paddr, apb_read_data_out, 
        paddr, pwdata, PENABLE, PSEL1, PWRITE, test_si, test_so, test_se );
  input [7:0] prdata;
  input [7:0] apb_write_paddr;
  input [7:0] apb_write_data;
  input [7:0] apb_read_paddr;
  output [7:0] apb_read_data_out;
  output [7:0] paddr;
  output [7:0] pwdata;
  input PCLK, PRESERn, READ_WRITE, PREADY, transfer, test_si, test_se;
  output PENABLE, PSEL1, PWRITE, test_so;
  wire   READ_WRITE, n12, n2, n3, n4, n6, n15, n16, n17, n18, n19;
  wire   [1:0] next_state;
  assign PWRITE = READ_WRITE;
  assign test_so = n3;

  OAI21X2M U3 ( .A0(PSEL1), .A1(n12), .B0(transfer), .Y(n6) );
  AND3X2M U4 ( .A(READ_WRITE), .B(PSEL1), .C(n12), .Y(n4) );
  NOR2X4M U7 ( .A(n12), .B(n2), .Y(PENABLE) );
  OR3X2M U8 ( .A(n2), .B(READ_WRITE), .C(n3), .Y(n15) );
  AOI21X3M U9 ( .A0(PREADY), .A1(n3), .B0(n2), .Y(next_state[1]) );
  INVX6M U10 ( .A(n15), .Y(n16) );
  INVX6M U11 ( .A(n15), .Y(n17) );
  CLKBUFX6M U12 ( .A(n4), .Y(n19) );
  CLKBUFX6M U13 ( .A(n4), .Y(n18) );
  AND2X8M U14 ( .A(prdata[0]), .B(n16), .Y(apb_read_data_out[0]) );
  AND2X2M U15 ( .A(apb_write_data[0]), .B(n18), .Y(pwdata[0]) );
  AND2X8M U16 ( .A(prdata[1]), .B(n17), .Y(apb_read_data_out[1]) );
  AND2X2M U17 ( .A(apb_write_data[1]), .B(n18), .Y(pwdata[1]) );
  AND2X8M U18 ( .A(prdata[2]), .B(n16), .Y(apb_read_data_out[2]) );
  AND2X2M U19 ( .A(apb_write_data[2]), .B(n18), .Y(pwdata[2]) );
  AND2X8M U20 ( .A(prdata[3]), .B(n17), .Y(apb_read_data_out[3]) );
  AND2X2M U21 ( .A(apb_write_data[3]), .B(n18), .Y(pwdata[3]) );
  AND2X8M U22 ( .A(prdata[4]), .B(n16), .Y(apb_read_data_out[4]) );
  AND2X2M U23 ( .A(apb_write_data[4]), .B(n18), .Y(pwdata[4]) );
  AND2X8M U24 ( .A(prdata[5]), .B(n17), .Y(apb_read_data_out[5]) );
  AND2X2M U25 ( .A(apb_write_data[5]), .B(n18), .Y(pwdata[5]) );
  AND2X8M U26 ( .A(prdata[6]), .B(n16), .Y(apb_read_data_out[6]) );
  AND2X2M U27 ( .A(apb_write_data[6]), .B(n18), .Y(pwdata[6]) );
  AND2X8M U28 ( .A(prdata[7]), .B(n17), .Y(apb_read_data_out[7]) );
  AND2X2M U29 ( .A(apb_write_data[7]), .B(n18), .Y(pwdata[7]) );
  AO22X1M U30 ( .A0(apb_read_paddr[7]), .A1(n17), .B0(apb_write_paddr[7]), 
        .B1(n19), .Y(paddr[7]) );
  AO22X1M U31 ( .A0(apb_read_paddr[1]), .A1(n17), .B0(apb_write_paddr[1]), 
        .B1(n19), .Y(paddr[1]) );
  AO22X1M U32 ( .A0(apb_read_paddr[5]), .A1(n17), .B0(apb_write_paddr[5]), 
        .B1(n19), .Y(paddr[5]) );
  AO22X1M U33 ( .A0(apb_read_paddr[0]), .A1(n16), .B0(apb_write_paddr[0]), 
        .B1(n19), .Y(paddr[0]) );
  AO22X1M U34 ( .A0(apb_read_paddr[4]), .A1(n16), .B0(apb_write_paddr[4]), 
        .B1(n19), .Y(paddr[4]) );
  AO22X1M U35 ( .A0(apb_read_paddr[3]), .A1(n17), .B0(apb_write_paddr[3]), 
        .B1(n19), .Y(paddr[3]) );
  AO22X1M U36 ( .A0(apb_read_paddr[2]), .A1(n16), .B0(apb_write_paddr[2]), 
        .B1(n19), .Y(paddr[2]) );
  AO22X1M U37 ( .A0(apb_read_paddr[6]), .A1(n16), .B0(apb_write_paddr[6]), 
        .B1(n19), .Y(paddr[6]) );
  NAND2BX2M U38 ( .AN(next_state[1]), .B(n6), .Y(next_state[0]) );
  SDFFRX4M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(PCLK), .RN(PRESERn), .Q(PSEL1), .QN(n2) );
  SDFFRX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n2), .SE(test_se), 
        .CK(PCLK), .RN(PRESERn), .Q(n3), .QN(n12) );
endmodule


module APB_SALVE ( PWRITE, PSEL1, PENABLE, paddr, pwdata, prdata, PREADY );
  input [7:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input PWRITE, PSEL1, PENABLE;
  output PREADY;
  wire   n1, n2, n3, n4;

  AND3X6M U14 ( .A(PSEL1), .B(PENABLE), .C(PWRITE), .Y(n1) );
  AND3X2M U3 ( .A(n1), .B(n2), .C(pwdata[0]), .Y(prdata[0]) );
  AND3X2M U4 ( .A(n1), .B(n2), .C(pwdata[1]), .Y(prdata[1]) );
  AND3X2M U5 ( .A(n1), .B(n2), .C(pwdata[2]), .Y(prdata[2]) );
  AND3X2M U6 ( .A(n1), .B(n2), .C(pwdata[3]), .Y(prdata[3]) );
  AND3X2M U7 ( .A(n1), .B(n2), .C(pwdata[4]), .Y(prdata[4]) );
  AND3X2M U8 ( .A(n1), .B(n2), .C(pwdata[5]), .Y(prdata[5]) );
  AND3X2M U9 ( .A(n1), .B(n2), .C(pwdata[6]), .Y(prdata[6]) );
  AND3X2M U10 ( .A(n1), .B(n2), .C(pwdata[7]), .Y(prdata[7]) );
  CLKAND2X6M U11 ( .A(n3), .B(n4), .Y(n2) );
  NOR4X2M U12 ( .A(paddr[7]), .B(paddr[6]), .C(paddr[5]), .D(paddr[4]), .Y(n4)
         );
  NOR4X2M U13 ( .A(paddr[3]), .B(paddr[2]), .C(paddr[1]), .D(paddr[0]), .Y(n3)
         );
  AND2X1M U15 ( .A(PENABLE), .B(PSEL1), .Y(PREADY) );
endmodule


module APB_top ( PCLK, transfer, PRESETn, READ_WRITE, apb_write_paddr, 
        apb_write_data, apb_read_paddr, SI, SE, scan_clk, scan_rst, test_mode, 
        SO, apb_read_data_out );
  input [7:0] apb_write_paddr;
  input [7:0] apb_write_data;
  input [7:0] apb_read_paddr;
  output [7:0] apb_read_data_out;
  input PCLK, transfer, PRESETn, READ_WRITE, SI, SE, scan_clk, scan_rst,
         test_mode;
  output SO;
  wire   TOP_PREADY, Top_PWRITE, TOP_PSEL1, TOP_PENABLE, CLK_M, RST_M;
  wire   [7:0] TOP_paddr;
  wire   [7:0] TOP_pwdata;
  wire   [7:0] TOP_prdata;

  mux2X1_0 U0_mux2X1 ( .IN_0(PCLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        CLK_M) );
  mux2X1_1 U1_mux2X1 ( .IN_0(PRESETn), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        RST_M) );
  APB_MASTER_test_1 U0_APB_MASTER ( .PCLK(CLK_M), .PRESERn(RST_M), 
        .READ_WRITE(READ_WRITE), .PREADY(TOP_PREADY), .transfer(transfer), 
        .prdata(TOP_prdata), .apb_write_paddr(apb_write_paddr), 
        .apb_write_data(apb_write_data), .apb_read_paddr(apb_read_paddr), 
        .apb_read_data_out(apb_read_data_out), .paddr(TOP_paddr), .pwdata(
        TOP_pwdata), .PENABLE(TOP_PENABLE), .PSEL1(TOP_PSEL1), .PWRITE(
        Top_PWRITE), .test_si(SI), .test_so(SO), .test_se(SE) );
  APB_SALVE U1_APB_SALVE ( .PWRITE(Top_PWRITE), .PSEL1(TOP_PSEL1), .PENABLE(
        TOP_PENABLE), .paddr(TOP_paddr), .pwdata(TOP_pwdata), .prdata(
        TOP_prdata), .PREADY(TOP_PREADY) );
endmodule

