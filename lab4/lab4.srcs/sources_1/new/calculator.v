`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 11:29:23 AM
// Design Name: 
// Module Name: calculator
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


module calculator(
    output [15:0] display,
    output [3:0] dps,
    output displayMode,
    input clock,
    input [7:0] sw,
    input reset,
    input add,
    input sub,
    input mul,
    input div
    );
    
    wire [3:0] a = sw[7:4], b = sw[3:0];
    
    wire [7:0] bcdA, bcdB;
    hexToBcd h2bA(bcdA, { 1'b0, a });
    hexToBcd h2bB(bcdB, { 1'b0, b });
    
    wire [15:0] out;
    wire [3:0] romDps;
    reg [9:0] opAB = 0;
    calculatorRom cr(out, romDps, opAB);
    
    reg disp_out = 0;
    assign display = disp_out ? out : { bcdA, bcdB };
    assign dps = disp_out ? romDps : 0;
    assign displayMode = 1;
    
    reg [3:0] prev_a = 0, prev_b = 0;
    
    always @(posedge clock)
    begin
        if (add)
        begin
            opAB = { 2'd0, a, b };
            disp_out = 1;
        end
        else if (sub) 
        begin
            opAB = { 2'd1, a, b };
            disp_out = 1;
        end
        else if (mul)
        begin
            opAB = { 2'd2, a, b };
            disp_out = 1;
        end
        else if (div)
        begin
            opAB = { 2'd3, a, b };
            disp_out = 1;
        end
        else if (reset)
        begin
            disp_out = 0;        
        end
        else if (a != prev_a)
        begin
            prev_a = a;
            disp_out = 0;
        end
        else if (b != prev_b)
        begin
            prev_b = b;
            disp_out = 0;
        end
    end
endmodule
