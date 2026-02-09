.global _start
_start:
	MOV R0, #1
	MOV R1, #2
	
	PUSH {R0, R1} // Push the value of the Registers onto the stack memory
	
	BL get_val
	
	POP {R9, R0, R1} // Retrieve from the stack
	// Does not actually remove the values from the stack, just gets them
	// POP R9 helps us to get the return value of the function to the R9 resistor
	// BUT since the PUSH and POP instructions sort the registers before 
	// POPping it stores the value into R0 rather than R9
	
	PUSH {R0, R1, LR}// Remember to push the LR to stack as well
	BL get_val_rec_1
	POP {R1, R0, LR}
	ADD R4, R1, R0
	
	BAL end

get_val: 
	// Normally, without state preservation, the function would
	// Overwrite the data stored in the R0, R1 and R2 registers, and
	// The outer scope values would be lost
	// This is why we push these values onto the stack memory
	MOV R0, #5
	MOV R1, #6
	ADD R2, R1, R0
	PUSH {R2}
	BX LR
	
get_val_rec_1: 
	MOV R0, #5
	MOV R1, #6
	PUSH {R0, R1, LR} // Remember to push the LR to stack as well
	BL get_val_rec_2 // Trying out recursive to observe the stack
	POP {R0, R1, LR}	
	ADD R3, R1, R0
	BX LR

get_val_rec_2:
	MOV R0, #6
	MOV R1, #8
	ADD R2, R1, R0
	BX LR

end: 
	MOV R7, #1
	SWI 0
	
	
	