module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

  localparam A = 2'b00;
  localparam B = 2'b01;
  localparam C = 2'b10;

  reg [1:0] current_state, next_state;

  always @(posedge CLK or negedge RST) begin
    if (!RST) begin
      current_state <= A;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin
    case (current_state)
      A: next_state = (In1) ? B : A;
      B: next_state = (In1) ? B : C;
      C: next_state = (In1) ? A : C;
      default: next_state = current_state;
    endcase
  end

  always @(*) begin
    case (current_state)
      A: Out1 = 1'b0;
      B: Out1 = 1'b0;
      C: Out1 = 1'b1;
      default: Out1 = 1'b0;
    endcase
  end

endmodule
