`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 03:57:20 PM
// Design Name: 
// Module Name: gray_counter
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


module gray_counter #(parameter N = 8)(
    input clk,
    input rst,
    input dir,
    input pause,
    output reg [N-1:0] out
    );
    
    reg [N-1:0] bin_count; //internal binary counter
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            bin_count <= 8'b0000_0000;
        else if (!pause) begin
            if(dir == 0)
                bin_count <= bin_count + 1;
            else
                bin_count <= bin_count - 1;
        end 
    end
    
    always@(*) begin
        out = bin_count ^ (bin_count >> 1);
    end
endmodule
