.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

mov r0,#16
mov r1,#1
bl SetGpioFunction /* bl = run the SetGpioFunction function */

ptrn .req r4
ldr ptrn,=pattern
ldr ptrn,[ptrn]
seq .req r5
mov seq,#0

mov r1,#1
lsl r1,seq
and r1,ptrn

loop$:

mov r0,#16
mov r1,#1
lsl r1, seq
and r1,ptrn
bl SetGpio

ldr r0,=250000 /* miliseconds to give a more specific timeframe */
bl Wait

add seq,#1
and seq,#0b11111

b loop$

.section .data
.align 2
pattern:
/* .int 0b11111111101010100000010000001000000101010  */
/* .int 0b111111111 0000101010 1111 01010000 1111 01000010 1111 01000010 1111 0101 0000 1111 00001000010000 --> spells "burrito" */
/* .int 0b1111111110000101010111101010000111101000010111101000010111101010000111100001000010000 --> burrito with long lights */
.int 0b1111111111111100010101011110101000111101000101111010001011110101000111100010001000
