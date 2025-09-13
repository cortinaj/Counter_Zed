`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 01:29:36 PM
// Design Name: 
// Module Name: freq_divider_tb
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


module freq_divider_tb;

    // Parameters
    parameter DIVISOR = 10;  // keep small for simulation

    // Testbench signals
    reg clk_in;
    reg rst;
    wire clk_out;

    // Instantiate DUT
    freq_divider #(DIVISOR) uut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Clock generation: 10 ns period
    always #5 clk_in = ~clk_in;

    initial begin
        // VCD dump for GTKWave/DVE
        $dumpfile("freq_divider_tb.vcd");
        $dumpvars(0, freq_divider_tb);

        // Monitor console output
        $monitor("T=%0t | rst=%b clk_in=%b clk_out=%b", 
                  $time, rst, clk_in, clk_out);

        // Init signals
        clk_in = 0;
        rst    = 1;

        // Hold reset
        #20 rst = 0;

        // Run long enough to see divided clock toggles
        #200;

        // Apply reset mid-sim
        rst = 1;
        #20 rst = 0;

        // Run again
        #200;

        // End simulation
        $finish;
    end
endmodule
