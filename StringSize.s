.data

word: .string "A string"

word: .string ""


.text


la a0, word
jal string_size


string_size:
    la t1, word
    lb t1, 0(t1)
    addi t0, zero, 0

cicle:
    lb t2, 0(a0)
    beq t2, t1, end
    addi t0, t0, 1
    addi a0, a0, 1
    j cicle

end:
    mv a0, t0
    ret