module Comparator2 (
   input[1:0] A, B,
   output reg Equals
);      		
   always @(A or B) begin
      Equals = (A[1] ~^ B[1]) & (A[0] ~^ B[0]);
   end              	          	

endmodule
