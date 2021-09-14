`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 05:21:57 PM
// Design Name: 
// Module Name: test_calculatorRom
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


module test_calculatorRom(

    );
    
    wire [15:0] out;
    reg [9:0] opAB;
    
    calculatorRom cr(out, opAB);
    
    initial
    begin
        #5 opAB = { 2'd0, 4'd5, 4'd4 };
        #5 opAB = { 2'd1, 4'd5, 4'd4 };
        #5 $finish;
    end
endmodule
