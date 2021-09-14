`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 09:11:27 PM
// Design Name: 
// Module Name: tester_shift
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


module tester_shift(

    );
    
    reg clock, d;
    wire[1:0] qa; 
    wire[1:0] qb; 
    wire[3:0] qc;
    shiftA sa(qa, clock, d);
    shiftB sb(qb, clock, d);
    shift #(.N(4)) sc(qc, clock, d);
    
    always
        #10 clock = ~clock;
        
    initial
    begin
        #0 d = 0;
        clock = 0;
        #1000 $finish;
    end
    
    always 
        #8 d = ~d;
endmodule
