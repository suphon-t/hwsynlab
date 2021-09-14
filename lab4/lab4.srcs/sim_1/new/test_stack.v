`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 08:44:44 AM
// Design Name: 
// Module Name: test_stack
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


module test_stack(

    );
    
    reg clock, push, pop, reset;
    reg [7:0] data;
    wire [15:0] display;
    wire [7:0] addr, q;
    
    stack stack(display, clock, push, pop, reset, data, addr, q);
    
    always #10 clock = ~clock;
    
    initial
    begin
        clock = 0;
        push = 0;
        pop = 0;
        reset = 0;
        data = 0;
        
        #5
        data = 8'hab;
        
        #20
        push = 1;
        
        #20
        data = 8'hcd;
        
        #20
        push = 0;
        pop = 1;
        
        #60
        $finish;
    end
endmodule
