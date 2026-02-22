`timescale 1ns/1ps

module CPU_tb;

    reg clk, rst;
    wire [7:0] alu_result;
    wire [3:0] stat ;

    // Instantiate CPU
    CPU uut (
        .clk(clk),
        .rst(rst),
        .alu_result(alu_result),
        .stat(stat)
    );

    // Clock generation (10ns period - 100 MHz)
    always #5 clk = ~clk;

    initial begin
       clk=0;
       rst = 1;
       #1;
       rst = 0;
       #1000;
    
        $stop;  // stop simulation
    end
    endmodule

