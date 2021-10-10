`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 04:59:41 PM
// Design Name: 
// Module Name: switch_map
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


module switch_map(
    output [31:0] data,
    input [31:0] addr,
    input [11:0] sw
    );
    
    assign en = addr[31:4] == 28'h0000ffe;
    assign data = (en) ? { 28'b0, data_out }: 32'bz;
    
    reg [3:0] data_out;
    
    always @(addr)
    begin
        case (addr[3:0])
            4'h0: data_out = sw[3:0];
            4'h4: data_out = sw[7:4];
            4'h8: data_out = sw[11:8];
        endcase    
    end
endmodule
