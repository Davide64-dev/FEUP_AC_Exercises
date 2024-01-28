# Represents the following C Code

# int W = 7;
# double X = 7.1;
# double Y = sqrt(X) + W;


.data 

W: .word 7          # t0
X: .double 7.1      # ft0

.text
lw t0, W

la t1, X
fld ft0, 0(t1)

fsqrt.d ft0, ft0

fcvt.d.w ft1, t0


fadd.d ft0, ft0, ft1
