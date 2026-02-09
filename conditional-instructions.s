.global _start
_start:
	MOV R0, #1
	MOV R1, #2
	
	CMP R0, R1
	
	// Checks if the previous comparison is Less Than (using the CPSR bit)
	// If yes, its adds source 1 and source 2 into destination
	ADDLT R2, R1, #2
	
	// Works with all combinations of 
	// 'command' + 'condition'
	// Like: MOVGE, SUBEQ etc.
	
	