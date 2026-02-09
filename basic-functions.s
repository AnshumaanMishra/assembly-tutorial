.global _start
_start:
	MOV R0, #1
	MOV R1, #2
	
	BL add2 // BL = Branch Late 
	// This stores the location that follows the branch in the 'LR' register
	BAL end

add2: 
	// This is the basic idea of a function, but the desirable method of execution
	// For a function is that it should return to the '_start' function,
	// exactly at the point it left when the function was called. 
	// For this we set a RETURN ADDRESS
	ADD R2, R1, R0
	BX LR // Returns back to the address stored in the LR register

end: 
	MOV R7, #1
	SWI 0
	
	
	