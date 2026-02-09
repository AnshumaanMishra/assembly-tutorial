.global _start
_start:
        MOV R0, #1 // Standard output
        // #1 = stdout
        // #0 = stdout
        // #2 = stderr
        LDR R1, =message // R1 set to the locatin of the message
        LDR R2, =len // R2 set to the locatin of the length

        MOV R7, #4 // Whenever we have an interrupt, the system looks at R7
        // After checking R7 it decides what actually it is supposed to do
        // #4 corresponds to "write something on the screen"
        // Calls the same 'write' call that is used to write to files in C
        SWI 0
        BAL end

end:
        MOV R7, #1 // #1 corresponds to exit
        SWI 0

.data
message:
        .asciz  "hello world \n"// asciz involves null characters as well
        // .string is the same as .asciz
len = .-message // len = length of message
