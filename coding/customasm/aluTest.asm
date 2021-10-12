#include "nanolada/lib.asm"

#ruledef
{
  DISP {tmpReg: register}, {rs: register} => asm {
    SHR4 {tmpReg}, {rs}
    SW {rs}, 0xf0(r10)
    SW {tmpReg}, 0xf4(r10)
  }
}

; set r0 to 0
XOR r0, r0, r0
; r10 is base for memory-mapped io
ORI r10, r0, 0xff00

; set A = c, B = 6
ORI r1, r0, 0xc
ORI r2, r0, 0x6

; c + 6 = 12
ADD r3, r1, r2
DISP r4, r3

; c - 6 = 6
SUB r3, r1, r2
DISP r4, r3

; c | 6 = e
OR r3, r1, r2
DISP r4, r3

; c & 6 = 4
AND r3, r1, r2
DISP r4, r3

; c ^ 6 = a
XOR r3, r1, r2
DISP r4, r3

; -c = f4
COM r3, r1
DISP r4, r3

; ~c = f3
NOT r3, r1
DISP r4, r3

end:
JMP end
