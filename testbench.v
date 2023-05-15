// Testbench module
module Testbench ();
reg clk, reset;
reg [31:0] cpu_input1, cpu_input2, memory_address, memory_data_in;
reg [3:0] cpu_operation;
reg memory_write_enable, uart_tx_enable, timer_enable;
reg [7:0] uart_data_in;
wire [31:0] cpu_result, memory_data_out;
wire [7:0] uart_data_out;
wire uart_tx_busy, timer_trigger;
wire zero_flag;

Top top_inst (
.clk(clk),
.reset(reset),
.cpu_input1(cpu_input1),
.cpu_input2(cpu_input2),
.cpu_operation(cpu_operation),
.memory_address(memory_address),
.memory_data_in(memory_data_in),
.memory_write_enable(memory_write_enable),
.uart_data_in(uart_data_in),
.uart_tx_enable(uart_tx_enable),
.timer_enable(timer_enable),
.cpu_result(cpu_result),
.memory_data_out(memory_data_out),
.uart_data_out(uart_data_out),
.uart_tx_busy(uart_tx_busy),
.timer_trigger(timer_trigger),
.zero_flag(zero_flag)
);
integer i;
initial begin
    
    for(i=0;i<20;i=i+1) begin
clk = 0+ 10*i;
reset = 1;
cpu_input1 = 2*i;
cpu_input2 = 0 + 3*i;
cpu_operation = i%5;
memory_address = i;
memory_data_in = 30*i;
memory_write_enable = i%2;
uart_data_in = 15*i;
uart_tx_enable = i%2;
timer_enable = i%2;
#10 reset = 0;
    end

#100000;

$finish;
end

always #5 clk = ~clk;
initial begin
        $dumpfile("output.vcd");
        $dumpvars(1);
    end
endmodule