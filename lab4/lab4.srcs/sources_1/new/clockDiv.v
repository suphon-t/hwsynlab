`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 09:33:10 AM
// Design Name: 
// Module Name: clockDiv
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

module multiClockDiv(
    output [TIMES:0] dividedClocks,
    input clock
    );
    parameter TIMES=19;
    assign dividedClocks[0] = clock;
    genvar c;
    generate for (c = 0; c < 19; c = c + 1)
        clockDiv div(dividedClocks[c + 1], dividedClocks[c]);
    endgenerate
endmodule

module clockDiv(
    output clkDiv,
    input clk
    );
    
    reg clkDiv;
    
    initial
    begin
        clkDiv = 0;
    end
    
    always @(posedge clk)
    begin
        clkDiv = ~clkDiv;
    end
endmodule
