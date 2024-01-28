# Copy a vector with values (signed) of type halfword to a vector with values of type word.

.data

vector: .half 1, -1, 3, 4, 5, 6, 7, 8

final: .word 0, 0, 0, 0, 0, 0, 0, 0

.text

la a0, vector
li a1, 8


copy_vector: 
    la t0, final  

cicle: 
	beq a1, zero, end 
	lh  t1, 0(a0)
	sw t1, 0(t0)
	addi t0, t0, 4
	addi a1, a1, -1
	addi a0, a0, 2
	j cicle

end:
	li a0, 0
	ret  
	      
	      
	