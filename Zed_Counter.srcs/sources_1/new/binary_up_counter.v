`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 01:33:51 PM
// Design Name: 
// Module Name: binary_up_counter
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


module binary_up_counter #(parameter N = 8) (
    input clk,
    input rst,
    input dir,
    input pause,
    output reg [N-1:0] count
    );
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            count <= 0;
            end
        else if(!pause) begin
            if (dir == 0)
                count <= count + 1;
            else
                count <= count  - 1;
        end
    end
endmodule
