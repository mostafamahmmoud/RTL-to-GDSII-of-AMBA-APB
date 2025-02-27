module APB_top (

input         PCLK,
input         transfer,
input         PRESETn,
input         READ_WRITE,
input   [7:0] apb_write_paddr,
input   [7:0] apb_write_data,
input   [7:0] apb_read_paddr,
output  [7:0] apb_read_data_out

);


wire TOP_PREADY,Top_PWRITE,TOP_PSEL1,TOP_PENABLE;

wire [7:0] TOP_paddr,TOP_pwdata,TOP_prdata;

APB_MASTER U0_APB_MASTER (

.PCLK(PCLK),
.PRESERn(PRESETn),
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
