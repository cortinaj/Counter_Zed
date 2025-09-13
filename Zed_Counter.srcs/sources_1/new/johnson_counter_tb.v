`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:17:00 PM
// Design Name: 
// Module Name: johnson_counter_tb
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


module johnson_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] out;

    // Instantiate DUT
    johnson_counter #(N) uut (
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
        $dumpfile("johnson_counter_tb.vcd");
        $dumpvars(0, johnson_counter_tb);

        // Console monitor
        $monitor("T=%0t | rst=%b pause=%b dir=%b out=%b",
                  $time, rst, pause, dir, out);

        // Init signals
        clk   = 0;
        rst   = 1;   // assert reset
        dir   = 0;   // shift left first
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Run forward (dir=0)
        #120;

        // Pause counter
        pause = 1;
        #40;
        pause = 0;

        // Reverse direction (dir=1)
        dir = 1;
        #120;

        // Reset again
        rst = 1;
        #20 rst = 0;

        // Forward again
        dir = 0;
        #80;

        // End simulation
        $finish;
    end
endmodule
