`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 01:28:44 PM
// Design Name: 
// Module Name: mux_16to1
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


module mux_16to1(
    input wire [3:0] sel,
    input wire [7:0] in0,
    input wire [7:0] in1,
    input wire [7:0] in2,
    input wire [7:0] in3,
    input wire [7:0] in4,
    input wire [7:0] in5,
    input wire [7:0] in6,
    input wire [7:0] in7,
    input wire [7:0] in8,
    input wire [7:0] in9,
    input wire [7:0] in10,
    input wire [7:0] in11,
    input wire [7:0] in12,
    input wire [7:0] in13,
    input wire [7:0] in14,
    input wire [7:0] in15,
    output reg [7:0] out
    );
    
    always @(*) begin
        case (sel)
            4'b0000: out = in0;
            4'b0001: out = in1;
            4'b0010: out = in2;
            4'b0011: out = in3;
            4'b0100: out = in4;
            4'b0101: out = in5;
            4'b0110: out = in6;
            4'b0111: out = in7;
            4'b1000: out = in8;
            4'b1001: out = in9;
            4'b1010: out = in10;
            4'b1011: out = in11;
            4'b1100: out = in12;
            4'b1101: out = in13;
            4'b1110: out = in14;
            4'b1111: out = in15;
            default: out = 8'b0;
        endcase
    end
endmodule
