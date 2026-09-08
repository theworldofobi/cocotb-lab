module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr,
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren
);

  reg [8:0] fifo_array[7:0];
  reg [7:0] wrptr, rdptr;

  wire empty = (wrptr[3:0] == rdptr[3:0]);
  wire full  = (wrptr[2:0] == rdptr[2:0]) && (wrptr[3] != rdptr[3]);

  always @(posedge clk or posedge rst) begin
    if (rst)                 wrptr <= 8'b0;
    else if (WrPtrClr)       wrptr <= 8'b0;
    else if (WrInc && !full) wrptr <= wrptr + 1'b1;
  end

  always @(posedge clk or posedge rst) begin
    if (rst)                  rdptr <= 8'b0;
    else if (RdPtrClr)        rdptr <= 8'b0;
    else if (RdInc && !empty) rdptr <= rdptr + 1'b1;
  end

  always @(posedge clk) begin
    if (wren && !full)
      fifo_array[wrptr[2:0]] <= DataIn;
  end

  always @(posedge clk or posedge rst) begin
    if (rst)                 DataOut <= 9'b0;
    else if (rden && !empty) DataOut <= fifo_array[rdptr[2:0]];
  end

endmodule
