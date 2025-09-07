.data 
meu_niver: .word 2003

.text 
main:
    lw $t0, meu_niver      # $t0 = meu_niver
    li $t1, 2025
    add $t2, $t0, $t1      # $t2 = meu_niver + 2025

    # imprime resultado
    li $v0, 1
    move $a0, $t2
    syscall

    # encerra programa
    li $v0, 10
    syscall
