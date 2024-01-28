# Routine that calculates this:
# ((A-B)xC)/(D+A-3)



.data

A: .float 0.1
B: .float 2
C: .float 3.2123
D: .float 54

.text

la a0, A
la a1, B
la a2, C
la a3, D

EXPRESSION:
	flw ft0, 0(a0)
	flw ft1, 0(a1)
	flw ft2, 0(a2)
	flw ft3, 0(a3)
	fsub.s ft4, ft0, ft1
	fmul.s ft4, ft4, ft2
	fadd.s ft0, ft0, ft3
	li t0, -3
	fcvt.s.w ft5, t0
	fadd.s ft5, ft0, ft5
	fsub.s fa0, ft4, ft5
	ret