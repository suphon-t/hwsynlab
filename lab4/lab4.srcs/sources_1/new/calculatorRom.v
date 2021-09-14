`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 05:17:51 PM
// Design Name: 
// Module Name: calculatorRom
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


module calculatorRom(
    output wire [15:0] bcdAlt,
    output wire [3:0] dps,
    input [9:0] opAB
    );
    
    (* ram_style="distributed" *)
    reg [19:0] mem[1023:0];

    initial $readmemh("calculator.mem", mem);
    
    assign { dps, bcdAlt } = mem[opAB];
endmodule
