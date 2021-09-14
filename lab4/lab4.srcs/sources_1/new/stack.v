`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2021 07:08:21 PM
// Design Name: 
// Module Name: stack
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


module stack(
    output [15:0] display,
    input clock,
    input push,
    input pop,
    input reset,
    input [7:0] data,
    output [7:0] addr,
    output [7:0] q
    );
    
    reg [7:0] items_count;
    reg [7:0] prev_data;
    reg [7:0] number_shown;
    wire [7:0] q;
    wire [7:0] addr;
    assign addr = items_count - (doPop ? 1 : 0);
    ram #(.WIDTH(8), .ADDR_BITS(8)) ram(q, data, addr, clock, doPush);
    
    initial
    begin
        items_count = 0;
        number_shown = 0;
        prev_data = 0;
    end
    
    assign display = { number_shown, items_count[7:0] };
    
    assign doPush = push && items_count < 9'd255;
    assign doPop = pop && items_count > 9'd0;
    always @(posedge clock)
    begin
        if (reset)
        begin
            items_count = 0;
            number_shown = 0;
        end
        else if (doPush)
        begin
            items_count = items_count + 1;
        end
        else if (doPop)
        begin
            number_shown = q;
            items_count = items_count - 1;
        end
        if (data != prev_data)
        begin
            prev_data = data;
            number_shown = data;
        end
    end
endmodule
