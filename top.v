// Top-level module
module Top (
input clk,
input reset,
input [31:0] cpu_input1,
input [31:0] cpu_input2,
input [3:0] cpu_operation,
input [31:0] memory_address,
input [31:0] memory_data_in,
input memory_write_enable,
input [7:0] uart_data_in,
input uart_tx_enable,
input timer_enable,
output [31:0] cpu_result,
output [31:0] memory_data_out,
output [7:0] uart_data_out,
output uart_tx_busy,
output timer_trigger,
output reg zero_flag
);
CPU cpu_inst (
.input1(cpu_input1),
.input2(cpu_input2),
.operation(cpu_operation),
.result(cpu_result)
);

Memory memory_inst (
.address(memory_address),
.data_in(memory_data_in),
.write_enable(memory_write_enable),
.data_out(memory_data_out)
);


UART uart_inst (
.clk(clk),
.reset(reset),
.data_in(uart_data_in),
.tx_enable(uart_tx_enable),
.data_out(uart_data_out),
.tx_busy(uart_tx_busy)
);

Timer timer_inst (
.clk(clk),
.reset(reset),
.enable(timer_enable),
.trigger(timer_trigger)
);
endmodule

