`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:25:49 PM
// Design Name: 
// Module Name: bcd_counter_tb
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


module bcd_counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg dir;
    reg pause;
    wire [N-1:0] out;

    // Instantiate DUT
    bcd_counter #(N) uut (
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
        $dumpfile("bcd_counter_tb.vcd");
        $dumpvars(0, bcd_counter_tb);

        // Console monitor (show BCD digits separately)
        $monitor("T=%0t | rst=%b pause=%b dir=%b | tens=%0d ones=%0d out=%b",
                  $time, rst, pause, dir, out[7:4], out[3:0], out);

        // Initialize signals
        clk   = 0;
        rst   = 1;   // reset active
        dir   = 0;   // count up
        pause = 0;

        // Hold reset
        #20 rst = 0;

        // Count up (00 ? 15, etc.)
        #160;

        // Pause counter
        pause = 1;
        #40;
        pause = 0;

        // Switch to count down
        dir = 1;
        #160;

        // Reset again
        rst = 1;
        #20 rst = 0;

        // Count up again
        dir = 0;
        #100;

        // End simulation
        $finish;
    end
endmodule
