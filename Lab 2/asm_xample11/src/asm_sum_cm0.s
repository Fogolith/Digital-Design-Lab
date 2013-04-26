 	.syntax unified
 	.cpu cortex-m0
 	.align	2
 	.global	asm_sum
 	.thumb
 	.thumb_func
 asm_sum:
 		add 	r0, r0, r1
 		mov 	pc, lr
   		//push	{r7, lr} //Puts both r7 and lr on the stack
  		//sub	sp, sp, #8   // Decrease the stack pointer by 8, allocates 8 bytes on the stack for r7 and lr
  		//add	r7, sp, #0   // store stack pointer in r7
  		//str	r0, [r7, #4] // Store input 1 at SP+4
  		//str	r1, [r7]     // Store input 2 at SP
  		//ldr	r2, [r7, #4] // Load input 1 into R2
  		//ldr	r3, [r7]     // Load input 2 into R3
  		//add	r3, r2, r3   // Addrs input 1 and input 2
  		//mov	r0, r3       // Stores the result in output register RO
  		//mov	sp, r7	     // moves the stack back to R7
  		//add	sp, sp, #8   // Reset the stack pointer
  		//pop	{r7, pc}     //Restores r7 and pc from the stack
