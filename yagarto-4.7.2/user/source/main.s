.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

mov r0,#16
mov r1,#1
bl SetGpioFunction ;bl = run the SetGpioFunction function

loop$:

mov r0,#16
mov r1,#0
bl SetGpio

ldr r0,=50000 ;miliseconds to give a more specific timeframe
bl Wait

mov r0,#16
mov r1,#1
bl SetGpio

ldr r0,=50000
bl Wait

b loop$
