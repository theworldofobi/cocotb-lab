module Majority (A, B, C, Y);                 	
   input  A, B, C;			
   output Y; 

   reg Y;           		
                   	          	
   always @(A or B or C) begin
      Y <= (A & B) | (B & C) | (C & A);
   end

endmodule
