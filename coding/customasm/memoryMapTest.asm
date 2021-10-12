#include "nanolada/lib.asm"

; r0 = 0
XOR r0, r0, r0

; r1 = 0xff00
ORI r1, r0, 0xff00

loop:
  LW r2, 0xe0(r1)
  SW r2, 0xf0(r1)

  LW r2, 0xe4(r1)
  SW r2, 0xf4(r1)

  LW r2, 0xe8(r1)
  SW r2, 0xf8(r1)

  JMP loop
