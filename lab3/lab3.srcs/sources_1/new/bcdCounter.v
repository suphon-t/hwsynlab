`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 10:47:35 AM
// Design Name: 
// Module Name: bcdCounter
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


module bcdCounter(
    output [3:0] num,
    output cout,
    output bout,
    input up,
    input down,
    input set9,
    input set0,
    input clock
    );
    
    reg [3:0] num;
    
    initial num = 0;
    
    assign cout = num == 4'd9 && up;
    assign bout = num == 4'd0 && down;
    
    always @(posedge clock)
    begin
        if (set9) num = 9;
        else if (set0) num = 0;
        else if (up)
        begin
            if (num == 4'd9) num = 0;
            else num = num + 1;
        end
        else if (down)
        begin
            if (num == 4'd0) num = 9;
            else num = num - 1;
        end
    end
endmodule
