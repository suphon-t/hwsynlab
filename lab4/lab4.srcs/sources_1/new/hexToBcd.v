`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 11:05:53 AM
// Design Name: 
// Module Name: hexToBcd
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


module hexToBcd(
    output wire [15:0] bcd,
    input [4:0] hex
    );

    (* ram_style="distributed" *)
    reg [15:0] mem[31:0];

    initial $readmemh("hexToBcd.mem", mem);

    assign bcd = mem[hex];

endmodule
