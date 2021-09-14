`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2021 07:12:59 PM
// Design Name: 
// Module Name: test_quadSevenSeg
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


module test_quadSevenSeg(

    );
    
    wire [3:0] num0, num1, num2, num3;
    reg clk;
    
    initial
        clk = 0;
    
    always
        #100 clk = ~clk;
    
    assign num0 = 1;
    assign num1 = 2;
    assign num2 = 3;
    assign num3 = 4;
    
    wire [6:0] segments;
    wire [3:0] an;
    wire dp;
    quadSevenSeg q(segments, dp, an, num0, num1, num2, num3, clk);
    
endmodule
