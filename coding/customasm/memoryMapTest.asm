#include "nanolada/lib.asm"

main:
  ; r0 = 0
  ORI r0, r0, 0x0

  ; r1 = 0xff00
  ORI r1, r1, 0xff00

  LW r2, 0xe0(r1)
  SW r2, 0xf0(r1)

  LW r2, 0xe4(r1)
  SW r2, 0xf4(r1)

  LW r2, 0xe8(r1)
  SW r2, 0xf8(r1)

  ORI r2, r0, 0x4
  SW r2, 0xfc(r1)

  JMP main
