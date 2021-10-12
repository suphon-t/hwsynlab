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
    reg [11:0] sw;
    nano_sc_system NANOSCSYSTEM(nums, sw, nreset, clock);
    
    initial
    begin
        clock=0;
        nreset=0;
        #4;
        nreset=1;
        sw = 12'h123;
        
        #96;
        sw = 12'h456;
        
        #100;
        sw = 12'h789;
        
        #100;
        $finish;
    end
    
    always
    begin : CLOCK
        #2
        clock=~clock;
    end
endmodule
