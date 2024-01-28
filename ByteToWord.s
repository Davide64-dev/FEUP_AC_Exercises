# transforms a byte vector into a word vector


.data

vetor: .byte 1, 2, 3, 4, 5, 6, 7, 8

final: .word 0, 0, 0, 0, 0, 0, 0, 0

.text

la a0, vetor
li a1, 8


copy_vetor: 
    la t0, final
cicle:
	beq a1, zero, end
	lbu  t1, 0(a0)
	sw t1, 0(t0)
	addi t0, t0, 4
	addi a1, a1, -1
	addi a0, a0, 1
	j cicle
end:
	li a0, 0
	ret  
	      
	      
	