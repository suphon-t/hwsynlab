`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 04:46:52 PM
// Design Name: 
// Module Name: seven_seg_map
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


module seven_seg_map(
    output [15:0] seg,
    input [31:0] data,
    input [31:0] addr,
    input wr,
    input clock
    );
    
    reg [15:0] seg = 0;
    
    always @(posedge clock)
    begin
        if (wr) 
        begin
            case (addr[15:0])
                16'hfff0: seg[3:0] = data[3:0];
                16'hfff4: seg[7:4] = data[3:0];
                16'hfff8: seg[11:8] = data[3:0];
                16'hfffc: seg[15:12] = data[3:0];
            endcase        
        end
    end
endmodule
