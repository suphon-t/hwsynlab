`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 09:15:00 AM
// Design Name: 
// Module Name: inputFilter
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


module inputFilter(
    output [WIDTH-1:0] q,
    input [WIDTH-1:0] d,
    input clock,
    input slowClock
    );
    
    parameter WIDTH=1;
    parameter DEBOUNCE_CYCLES=4;
    parameter SINGLE_PULSE=1;
    
    genvar c;
    generate
        for (c = 0; c < WIDTH; c = c + 1)
        begin
            wire synchronized, debounced;
            synchronizer sync(synchronized, d[c], clock);
            debouncer #(.CYCLES(DEBOUNCE_CYCLES)) deb(debounced, synchronized, slowClock);
            if (SINGLE_PULSE == 1)
                singlePulser sp(q[c], debounced, clock);
            else
                assign q[c] = debounced;
        end
    endgenerate
endmodule

module synchronizer(
    output q,
    input d,
    input clock
    );
    
    reg q0, q1;
    assign q = q1;
    
    always @(posedge clock)
    begin
        q0 <= d;
        q1 <= q0;
    end
endmodule

module debouncer(
    output q,
    input d,
    input clock
    );
    
    parameter CYCLES = 16;
    localparam BITS = $clog2(CYCLES);
    
    reg [BITS:0] counter;
    reg q;
    
    initial
    begin
        counter = 0;
        q = 0;
    end

    always @(posedge clock)
    begin
        counter = counter + 1;
        if (d == q) counter = 0;
    end
    
    always @(posedge clock)
    if (counter == CYCLES)
        q = d;
endmodule

module singlePulser(
    output q,
    input d,
    input clock
    );
    
    reg curr, prev;
    initial
    begin
        curr = 0;
        prev = 0;
    end
    
    assign q = curr & ~prev;
    
    always @(posedge clock)
    begin
        prev = curr;
        curr = d;
    end
endmodule
