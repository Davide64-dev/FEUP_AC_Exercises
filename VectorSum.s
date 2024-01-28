# Vector Sum

.data

vetor1: .word 1, 2, 3
vetor2: .word 3, 4, 5
vetor3: .word 0, 0, 0

.text

la a0, vetor1 # vector 1
la a1, vetor2 # vector 2
li a3, 3      # vector's size

soma: beq a3, zero, fim
      addi a3, a3, -1
      lw t0, 0(a0)
      lw t1, 0(a1)
      add t0, t0, t1
      sw t0, 0(a0)
      addi a0, a0, 4
      addi a1, a1, 4
      j soma

fim: ret