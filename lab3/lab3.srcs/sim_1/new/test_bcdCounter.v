`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:00:26 AM
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
    
    reg clock, up, down, set9, set0;
    wire [3:0] num;
    
    bcdCounter bcdc(num, cout, bout, up, down, set9, set0, clock);
    
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
        #10 up = 0;
        
        #10 up = 1;
        #10 up = 0;
        
        #10 set9 = 1;
        #10 set9 = 0;
        
        #10 up = 1;
        #10 up = 0;
        
        #10 down = 1;
        #10 down = 0;
        
        #10 down = 1;
        #10 down = 0;
        
        #10 set0 = 1;
        #10 set0 = 0;
        
        #100 $finish;
    end
    
endmodule
