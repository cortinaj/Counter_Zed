`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:23:25 PM
// Design Name: 
// Module Name: fibonacci_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fibonacci_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] out;

    // Instantiate DUT
    fibonacci_counter #(N) uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .pause(pause),
        .out(out)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // VCD dump for GTKWave/DVE
        $dumpfile("fibonacci_counter_tb.vcd");
        $dumpvars(0, fibonacci_counter_tb);

        // Console monitoring
        $monitor("T=%0t | rst=%b pause=%b dir=%b out=%0d", 
                  $time, rst, pause, dir, out);

        // Initialize signals
        clk   = 0;
        rst   = 1;   // reset active
        dir   = 0;   // forward Fibonacci
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Run forward Fibonacci sequence
        #200;

        // Pause sequence
        pause = 1;
        #40;
        pause = 0;

        // Switch to "reverse" Fibonacci
        dir = 1;
        #100;

        // Reset again
        rst = 1;
        #20 rst = 0;

        // Forward again
        dir = 0;
        #120;

        // End simulation
        $finish;
    end
endmodule
