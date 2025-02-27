module APB_top (

input         PCLK,
input         transfer,
input         PRESETn,
input         READ_WRITE,
input   [7:0] apb_write_paddr,
input   [7:0] apb_write_data,
input   [7:0] apb_read_paddr,

//DFT
input  wire                       SI,
input  wire                       SE,
input  wire                       scan_clk,
input  wire                       scan_rst,
input  wire                       test_mode,
output wire                       SO,

output  [7:0] apb_read_data_out

);


wire TOP_PREADY,Top_PWRITE,TOP_PSEL1,TOP_PENABLE;

wire [7:0] TOP_paddr,TOP_pwdata,TOP_prdata;

// DFT 

wire CLK_M;
wire RST_M;


// Muxing primary clock
mux2X1 U0_mux2X1 (
.IN_0(PCLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_M)
); 

// Muxing resets
mux2X1 U1_mux2X1 (
.IN_0(PRESETn),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RST_M)
); 

APB_MASTER U0_APB_MASTER (

.PCLK(CLK_M),
.PRESERn(RST_M),
.READ_WRITE(READ_WRITE),
.PREADY(TOP_PREADY),
.transfer(transfer),
.prdata(TOP_prdata),
.apb_write_paddr(apb_write_paddr),
.apb_write_data(apb_write_data),
.apb_read_paddr(apb_read_paddr),
.apb_read_data_out(apb_read_data_out),
.paddr(TOP_paddr),
.pwdata(TOP_pwdata),
.PENABLE(TOP_PENABLE),
.PSEL1(TOP_PSEL1),
.PWRITE(Top_PWRITE) 

);

APB_SALVE U1_APB_SALVE (

.PWRITE(Top_PWRITE),
.PSEL1(TOP_PSEL1),
.PENABLE(TOP_PENABLE),
.paddr(TOP_paddr),
.pwdata(TOP_pwdata),
.prdata(TOP_prdata),
.PREADY(TOP_PREADY)

);



endmodule
