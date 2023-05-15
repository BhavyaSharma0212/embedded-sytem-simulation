// CPU module
module CPU (
  input [31:0] input1,
  input [31:0] input2,
  input [3:0] operation,
  output reg [31:0] result
);
  always @(*) begin
    case (operation)
      4'b0000: result <= input1 + input2; // Addition
      4'b0001: result <= input1 - input2; // Subtraction
      4'b0010: result <= input1 & input2; // Bitwise AND
      4'b0011: result <= input1 | input2; // Bitwise OR
      4'b0100: result <= input1 ^ input2; // Bitwise XOR
      default: result <= 0; // Default to 0
    endcase
  end
endmodule