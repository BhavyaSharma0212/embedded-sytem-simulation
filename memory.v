// Memory module
module Memory (
  input [31:0] address,
  input [31:0] data_in,
  input write_enable,
  output reg [31:0] data_out
);
  reg [31:0] memory [0:1023];

  always @(*) begin
    if (write_enable) begin
      memory[address] <= data_in;
    end
    data_out <= memory[address];
  end
endmodule

