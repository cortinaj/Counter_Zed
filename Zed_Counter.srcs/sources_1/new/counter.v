`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 01:36:06 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input [7:0] sw,
    output [7:0] led
    );
    
    //Create Wires
    wire rst;
    wire clk_1Hz;
    wire [7:0] bin_count, ring_count, johnson_count;
    wire [7:0] out_mux;
    
    //Instantiate Modules
    freq_divider #(.DIVISOR(50_000_000)) div1Hz(.clk_in(clk),
                                                .rst(sw[0]),
                                                .clk_out(clk_1Hz)
                                                );
    binary_up_counter bin(.clk(clk_1Hz),
                          .rst(sw[0]),
                          .dir(sw[1]),
                          .pause(sw[2]),
                          .count(bin_count)
                          );
   ring_counter ring(.clk(clk_1Hz),
                     .rst(sw[0]),
                     .dir(sw[1]),
                     .pause(sw[2]),
                     .out(ring_count)
                     );
                     
    johnson_counter johnson(.clk(clk_1Hz),
                            .rst(sw[0]),
                            .dir(sw[1]),
                            .pause(sw[2]),
                            .out(johnson_count)
                            );
    
    mux_16to1 MUX(.sel(sw[6:3]),
                 .in0(bin_count),      
                 .in1(ring_count),     
                 .in2(johnson_count),           
                 .in3(8'b0),           
                 .in4(8'b0),
                 .in5(8'b0),
                 .in6(8'b0),
                 .in7(8'b0),
                 .in8(8'b0),
                 .in9(8'b0),
                 .in10(8'b0),
                 .in11(8'b0),
                 .in12(8'b0),
                 .in13(8'b0),
                 .in14(8'b0),
                 .in15(8'b0),
                 .out(out_mux)
                 );  
    assign led = out_mux;                     
endmodule
