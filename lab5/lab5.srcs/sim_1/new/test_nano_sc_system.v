`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 05:17:44 PM
// Design Name: 
// Module Name: test_nano_sc_system
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


module test_nano_sc_system(

    );
    
    reg	clock;
    reg nreset;
    
    wire [15:0] nums;
    nano_sc_system NANOSCSYSTEM(nums, 12'h321, nreset, clock);
    
    initial
    begin
        clock=0;
        nreset=0;
        #40;
        nreset=1;
        #440;
        $finish;
    end
    
    always
    begin : CLOCK
        #20
        clock=~clock;
    end
endmodule
