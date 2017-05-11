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
tst r0,#0b1111
movne pc,lr
cmp r1,#15
movhi pc,lr

channel .req r1
value .req r2
mov value,r0
push {lr}
bl GetMailboxBase
mailbox .req r0

wait1$:
status .req r3
ldr status,[mailbox,#0x18]

tst status,#0x80000000
.unreq status
bne wait1$

add value,channel
.unreq channel

str value,[mailbox,#0x20]
.unreq value
.unreq mailbox
pop {pc}



