.data
array:  .word 4, 3, 9, 5, 2, 1   # array a ser ordenado
n:      .word 6                  # tamanho do array
space:  .asciiz " "              # espaço para o print

.text
main:
    lw $t0, n
    addi $t0, $t0, -1        # $t0 = n-1 (loop externo do bubble sort)

loop_externo:
    blez $t0, fim            # se $t0 <= 0, pula pro fim
    la $t1, array            # $t1 = endereço base do array
    lw $t2, n
    addi $t2, $t2, -1        #  n-1 (limite do loop interno)
    li $t3, 0                # índice i = 0

loop_interno:
    beq $t3, $t2, fimI       # se i == n-1, fim do loop interno

    lw $t4, 0($t1)           # $t4 = array[i]
    lw $t5, 4($t1)           # $t5 = array[i+1]

    ble $t4, $t5, noswap     # se array[i] <= array[i+1], não troca

    # troca
    sw $t5, 0($t1)           # array[i] = $t5
    sw $t4, 4($t1)           # array[i+1] = $t4

noswap:
    addi $t1, $t1, 4         # avança para próximo elemento
    addi $t3, $t3, 1         # i++
    j loop_interno

fimI:
    addi $t0, $t0, -1        # decrementa contador do loop externo
    j loop_externo

fim:
    la $t1, array            # imprime array ordenado
    lw $t2, n
    li $t3, 0

print_loop:
    beq $t3, $t2, print_fim

    lw $a0, 0($t1)           # imprime número
    li $v0, 1
    syscall

    li $v0, 4                # imprime espaço
    la $a0, space
    syscall

    addi $t1, $t1, 4         # próximo elemento
    addi $t3, $t3, 1
    j print_loop

print_fim:
    li $v0, 10
    syscall
