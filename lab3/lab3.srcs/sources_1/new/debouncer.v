`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 02:00:49 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    output q,
    input d,
    input clock
    );
    
    parameter CYCLES = 16;
    localparam BITS = $clog2(CYCLES);
    
    reg [BITS:0] counter;
    reg q;
    
    initial
    begin
        counter = 0;
        q = 0;
    end

    always @(posedge clock)
    begin
        counter = counter + 1;
        if (d == q) counter = 0;
    end
    
    always @(posedge clock)
    if (counter == CYCLES)
        q = d;
endmodule
