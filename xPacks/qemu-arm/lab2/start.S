.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb
// Global memory locations.
.global vtable
.global hard_reset
/*
* vector table
*/
.type vtable, %object
.type hard_reset, %function
vtable:
.word stack_start
.word __hard_reset+1
.size vtable, .-vtable
hard_reset:
// initialize stack here
// if not initialized yet
bl lab1
_loop: b _loop
.size hard_reset, .-hard_reset
