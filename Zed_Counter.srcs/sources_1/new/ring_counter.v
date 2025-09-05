`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 03:45:07 PM
// Design Name: 
// Module Name: ring_counter
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


module ring_counter #(parameter N = 8)(
    input clk,
    input rst,
    input dir,
    input pause,
    output reg [N-1:0] out
    );
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            out <= 8'b0000_0001;
         else if (!pause) begin
            if(dir == 0) begin
                out <= (out << 1) | (out >> 7);
            end else begin
                out <= (out >> 1) | (out << 7);
            end
        end
    end   
endmodule
