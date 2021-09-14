`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2021 09:55:58 PM
// Design Name: 
// Module Name: tester
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


module tester_fullAdder(

    );
    
    reg a, b, cin;
    wire cout, s;
    wire cout2, s2;
    
    fullAdder al(cout, s, a, b, cin);
    fullAdder2 a2(cout2, s2, a, b, cin);
    
    initial
    begin
        $monitor("time %t: {%b, %b} <- {%d %d %d}", $time, cout, s, a, b, cin);
        #0;
        a=0;
        b=0;
        cin=0;
        
        #100;
        a=0;
        b=0;
        cin=1;
        
        #100;
        a=0;
        b=1;
        cin=0;
        
        #100;
        a=0;
        b=1;
        cin=1;
        
        #100;
        a=1;
        b=0;
        cin=0;
        
        #100;
        a=1;
        b=0;
        cin=1;
        
        #100;
        a=1;
        b=1;
        cin=0;
        
        #100;
        a=1;
        b=1;
        cin=1;
        
        #100;
        $finish;
    end
endmodule
