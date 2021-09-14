`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2021 06:40:25 PM
// Design Name: 
// Module Name: ram
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


module ram(
    output [WIDTH-1:0] q,
    input [WIDTH-1:0] d,
    input [ADDR_BITS-1:0] addr,
    input clock,
    input we,
    input re
    );
    
    parameter WIDTH = 8;
    parameter ADDR_BITS = 8;

    (* ram_style="distributed" *)
    reg [WIDTH-1:0] mem [(2**ADDR_BITS)-1:0];
    
    integer ram_index;
      initial
        for (ram_index = 0; ram_index < (2**ADDR_BITS); ram_index = ram_index + 1)
          mem[ram_index] = {WIDTH{1'b0}};

    wire [WIDTH-1:0] q;

    always @(posedge clock)
        if (we)
            mem[addr] <= d;

    assign q = mem[addr];

endmodule
