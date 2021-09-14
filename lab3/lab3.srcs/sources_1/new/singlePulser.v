`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:39:48 AM
// Design Name: 
// Module Name: singlePulser
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


module singlePulser(
    output q,
    input d,
    input clock
    );
    
    reg curr, prev;
    initial
    begin
        curr = 0;
        prev = 0;
    end
    
    assign q = curr & ~prev;
    
    always @(posedge clock)
    begin
        prev = curr;
        curr = d;
    end
endmodule
