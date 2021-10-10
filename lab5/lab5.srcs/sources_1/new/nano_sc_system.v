`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : nano_sc_system.v
// Title        : nanoCPU Single Cycle system.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module nano_sc_system(
    output [15:0] nums,
    input [11:0] sw,
    input nreset,
    input clock
    );
wire 	[31:0]	p_address;
wire 	[31:0]	p_data;
wire	[31:0]	d_address;
wire		mem_wr;
wire	[31:0]	d_data;

nanocpu	CPU(p_address,p_data,d_address,d_data,mem_wr,clock,nreset);
rom 	PROGMEM(p_data,p_address[28:2]);

assign mem_en = d_address[31:8] != 24'h000ff;
memory 	DATAMEM(d_data,d_address[28:2],mem_wr,mem_en,clock);
seven_seg_map SEVENSEGMAP(nums, d_data, d_address, mem_wr, clock);
switch_map SWITCHMAP(d_data, d_address, sw);

initial
begin
	$dumpfile("nano_sc_system.dump");
	$dumpvars(4, nano_sc_system);
end

always @(d_address)
$display("%10d - mem_addr %h, mem_en: %b\n",$time,d_address,mem_en);


endmodule
