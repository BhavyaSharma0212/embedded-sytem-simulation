// Timer module
module Timer (
input clk,
input reset,
input enable,
output reg trigger
);
reg [31:0] count;

always @(posedge clk) begin
if (reset) begin
count <= 0;
trigger <= 0;
end else begin
if (enable) begin
count <= count + 1;
if (count == 1000000) begin
trigger <= 1;
count <= 0;
end
end else begin
trigger <= 0;
count <= 0;
end
end
end
endmodule