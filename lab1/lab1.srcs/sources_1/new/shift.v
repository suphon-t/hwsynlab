`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 08:59:45 PM
// Design Name: 
// Module Name: shiftA
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


module shiftA(
    output [1:0] q,
    input clock,
    input d
    );
    
    reg [1:0] q;
    
    always @(posedge clock)
    begin
        q[0] = d;
        q[1] = q[0];
    end
endmodule

module shiftB(
    output [1:0] q,
    input clock,
    input d
    );
    
    reg [1:0] q;
    
    always @(posedge clock)
    begin
        q[0] <= d;
        q[1] <= q[0];
    end
endmodule

module shift(
    output [N-1:0] q,
    input clock,
    input d
    );
    parameter N = 2;
    
    reg [N-1:0] q;
    
    always @(posedge clock)
    begin
        q[0] <= d;
        q[N-1:1] <= q[N-2:0];
    end
endmodule
