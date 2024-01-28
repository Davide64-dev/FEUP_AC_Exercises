# Represents the following C Code

# float B = 7.8, M = 3.6, N = 7.1;
# float P = -M * (N+B);


.data

B: .float 7.8
M: .float 3.6
N: .float 7.1

.text

la t0, B
flw ft0, 0(t0)

la t0, M
flw ft1, 0(t0)

la t0, N
flw ft2, 0(t0)

fadd.s ft3, ft2, ft0

fsub.s ft4, ft3, ft1