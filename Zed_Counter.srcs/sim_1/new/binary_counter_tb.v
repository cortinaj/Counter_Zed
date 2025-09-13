`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:08:50 PM
// Design Name: 
// Module Name: binary_counter_tb
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


`timescale 1ns/1ps

module binary_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] count;

    // Instantiate DUT
    binary_up_counter #(N) uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .pause(pause),
        .count(count)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Enable waveform dump
        $dumpfile("binary_counter_tb.vcd");
        $dumpvars(0, binary_counter_tb);

        // Display all activity in console
        $monitor("T=%0t | rst=%b pause=%b dir=%b count=%0d", 
                  $time, rst, pause, dir, count);

        // Initialize
        clk   = 0;
        rst   = 1;
        dir   = 0;   // up
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Count up
        #100;

        // Pause
        pause = 1; 
        #40;
        pause = 0;

        // Count down
        dir = 1;
        #100;

        // Reset again
        rst = 1; 
        #20 rst = 0;

        // Count up again
        dir = 0;
        #80;

        // End
        $finish;
    end
endmodule