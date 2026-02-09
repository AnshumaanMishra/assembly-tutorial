.equ SWITCH, 0xff200040 // Constant since a value this large 
						// cannot be moved directly into a register
.equ LED, 0xff200000

.global _start
_start:
	LDR R0, =SWITCH 
	
	LDR R1, [R0] // Whatever binary number is formed by the switches is 
				 // saved into R1
	// This can be used as input
	
	LDR R2, =LED // Assign R2 to the address of LED
	STR R1, [R2] // STORE the value at R1 at the location of [R2]
	// This can be used as output
	
	BAL end

end: 
	MOV R7, #1
	SWI 0
	
	
	