`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 08:25:46 PM
// Design Name: 
// Module Name: dFlipFlop
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


module dFlipFlop(
    output q,
    input clock,
    input nreset,
    input d
    );
    
    reg q;
    
    always @(posedge clock)
    begin
        if (nreset == 1)
            q = d;
    end
    
    always @(negedge nreset)
    begin
        q = 0;
    end
    
endmodule
