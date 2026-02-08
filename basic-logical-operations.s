.global _start
_start:
	MOV R1, #1
	MOV R2, #0
	MOV R3, #0xFFFFFFFF // To store this value it uses the 'MVN' operation 
	MOV R4, #0x1011 // For some reason only 4 digits allowed?
	
	// Essentially, if all meaningful bits can fit in an 8-bit window
	// only then can ARM store it So for large numbers it tries Not and
	// then the window check, if this can work it changes 'MOV' to 'MOVN'
	
	// 16 bit values are allowed as the 'MOV' is
	// automatically changed to the 'MOVW' operation
	
	MOV R5, #0x1011
	MOV R5, #16
	
	// Destination, source 1, source 2
	AND R6, R2, R1
	ANDS R8, R5, R4 // Also sets the flags
	ANDS R9, R3, R4
	ANDS R12, R4, R4
	ORR R10, R2, R1 // OR
	EOR R11, R5, R4 // XOR
	MVN R12, R11 // NOT
	AND R1, R1, 0x000000FF // Clearing 6 MSBs to remove the extra 'F'
						   // at the beginning
	
	MOV R7, #1
	SWI 0