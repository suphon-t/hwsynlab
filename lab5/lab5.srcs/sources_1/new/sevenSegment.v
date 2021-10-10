`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 09:14:08 AM
// Design Name: 
// Module Name: sevenSegment
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
    input [15:0] nums,
    input [3:0] dps,
    input clk
    );
    
    reg [1:0] currentState;
    reg [1:0] nextState;
    reg [3:0] dispEn;
    
    reg [3:0] hexIn;
    wire [6:0] segments;
    segmentDecoder sd(segments, hexIn);
    assign an = ~dispEn;
    assign dp = ~dps[currentState];

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
    
    wire [3:0] num3, num2, num1, num0;
    assign { num3, num2, num1, num0 } = nums;
    
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

module segmentDecoder(
    output [6:0] segments,
    input [3:0] hex
    );
    
    // 7-segment encoding
    //      0
    //     ---
    //  5 |   | 1
    //     --- <--6
    //  4 |   | 2
    //     ---
    //      3
    
    reg [6:0] segments;

    always @(hex)
        case (hex)
            4'b0001 : segments = 7'b1111001;   // 1
            4'b0010 : segments = 7'b0100100;   // 2
            4'b0011 : segments = 7'b0110000;   // 3
            4'b0100 : segments = 7'b0011001;   // 4
            4'b0101 : segments = 7'b0010010;   // 5
            4'b0110 : segments = 7'b0000010;   // 6
            4'b0111 : segments = 7'b1111000;   // 7
            4'b1000 : segments = 7'b0000000;   // 8
            4'b1001 : segments = 7'b0010000;   // 9
            4'b1010 : segments = 7'b0001000;   // A
            4'b1011 : segments = 7'b0000011;   // b
            4'b1100 : segments = 7'b1000110;   // C
            4'b1101 : segments = 7'b0100001;   // d
            4'b1110 : segments = 7'b0000110;   // E
            4'b1111 : segments = 7'b0001110;   // F
            default : segments = 7'b1000000;   // 0
        endcase
    
endmodule
