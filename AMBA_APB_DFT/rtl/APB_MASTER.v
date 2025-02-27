module APB_MASTER (
input            PCLK,
input            PRESERn,
input            READ_WRITE,
input            PREADY,
input            transfer,
input      [7:0] prdata,
input      [7:0] apb_write_paddr,
input      [7:0] apb_write_data,
input      [7:0] apb_read_paddr,
output reg [7:0] apb_read_data_out,
output     [7:0] paddr,
output     [7:0] pwdata,
output reg       PENABLE,
output reg       PSEL1,
output reg       PWRITE );



reg [1:0] current_state , next_state;


reg [7:0] temp1_addr, temp2_data;

assign paddr  = temp1_addr ;
assign pwdata = temp2_data;

localparam [2:0] IDLE   = 'd 000 ,
                 SETUP  = 'd 001 ,
				 ACCESS = 'd 011 ;
				 
				 
				 
always @ (posedge PCLK or negedge PRESERn)
 
 begin
 
 if (!PRESERn)
 
 current_state <= IDLE ; 
 
 else 
 
 current_state <= next_state ;
 
 end
 
 
 always @ (*)
  
  begin
  
apb_read_data_out = 'd0;

PENABLE           = 'd0; 
PSEL1             = 'd0;
PWRITE            = READ_WRITE;
temp1_addr        = 'd0;
temp2_data        = 'd0;
				 
case (current_state)

IDLE : begin

        if (transfer)
          next_state = SETUP ;
	    else
 	      next_state = IDLE ;
		  
	   end 

SETUP : begin

         PSEL1   = 'd1;
		 PENABLE = 'd0;
		 
		 if (READ_WRITE) 		 // READ_WRITE = 1 == WRITE operation 
		 
		  begin 
		  
		  
		  temp1_addr      = apb_write_paddr ;
		  temp2_data      = apb_write_data  ;
		  next_state      = ACCESS          ;
		  
		  end
		
		else                     // READ_WRITE = 0 == READ operation
		
		 begin 
		 
		  
		  temp1_addr        = apb_read_paddr ;
		  apb_read_data_out = prdata         ;
		  next_state        = ACCESS         ;
		 
		 
		 end
	
	  end
		 
		 
ACCESS : begin
          
		  PSEL1   = 'd1;
		  PENABLE = 'd1;
		  
		  if (PREADY)
		  
		   begin 
		   
		   if (transfer)
		       
			   next_state = SETUP ;
			
		   else

              next_state = IDLE ;
			  
		  end  
		  
		  else 
		  
		   next_state = ACCESS ;
		   
		 end
		 
		 
default : begin 
           next_state = IDLE ;
          end
		  

endcase

end 

endmodule
		  
		   
		   
		  




		 



