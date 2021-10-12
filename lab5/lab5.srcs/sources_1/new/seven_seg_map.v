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
    output [15:0] nums,
    input [31:0] data,
    input [31:0] addr,
    input wr,
    input clock
    );
    
    reg [15:0] nums = 0;
    assign en = addr[31:4] == 28'h0000fff;
    
    always @(posedge clock)
    begin
        if (en && wr)
        begin
            case (addr[3:0])
                4'h0: nums[3:0] = data[3:0];
                4'h4: nums[7:4] = data[3:0];
                4'h8: nums[11:8] = data[3:0];
                4'hc: nums[15:12] = data[3:0];
            endcase        
        end
    end
endmodule
