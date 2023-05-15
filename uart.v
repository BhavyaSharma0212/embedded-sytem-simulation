// UART module
module UART (
  input clk,
  input reset,
  input [7:0] data_in,
  input tx_enable,
  output reg [7:0] data_out,
  output reg tx_busy
);
  reg [7:0] tx_reg;
  reg tx_empty, tx_shift_reg;

  always @(posedge clk) begin
    if (reset) begin
      tx_empty <= 1;
      tx_shift_reg <= 0;
      tx_reg <= 0;
    end else begin
      if (tx_enable) begin
        if (tx_empty) begin
          tx_reg <= data_in;
          tx_shift_reg <= 1;
          tx_empty <= 0;
        end
      end else begin
        if (!tx_empty) begin
          tx_shift_reg <= 1;
        end
      end
    end
  end

  always @(posedge clk) begin
    if (tx_shift_reg) begin
      if (tx_busy) begin
        tx_shift_reg <= 0;
        tx_empty <= 1;
      end else begin
        data_out <= tx_reg;
        tx_busy <= 1;
        tx_shift_reg <= 0;
      end
    end else begin
      data_out <= 0;
    end
  end
endmodule