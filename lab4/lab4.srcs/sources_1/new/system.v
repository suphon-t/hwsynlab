`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 09:25:08 AM
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
    input btnC,
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    input [15:0] sw,
    input clock
    );
    
    wire [19:0] dividedClocks;
    multiClockDiv #(.TIMES(19)) cd(dividedClocks, clock);
    wire slowClock = dividedClocks[17];
    
    wire [1:0] program_select = debounced_sw[15:14];
    
    wire [15:0] display[3:0];
    wire [3:0] dps[3:0];
    wire displayMode[3:0];
    wire [15:0] num = display[program_select];
    wire [15:0] debounced_sw;
    inputFilter #(.WIDTH(5)) ip_control({ bc, bu, bl, br, bd }, { btnC, btnU, btnL, btnR, btnD }, clock, slowClock);
    inputFilter #(.WIDTH(16), .SINGLE_PULSE(0)) ip_sw(debounced_sw, sw, clock, slowClock);
    
    assign displayMode[0] = 1'b0;
    assign displayMode[1] = 1'b1;
    assign dps[0] = 4'b0000;
    assign dps[1] = 4'b0000;
    
    quadSevenSeg q7seg(seg, dp, an, num[15:12], num[11:8], num[7:4], num[3:0], dps[program_select], displayMode[program_select], slowClock);
    
    stack stack(display[0], clock && program_select == 2'd0, bu, bc, bd, sw[7:0]);
    hexToBcd htb(display[1], sw[4:0]);
    calculator cal(display[2], dps[2], displayMode[2], clock && program_select == 2'd2, sw[7:0], bc, bu, bl, bd, br);
endmodule
