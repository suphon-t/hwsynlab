`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 11:18:24 AM
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
    input btnU,
    input btnC,
    input [7:0] sw,
    input clock
    );
    
    wire [9:0] rawInputs, inputs;
    assign rawInputs[7:0] = sw;
    assign rawInputs[8] = btnU;
    assign rawInputs[9] = btnC;
    genvar c;
    generate for (c = 0; c < 10; c = c + 1)
    begin
        wire synchronized, debounced;
        synchronizer sinc(synchronized, rawInputs[c], clock);
        debouncer #(.CYCLES(4)) deb(debounced, synchronized, tclk[19]);
        singlePulser sp(inputs[c], debounced, clock);
    end
    endgenerate
    
    wire [15:0] num;
    wire [19:0] tclk;
    assign tclk[0] = clock;
    
    generate for (c = 0; c < 19; c = c + 1)
    begin
        clockDiv div(tclk[c + 1], tclk[c]);
    end
    endgenerate
    
    assign set9 = inputs[8];
    assign set0 = inputs[9];
    assign down1 = inputs[0];
    assign up1 = inputs[1];
    assign down10 = inputs[2];
    assign up10 = inputs[3];
    assign down100 = inputs[4];
    assign up100 = inputs[5];
    assign down1000 = inputs[6];
    assign up1000 = inputs[7];
    
    wire [3:0] ups, downs;
    assign ups = { up1000, up100, up10, up1 };
    assign downs = { down1000, down100, down10, down1 };
    assign sendSet9 = set9 | cout;
    assign sendSet0 = set0 | bout;
    
    tiledBcdCounter #(.DIGITS(4)) counter(num, cout, bout, ups, downs, sendSet9, sendSet0, clock);
    quadSevenSeg q7seg(seg, dp, an, num[3:0], num[7:4], num[11:8], num[15:12], tclk[19]);
endmodule
