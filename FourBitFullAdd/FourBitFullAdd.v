module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B;
    input Cin; 			
    output [3:0] Sum;
    output Cout;

    wire C0, C1, C2;

    assign Sum[0] = A[0] ^ B[0] ^ Cin;
    assign C0 = (A[0] & B[0]) | (Cin & (A[0] ^ B[0]));

    assign Sum[1] = A[1] ^ B[1] ^ C0;
    assign C1 = (A[1] & B[1]) | (C0 & (A[1] ^ B[1]));

    assign Sum[2] = A[2] ^ B[2] ^ C1;
    assign C2 = (A[2] & B[2]) | (C1 & (A[2] ^ B[2]));

    assign Sum[3] = A[3] ^ B[3] ^ C2;
    assign Cout = (A[3] & B[3]) | (C2 & (A[3] ^ B[3]));
                   	          	
endmodule
