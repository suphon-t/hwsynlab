`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 04:58:43 PM
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
    
    reg clock = 0;
    
    wire [6:0] segments;
    wire [3:0] an;
    reg [15:0] num;
    
    quadSevenSeg q7s(segments, dp, an, num[15:12], num[11:8], num[7:4], num[3:0], 0, clock);
    
    always #10 clock = ~clock;
    
    initial
    begin
        num = 16'h0000;
        
        #100
        num = 16'h0001;
        
        #100 $finish;        
    end
    
endmodule
