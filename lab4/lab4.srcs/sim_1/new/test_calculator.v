`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 11:36:37 AM
// Design Name: 
// Module Name: test_calculator
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


module test_calculator(

    );
    
    reg clock, add, sub, mul, div;
    reg [3:0] a, b;
    wire [7:0] sw = { a, b };
    wire [15:0] display;
    
    calculator calc(display, clock, sw, add, sub, mul, div);
    
    always #10 clock = ~clock;
    
    initial
    begin
        clock = 0;
        add = 0;
        sub = 0;
        mul = 0;
        div = 0;
        a = 0;
        b = 0;
        
        
        #5
        a = 4'd8;
        b = 4'd2;
        
        #20
        add = 1;
        
        #20
        add = 0;
        sub = 1;
        
        #20
        sub = 0;
        mul = 1;
        
        #20
        mul = 0;
        div = 1;
        
        #20 $finish;
    end
endmodule
