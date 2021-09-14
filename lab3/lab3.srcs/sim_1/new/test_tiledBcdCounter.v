`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:27:52 AM
// Design Name: 
// Module Name: test_tiledBcdCounter
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


module test_tiledBcdCounter(

    );
    
    reg clock, up, down, set9, set0;
    wire [3:0] ups, down;
    wire [15:0] num;
    assign ups = { 0, 0, 0, up };
    assign downs = { 0, 0, 0, down };
    
    tiledBcdCounter #(.DIGITS(4)) counter(num, cout, bout, up, down, set9, set0, clock);
    
    wire [3:0] num3, num2, num1, num0;
    assign num3 = num[15:12];
    assign num2 = num[11:8];
    assign num1 = num[7:4];
    assign num0 = num[3:0];
    
    always #10 clock = ~clock;
    
    initial
    begin
        clock = 0;
        up = 0;
        down = 0;
        set9 = 0;
        set0 = 0;
        
        #15
        #10 up = 1;
        #250 up = 0;
        
        #10 set9 = 1;
        #10 set9 = 0;
        
        #10 set0 = 1;
        #10 set0 = 0;
        
        #10 down = 1;
        #250 down = 0;
        
        #100 $finish;
    end
    
endmodule
