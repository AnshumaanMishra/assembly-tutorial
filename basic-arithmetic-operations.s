.global _start
_start:
	MOV R1, #1
	MOV R2, #-2

	// Destination, source 1, source 2
	ADD R3, R2, R1 // Addition
	SUB R4, R2, R1 // Subtraction
	MUL R5, R2, R1 // Multiplication

	// Sign Shenanigans
	MOV R6, #0xFFFFFFFF
	MOV R8, #1 // Skipping R7 for system calls
	SUB R9, R6, R8 // Does follow twos complement

	// But how are unsigned ints denoted?
	// Ans: We use the CPSR resistor using the ADDS, SUBS, MULS opcodes
	MOV R10, #5
	MOV R11, #10

	// N beside CPSR becomes bold when we get a negative number
	// C becomes bold when we get a positive number
	// MSB of CPSR represents which are active out of N, Z, C, V
	// Rest 7 bits are for the I
	// MSB = 8 represents 1000 = N = negative
	// MSB = 8 represents 0100 = Z = Zero
	// MSB = 2 represents 0010 = C = Carry
	// MSB = 8 represents 0001 = V = Overflow
	SUBS R12, R10, R11 // CPSR MSB becomes 8, N is highlighted
	SUBS R9, R11, R10 // CPSR MSB becomes 2
	ADDS R5, R6, R8 // CPSR MSB becomes 6, since result is Zero
					// and Carry is active = 0110
	ADDS R5, R6, #3 // CPSR MSB becomes 2, since result is non Zero
					// but Carry is active
	ADC R4, R6, R8 // Adds the carry of the add operation to R4

	MOV R7, #1
	SWI 0
