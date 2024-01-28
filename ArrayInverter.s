.data

vector: word 1, 2, 3, 4, 5


.text


la a0, vector 
li a1, 5

Inverter:
    addi t0, zero, 2
    div t1, al, tO
    addi t2, zero, o

cicle: 
    beq t1, zero, end
    mv t3, a0
    sub t4, a1, t2
    slli t4, t4, 2
    add t4, t3, t2
    addi t4, t4, -4
    lw t5, 0(t3)
    lw t6, 0(t4)
    sw t5, 0(t4)
    sw t6, 0(t3)
    addi t2, t2, 1
    addi t1, t1, -1
    addi a1, a1, -1
    addi a0, a0, 4
    j cicle

end: ret