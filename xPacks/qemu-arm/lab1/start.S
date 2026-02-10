.syntax unified
.cpu cortex-m4
.thumb

// Global memory locations.
.global vtable
.global __hard_reset  

.type vtable, %object
vtable:
    .word __stack_start   /* Matches the name in lscript.ld  */
    .word __hard_reset + 1 /* The +1 is for Thumb mode */
.size vtable, .-vtable

__hard_reset:
    ldr r0, =__stack_start
    mov sp, r0
    b __hard_reset        /* Infinite loop for now */
