`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2021 08:09:42 PM
// Design Name: 
// Module Name: bcdCounter
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


module bcdCounter(
    output [3:0] hex,
    output overflow,
    input clk
    );
    
    reg [0:3] hex;
    reg overflow;
    
    initial
        hex = 0;
    
    always @(posedge clk)
    begin
        if (hex == 4'd9) 
        begin
            hex = 0;
            overflow = 1;
        end
        else 
        begin
            hex = hex + 1;
            overflow = 0;
        end
    end
endmodule
