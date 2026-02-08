.global _start
_start:
	MOV R0, #1
	MOV R1, #2
	
	CMP R1, R0
	BGT greater // Branches only if greater than
	// Notice that it skips all other code if the BGT executes
	// Even if this whole block is false, the greater label still executes
	
	CMP R0, R1 // Performs R0 - R1
	// 1. If R0 > R1, CPSR is set to C (2)
	// 2. If R0 == R1, CPSR is set to ZC (6)
	// 3. If R0 < R1, CPSR is set to N (8)
	BGT smaller // If the last operation was A greater than B
	// Move to the label 'smaller'
	CMP R1, R1
	BGT equal
	
	BAL end // Branch always, i.e. always go to the end label
	// We also have BGE, BLT, BLE, BEQ, BNE	
	
greater:
	MOV R12, #1
	BAL end // Branch always, i.e. always go to the end label

smaller:
	MOV R12, #16
	BAL end // Branch always, i.e. always go to the end label

equal:
	MOV R12, #256
	BAL end // Branch always, i.e. always go to the end label
	
end:
	MOV R7, #1
	SWI 0
