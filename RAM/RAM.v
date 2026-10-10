module RAM128x32 #(
  parameter DATA_WIDTH = 32,
            ADDR_WIDTH = 7
) (  //ports
    input wire clk,
    input wire we,
    input wire [(ADDR_WIDTH-1):0] address, 
    input wire [(DATA_WIDTH-1):0] d,
    output wire [(DATA_WIDTH-1):0] q
  );

  reg [(DATA_WIDTH-1):0] ram [0:2**(ADDR_WIDTH-1)];

  always @(posedge clk)
  begin
    if (we)
      ram[address] <= d;
  end

  assign q = ram[address];
  
endmodule
