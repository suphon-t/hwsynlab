`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 02:12:56 PM
// Design Name: 
// Module Name: test_debouncer
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


module test_debouncer(

    );
    
    reg clock, d;
    debouncer #(.CYCLES(4)) deb(q, d, clock);
    
    always #10 clock = ~clock;
    
    initial
    begin
        clock = 0;
        d = 0;
        
        #5 d = 1;
        #90 d = 0;
        
        #50 d = 1;
        #10 d = 0;
        
        #100 $finish;
    end
endmodule
