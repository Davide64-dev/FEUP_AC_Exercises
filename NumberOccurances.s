.data

string: .string "A string"

word: .string "m"

mask: .string ""

.text

la a0, string
la a1, word
lb a1, 0(a1)

char: 
    la t1, mask
    lb t1, 0(t1)
    addi t4, zero, 0

cicle: 
    lb t0, 0(a0)
    addi a0, a0, 1
    beq t0, t1, finish
    beq t0, a1, sum
    j cicle

sum: 
    addi t4, t4, 1
    j cicle
    
finish: 
    mv a0, t4
    ret