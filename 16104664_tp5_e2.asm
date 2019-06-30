.data
y: .space 4

.text

lui $t0, 0x1001

ori $t1, $zero, 0 #contador
ori $t2, $zero, 0 #soma


teste: slti $t3, $t1, 334
beq $t3, $zero, fim #sai do loop
sll $zero, $zero, 0

addu $t2, $t2, $t1

addiu $t1, $t1, 1

j teste
sll $t0, $t0, 0

fim: sw $t2, 0($t0)    