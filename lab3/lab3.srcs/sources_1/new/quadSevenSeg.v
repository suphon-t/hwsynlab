`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2021 07:05:34 PM
// Design Name: 
// Module Name: quadSevenSeg
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


module quadSevenSeg(
    output [6:0] segments,
    output dp,
    output [3:0] an,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
    );
    
    reg [1:0] currentState;
    reg [1:0] nextState;
    reg [3:0] dispEn;
    
    reg [3:0] hexIn;
    segmentDecoder sd(segments, hexIn);
    assign an = ~dispEn;
    assign dp = 1;

    initial
    begin
        currentState = 0;
    end
    
    always @(posedge clk)
    begin
        currentState = nextState;
    end
    
    always @(currentState)
    begin
        nextState = currentState + 1;
    end
    
    always @(currentState)
    begin
        case (currentState)
            2'd0: dispEn = 4'b0001;
            2'd1: dispEn = 4'b0010;
            2'd2: dispEn = 4'b0100;
            2'd3: dispEn = 4'b1000;
        endcase
    end
    
    always @(currentState)
    begin
        case (currentState)
            2'd0: hexIn = num0;
            2'd1: hexIn = num1;
            2'd2: hexIn = num2;
            2'd3: hexIn = num3;
        endcase
    end
endmodule
