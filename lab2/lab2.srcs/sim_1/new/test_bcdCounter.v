`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2021 08:11:44 PM
// Design Name: 
// Module Name: test_bcdCounter
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


module test_bcdCounter(

    );
    
    reg clk;
    
    initial
        clk = 0;
    
    wire [3:0] num0, num1;
    bcdCounter counter0(num0, overflow0, clk);
    bcdCounter counter1(num1, overflow1, overflow0);
    
    always
        #25 clk = ~clk;
endmodule
