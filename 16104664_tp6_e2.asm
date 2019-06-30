.data
    n: .word 4
    a: .space 4
    
.text

lui $t0, 0x1001
lw $t1, 0($t0)

ori $t2, $zero, 0 #contador
ori $t3, $zero, 2 #divisor
ori $s0, $zero, 1
addi $t5, $t1, 1

teste: 	beq $t5, $t2, fim
	nop

	div $t2, $t3
	mflo $t4
	
	add $t4, $t4, $t1
	mult $t4, $s0
	mflo $s0
	
	addi $t2, $t2, 1
	
	j teste
	nop

fim: sw $s0, 4($t0)    
