# Calculates the distance between two points

.data

P: .float 1, 0
Q: .float 0, 1

.text

la a0, P
la a1, Q

call DISTANCE

DISTANCE: flw ft0, 0(a0) #x1
	   flw ft1, 4(a0) #y1
	   flw ft2, 0(a1) #x2
	   flw ft3, 4(a1) #y2
	   fsub.s ft0, ft0, ft2
	   fsub.s ft1, ft1, ft3
	   fmul.s ft0, ft0, ft0
	   fmul.s ft1, ft1, ft1
	   fadd.s ft0, ft0, ft1
	   fsqrt.s ft0, ft0
	   fmv.s fa0, ft0
	   ret