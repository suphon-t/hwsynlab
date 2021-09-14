`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 08:35:49 PM
// Design Name: 
// Module Name: tester_dFlipFlop
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


module tester_dFlipFlop(

    );
    
    reg clock, nreset, d;
    dFlipFlop d1(q, clock, nreset, d);
    
    always
        #10 clock = ~clock;
        
    initial
    begin
        #0 d = 0;
        clock = 0;
        nreset = 0;
        #58 nreset = 1;
        #100 $finish;
    end
    
    always 
        #8 d = ~d;
endmodule
