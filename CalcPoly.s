#  calculates p(x) = 1,5 x3 − 12,5 x + 7 for x = {0; 0,1; 0,2; · · · ; 9,9; 10,0}


.data

vetor: .float 0, 0, 0, 0, 0, 0, 0, 0, 0,0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
mask: .float 0.1, 1.5, -12.5, 7

.text

la a0, vetor


calc_poly: li t0, 101	
	   la t0, vetor		# vetor vector's first element address
	   la t1, mask		
	   flw ft0, 0(t0)	# ft0 <- 0
	   flw ft1, 0(t1)	# ft1 <- 0.1
	   flw ft3, 4(t1)	# ft3 <- 1.5
	   flw ft4, 8(t1)	# ft4 <- -12.5
	   flw ft7, 12(t1)	# ft7 <- 7
cicle:     beq t0, x0, fim	# logical condition
	   fmul.s ft2, ft0, ft0 # ft2 <- x^2
	   fmul.s ft2, ft1, ft0 # ft2 <- x^3
	   fmul.s ft2, ft1, ft3 # ft2 <- 1.5*x^3
	   fmul.s ft5, ft0, ft4 # ft5 <- -12.5x
	   fadd.s ft2, ft5, ft2 # ft2 <- 1.5*x^3 -12.5x
	   fadd.s ft2, ft2, ft7 # ft2 <- 1.5*x^3 - 12.5x +7
	   fsw ft2, 0(a0)       # memory store
	   addi a0, a0, 4	# add 4 to memory address
	   addi t0, t0, -1	# counter--
	   fadd.s ft0, ft0, ft1 
	   j cicle              # new iteration
	   
	   
fim: ret
	   