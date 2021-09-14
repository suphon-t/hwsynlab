`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2021 09:42:18 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );
    
    reg cout, s;
    always @(a or b or cin)
    begin
        { cout, s } = a + b + cin;
    end
    
endmodule


module fullAdder2(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );
    
    assign { cout, s } = a + b + cin;
    
endmodule
