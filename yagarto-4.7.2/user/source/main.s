.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

.globl GetMailBoxBase
GetMailBoxBase:
ldr r0,=0x2000B880
mov pc,lr

