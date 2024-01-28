# Product of a vector by a scalar

.data

vetor: .word 1, 2, 3

.text

la a0, vetor 
li a1, 3 
li a2, 4 

escalar: 

   ciclo: beq a1, zero, fim
	  addi a1, a1, -1
	  lw t0, 0(a0)
	  mul t0, t0, a2
	  sw t0, 0(a0)
	  addi a0, a0, 4
	  j ciclo
     fim: li a0, 0
      	  ret