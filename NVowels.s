# Calculates the Number of vowels in a given string

.data

palavra: .string "A word"

word: .string "aeiou"

mask: .string ""

.text

la a0, palavra


n_vowels:
    la t6, word
    addi t1, zero, 0
    addi t5, zero, 5
cicle: beq t5, x0, end
    lb a1, 0(t6)
    addi t5, t5, -1
    addi t6, t6, 1
    addi sp, sp, -12
    sw ra, 0(sp)
    sw t5, 4(sp)
    sw t6, 8(sp)
    sw t1, 12(sp)
    call carater
    lw ra, 0(sp)
    lw t5, 4(sp)
    lw t6, 8(sp)
    lw t1, 12(sp)
    addi t1, t1, a0
    addi sp, sp, 12
    j cicle

end: mv a0, t1
     ret


char: la t1, mask
	 lb t1, 0(t1)
	 addi t4, zero, 0
	 
cicle1: lb t0, 0(a4)
       addi a0, a0, 1
       beq t0, t1, end1
       beq t0, a1, sum
       j cicle1

sum: addi t4, t4 1
     j ciclo

end1: mv a0, t4
	ret