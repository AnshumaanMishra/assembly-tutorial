.global _start
.equ list_end, 0xaaaaaaaa // Define a constant to deal with large numbers
// Not the recommended method since unallocated memory is unpredictable
// Preferred method is an extra 'null character'
_start:
	LDR R0, =list // Set R0 start at the list beginning
	LDR R3, =list_end
	MOV R2, #0 // Set the Sum variable to 0
	
	BAL read // Move to read
	BAL end
	
read:
	LDR R1, [R0], #4 // Fetch the data from the list, then increment R0
	ADDS R2, R1, R2 // Add the data to R2
	
	CMP R1, R3 // Compare with list_end
	BNE read // loop if not equal to list_end
	BAL end // end otherwise

end:
	MOV R7, #1
	SWI 0

.data
list: 
	.word 1, 2, 3, 4, 5, 6, 7