`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 03:16:01 PM
// Design Name: 
// Module Name: clockScaler
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


module clockScaler(
    output scaledClock,
    input clock
    );
    
    parameter PERIOD = 16;
    localparam HALF = PERIOD / 2;
    localparam BITS = $clog2(HALF);
    
    reg [BITS-1:0] counter = 0;
    reg scaledClock = 0;
    
    always @(posedge clock)
    begin
        if (counter == HALF - 1)
        begin
            scaledClock = ~scaledClock;
            counter = 0;
        end
        else counter = counter + 1;
    end
endmodule
