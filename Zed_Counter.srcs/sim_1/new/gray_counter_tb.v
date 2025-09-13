`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:20:48 PM
// Design Name: 
// Module Name: gray_counter_tb
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


module gray_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] out;

    // Instantiate DUT
    gray_counter #(N) uut (
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
        $dumpfile("gray_counter_tb.vcd");
        $dumpvars(0, gray_counter_tb);

        // Monitor console output
        $monitor("T=%0t | rst=%b pause=%b dir=%b out=%b", 
                  $time, rst, pause, dir, out);

        // Init signals
        clk   = 0;
        rst   = 1;   // reset active
        dir   = 0;   // up
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Count up in Gray
        #100;

        // Pause the counter
        pause = 1;
        #40;
        pause = 0;

        // Count down in Gray
        dir = 1;
        #100;

        // Reset again
        rst = 1;
        #20 rst = 0;

        // Count up again
        dir = 0;
        #80;

        // End simulation
        $finish;
    end
endmodule
