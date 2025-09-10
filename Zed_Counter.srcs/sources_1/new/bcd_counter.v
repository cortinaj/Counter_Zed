`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:43:54 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter #(parameter N = 8)(
    input clk,
    input rst,
    input dir,
    input pause,
    output [N-1:0] out
    );
    
    reg [3:0] ones, tens;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ones <= 4'd0;
            tens <= 4'd0;
        end else if (!pause) begin
            if (dir == 0) begin
                // Count up
                if (ones == 9) begin
                    ones <= 0;
                    if (tens == 9)
                        tens <= 0;
                    else
                        tens <= tens + 1;
                end else begin
                    ones <= ones + 1;
                end
            end else begin
                // Count down
                if (ones == 0) begin
                    ones <= 9;
                    if (tens == 0)
                        tens <= 9;
                    else
                        tens <= tens - 1;
                end else begin
                    ones <= ones - 1;
                end
            end
        end
    end

    assign out = {tens, ones};
endmodule
