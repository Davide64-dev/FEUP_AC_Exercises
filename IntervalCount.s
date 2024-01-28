# Determine the number of values of a given vector that belongs to [a; b]
# Implements the following C function
# int count_interval(float *V, int n, float a, float b)

.data

V: .float 1.5, 1.5, 9, 100, -12.5, -0.00001, 5.4, 3.2
A: .float -0.00000000000001, 5.3

.text

la a0, V        # a0 <- V
li a1, 8	    # a1 <- n
la t0, A	
flw fa2, 0(t0)	# a2 <- a
flw fa3, 4(t0)	# a3 <- b


count_interval:
	addi t0, zero, 0
.cicle: beq a1, zero, .end
	addi a1, a1, -1
	flw ft0, 0(a0)
	addi a0, a0, 4
	fgt.s t1, ft0, fa2,
	beq t1, zero, .cicle
	flt.s t1, ft0, fa3
	beq t1, zero, .cicle
	addi t0, t0, 1
	j .cicle

.end: mv a0, t0
      ret
	
	