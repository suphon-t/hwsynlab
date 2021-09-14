`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:54:04 AM
// Design Name: 
// Module Name: test_singlePulser
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


module test_singlePulser(

    );
    
    reg clock, d;
    always #10 clock = ~clock;
    
    singlePulser sp(q, d, clock);
    
    initial
    begin
        clock = 0;
        d = 0;
        
        #5 d = 1;
        #30 d = 0;
        
        #30 d = 1;
        #10 d = 0;
        
        #100 $finish;
    end
endmodule
