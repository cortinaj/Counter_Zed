`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:37:49 PM
// Design Name: 
// Module Name: fibonacci_counter
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


module fibonacci_counter #(parameter N = 8)(
    input clk,
    input rst,
    input dir,
    input pause,
    output reg [N-1:0] out
    );
    
    reg [7:0] prev, curr;

    always @(posedge clk) begin
        if (rst) begin
            prev <= 8'b0;     
            curr <= 8'b1;
            out  <= 8'b0;
        end else if (!pause) begin
            if (dir == 0) begin
                // Forward Fibonacci
                out  <= curr;
                curr <= prev + curr;
                prev <= out;
            end else begin
                // Reverse Fibonacci
                out  <= prev;
                prev <= curr - prev;
                curr <= out;
            end
        end
    end
endmodule
