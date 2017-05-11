.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

.globl GetMailboxBase
GetMailboxBase:
ldr r0,=0x2000B880
mov pc,lr

.globl MailboxWrite
MailboxWrite:
tst