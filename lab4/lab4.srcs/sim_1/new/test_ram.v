`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2021 06:52:32 PM
// Design Name: 
// Module Name: test_ram
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


module test_ram(

    );
    
    reg clock, we;
    reg [7:0] d;
    reg [7:0] addr;
    wire [7:0] q;
    
    ram ram(q, d, addr, clock, we);
    
    always #10 clock = ~clock;
    
    initial
    begin
        clock = 0;
        we = 1;
        
        #5
        addr = 8'h0;
        d = 8'hc;
        
        #20
        addr = 8'h1;
        d = 8'hb;
        
        #20
        addr = 8'h2;
        d = 8'ha;
        
        #20
        we = 0;
        addr = 8'h0;
        
        #20
        addr = 8'h1;
        
        #20
        addr = 8'h2;
        
        #20
        $finish;
        
    end
endmodule
