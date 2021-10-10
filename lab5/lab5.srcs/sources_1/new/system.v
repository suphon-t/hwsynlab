`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 05:11:02 PM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [11:0] sw,
    input clock
    );
    
    clockScaler #(.PERIOD(   4_16667)) tdmClockScaler(tdmClock, clock);
    
    wire [15:0] nums;
//    reg nreset = 0;
    
    quadSevenSeg qs(seg, dp, an, nums, 4'b0, tdmClock);
    nano_sc_system NANOSCSYSTEM(nums, sw, 1, clock);
    
//    always @(posedge ~clock)
//    nreset = 1;
endmodule
