#include "registers.asm"

#subruledef pcaddr
{
  {addr: u28} =>
  {
    pcaddr = addr >> 2
    pcaddr`26
  }
}

#subruledef relpcaddr
{
  {addr: u32} =>
  {
    reladdr = addr - $ - 4
    relpcaddr = reladdr >> 2
    relpcaddr`16
  }
}

#ruledef
{
  ORI   {rt: register}, {rs: register}, {imm} => 0b010000 @ rs @ rt @ imm`16
  ORUI  {rt: register}, {rs: register}, {imm} => 0b010001 @ rs @ rt @ imm`16
  LW    {rt: register}, {imm}({rs: register}) => 0b011000 @ rs @ rt @ imm`16
  SW    {rt: register}, {imm}({rs: register}) => 0b011100 @ rs @ rt @ imm`16
  BEQ   {rs: register}, {rt: register}, {imm: relpcaddr} => 0b100100 @ rs @ rt @ imm`16

  JMP   {addr: pcaddr} => 0b110000 @ addr`26

  ADD   {rd: register}, {rs: register}, {rt: register} => 0b000001 @ rs @ rt @ rd @ 0b000`11
  SUB   {rd: register}, {rs: register}, {rt: register} => 0b000001 @ rs @ rt @ rd @ 0b001`11
  OR    {rd: register}, {rs: register}, {rt: register} => 0b000001 @ rs @ rt @ rd @ 0b010`11
  AND   {rd: register}, {rs: register}, {rt: register} => 0b000001 @ rs @ rt @ rd @ 0b011`11
  XOR   {rd: register}, {rs: register}, {rt: register} => 0b000001 @ rs @ rt @ rd @ 0b100`11
  COM   {rd: register}, {rs: register} => 0b000001 @ rs @ 0`5 @ rd @ 0b101`11
  NOT   {rd: register}, {rs: register} => 0b000001 @ rs @ 0`5 @ rd @ 0b110`11
}
