`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2021 07:31:50 PM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk
    );
    
    wire [3:0] num0, num1, num2, num3;
    
    assign num0 = 4;
    assign num1 = 3;
    assign num2 = 2;
    assign num3 = 1;
    
    wire targetClk;
    
    wire [19:0] tclk;
    assign tclk[0] = clk;
    
    genvar c;
    generate for (c = 0; c < 19; c = c + 1)
    begin
        clockDiv div(tclk[c + 1], tclk[c]);
    end
    endgenerate
    
//    bcdCounter counter0(num0, overflow0, tclk[24]);
//    bcdCounter counter1(num1, overflow1, overflow0);
//    bcdCounter counter2(num2, overflow2, overflow1);
//    bcdCounter counter3(num3, overflow3, overflow2);
    quadSevenSeg q7seg(seg, dp, an, num0, num1, num2, num3, tclk[19]);
endmodule
