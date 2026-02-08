.global _start
_start:
	MOV R1, #10
	
	LSL R2, R1, #3
	// Can also do MOV R2, R1, LSL #1
	LSR R3, R2, #2
	ROR R4, R3, #1 // Always rotates Right
	
	MOV R7, #1
	SWI 0