`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 01:43:41 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    output q,
    input d,
    input clock
    );
    
    reg q0, q1;
    assign q = q1;
    
    always @(posedge clock)
    begin
        q0 <= d;
        q1 <= q0;
    end
endmodule
