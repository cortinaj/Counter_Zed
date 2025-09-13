`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:12:56 PM
// Design Name: 
// Module Name: ring_counter_tb
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


module ring_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] out;

    // Instantiate DUT
    ring_counter #(N) uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .pause(pause),
        .out(out)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // VCD waveform dump (for GTKWave or DVE)
        $dumpfile("ring_counter_tb.vcd");
        $dumpvars(0, ring_counter_tb);

        // Console monitor
        $monitor("T=%0t | rst=%b pause=%b dir=%b out=%b", 
                  $time, rst, pause, dir, out);

        // Init signals
        clk   = 0;
        rst   = 1;   // reset active
        dir   = 0;   // rotate left
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Let it rotate left for a few cycles
        #100;

        // Pause
        pause = 1;
        #40;
        pause = 0;

        // Change direction ? rotate right
        dir = 1;
        #100;

        // Reset again
        rst = 1;
        #20 rst = 0;

        // Rotate left again
        dir = 0;
        #80;

        // End
        $finish;
    end
endmodule
