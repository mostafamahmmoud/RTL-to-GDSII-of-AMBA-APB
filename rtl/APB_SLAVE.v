module APB_SALVE (

input            PWRITE    ,
input            PSEL1     ,
input            PENABLE   ,
input      [7:0] paddr     ,
input      [7:0] pwdata    ,
output     [7:0] prdata    ,
output reg       PREADY

);

reg [7:0] address ;

reg [7:0] mem [63:0];

integer i;



assign prdata = mem[address];




always @ (*) 
		 
  begin 
    PREADY  = 'd0;
    address = 'd0;
for (i = 0 ; i < 64 ; i = i + 1)
begin 
  mem[i] = 'd0;
end

    if (PSEL1)
  
    begin 
	  
	  if(PENABLE && PWRITE)
	  
	     begin 
		 
		   mem[paddr] = pwdata ;
		   PREADY     = 'd1    ;
		 end
		 
	  else if (PENABLE && !PWRITE) 
	  
	     begin 
		  address = paddr ;
		  PREADY  = 'd1   ;
		 end
		 
	 else 
	 
	     PREADY  = 'd0   ;
		 
	end
	
	
   else 
   
        PREADY  = 'd0   ;
		
  end
		 
endmodule
