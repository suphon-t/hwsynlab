`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2021 11:19:33 PM
// Design Name: 
// Module Name: test_hexToBcd
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


module test_hexToBcd(

    );
    
    reg [7:0] hex = 0;
    wire [7:0] bcd;
    hexToBcd h2b(bcd, hex);
    
    initial
    begin
    
    #5 hex = 8'd10;
    #5 hex = 8'd30;
    #5 $finish;
    
    end
endmodule
