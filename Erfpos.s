# erfpos subroutine that calculates the value of erf(x) using an approximation.
# double erfpos(double x)

.data

a: .double 0.278393, 0.230389, 0.000972, 0.078108
mask: .double 1, 0

.text

la t1, a
fld fa0, 8(t1)


erfmodulus:
	fge.d t0, fa0, zero
	beq t0, zero, .less
	j .greater
.common: sw ra, 0(sp)
	addi sp, sp, 16
	ret

.less: addi sp, sp,-16
	sw ra, 0(sp)
	la t1, mask
	fld ft5, 8(t1)
	fadd.d fa0, ft5, fa0
	call erf
	j .common

.greater: addi sp, sp, -16
 	sw ra, 0(sp)
 	call erf
 	j .common
	
	
erf:	la t0, a

	
	fmul.d ft0, fa0, fa0
	fmul.d ft0, ft0, ft0 # ft0 <- x^4
	fld ft3, 24(t0)
	fmul.d ft0, ft0, ft3
	
	fmul.d ft1, ft1, ft1 
	fmul.d ft1, ft1, ft0 # ft1 <- x^3
	fld ft3, 16(t0)
	fmul.d ft1, ft1, ft3
	
	fmul.d ft2, ft0, ft0 # ft2 <- x^2
	fld ft3, 8(t0)
	fmul.d ft2, ft2, ft3
	
	fld ft3, 0(t0)
	fmul.d ft0, ft0, ft3 # ft3 <- ax
	
	fadd.d ft0, ft0, ft1
	fadd.d ft2, ft2, ft3
	
	fadd.d ft0, ft0, ft2
	la t1, mask	     
	fld ft1, 0(t1)	     
	fadd.d ft0, ft0, ft1
	
	fmul.d ft0, ft0, ft0
	fmul.d ft0, ft0, ft0
	fdiv.d ft0, ft1, ft0
	
	fsub.d ft0, ft1, ft0
	
	fmv.d fa0, ft0
	ret