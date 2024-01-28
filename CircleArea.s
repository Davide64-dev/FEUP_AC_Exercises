# Calculates the are of a circle

.data

pi: .float 3.14159
r: .float 2.2

.text 

la t0, r
flw ft5, 0(t0)

call CIRCLE

CIRCLE: la t0, pi
	 flw ft0, 0(t0)
	 fmul.s ft1, ft5, ft5
	 fmul.s ft1, ft1, ft0
	 ret