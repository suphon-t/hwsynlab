#include "nanolada/lib.asm"

; r0 = 0
ORI r0, r0, 0x0
ORI r1, r0, 0x1

ORI r10, r0, 0xff00

ORI r20, r0, 0b000
ORI r21, r0, 0b001
ORI r22, r0, 0b010
ORI r23, r0, 0b011
ORI r24, r0, 0b100
ORI r25, r0, 0b101
ORI r26, r0, 0b110
ORI r27, r0, 0b111

loop:
  ; load A into r2
  LW r2, 0xe0(r10)
  ; load B into r3
  LW r3, 0xe4(r10)
  ; load OP into r4
  LW r4, 0xe8(r10)

  BEQ r20, r4, add
  BEQ r21, r4, sub
  BEQ r22, r4, or
  BEQ r23, r4, and
  BEQ r24, r4, xor
  BEQ r25, r4, nota
  BEQ r26, r4, coma
  BEQ r27, r4, comb

invalid:
  ORI r2, r0, 0x0
  ORI r3, r0, 0x0
  ORI r5, r0, 0x0
  JMP display

add:
  ADD r5, r2, r3
  JMP display

sub:
  SUB r5, r2, r3
  JMP display

or:
  OR r5, r2, r3
  JMP display

and:
  AND r5, r2, r3
  JMP display

xor:
  XOR r5, r2, r3
  JMP display

nota:
  NOT r5, r2
  JMP display

coma:
  COM r5, r2
  JMP display

comb:
  COM r5, r3
  JMP display

display:
  ; store A into segment 0
  SW r2, 0xf0(r10)
  ; store B into segment 1
  SW r3, 0xf4(r10)
  ; store S into segment 2 and 3
  SW r5, 0xf8(r10)
  SW r5, 0xfc(r10)
  JMP loop
