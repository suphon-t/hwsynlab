`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : alu.v
// Title        : ALU.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module alu(S,z,Cout,A,B,Cin,alu_ops);
output reg [31:0] S;
output z;
output reg Cout;
input [31:0] A;
input [31:0] B;
input Cin;
input [3:0] alu_ops;

assign z=~|S;

always @(A or B or alu_ops)
begin
	case (alu_ops)
	4'b0000: {Cout,S}=A+B+Cin;
	4'b0001: {Cout,S}=A-B;
	4'b0010: begin S=A|B; Cout=0; end
	4'b0011: begin S=A&B; Cout=0; end
	4'b0100: begin S=A^B; Cout=0; end
	4'b0101: begin S=-A; Cout=0; end
	4'b0110: begin S=~A; Cout=0; end
	4'b0111: begin S=~B; Cout=0; end
	4'b1000: S={A[27:0],4'b0};
	4'b1001: S={4'b0,A[31:4]};
	default: {Cout,S}=A+B+Cin;	
	endcase
end

endmodule
