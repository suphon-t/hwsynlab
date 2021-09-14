`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:10:01 AM
// Design Name: 
// Module Name: tiledBcdCounter
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


module tiledBcdCounter(
    output [DIGITS*4-1:0] num,
    output cout,
    output bout,
    input [DIGITS-1:0] ups,
    input [DIGITS-1:0] downs,
    input set9,
    input set0,
    input clock
    );
    
    parameter DIGITS = 4;
    
    wire [DIGITS:0] cin, bin;
    assign cin[0] = 0;
    assign bin[0] = 0;
    assign cout = cin[DIGITS];
    assign bout = bin[DIGITS];
    
    genvar c;
    generate for (c = 0; c < DIGITS; c = c + 1)
    begin
        wire up, down;
        assign up = cin[c] | ups[c];
        assign down = bin[c] | downs[c];
        bcdCounter counter(num[c*4+3:c*4], cin[c+1], bin[c+1], up, down, set9, set0, clock);
    end
    endgenerate
endmodule
