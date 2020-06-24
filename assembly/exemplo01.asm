.text                             # Define o início do Text Segment
.globl main                       # Define o início do código do usuário

main:                             # Label que define o início do código do usuário
add $s0,$zero,$gp                 # Copia o valor de $gp no registrador $s0
lw $t0, 0($s0)                    # Copia a palavra da posição de memória [$s0] p/ $t0
sw $t1, 4($s0)                    # Copia a o valor de $t1 para a posição de memória indicada por [$s0+4]