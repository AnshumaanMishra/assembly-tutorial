.global _start
_start:
	LDR R0, =list // Load starting address of list into R0
	LDR R1, [R0] // Move the value at the adress R0 into R1
	LDR R2, [R0, #4] // Move value at R0 + 4, which is the next memory address
	LDR R3, [R0, #4]! // Also changes R0
	LDR R4, [R0], #4 // Changes after using value
	MOV R7, #1 // Set ecit state 1
	SWI 0 // Software interrupt

.data
list:
	.word 1,2,3,4,5,-6
