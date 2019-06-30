.data
	x: .space 32
  
.text

	lui $t0, 0x1001
	ori $s1, $zero, 2 #par
	ori $s2, $zero, 0 #contador
	lw $t1, 0($t0) #inicial

teste: 	sll $s3, $s2, 2  
	add $t0, $t0, $s3 
	div $s2, $s1
	mfhi $t2 
	beq $t2, $zero, par
	nop

impar: 	lw $t3, 0($t0)
	lw $t4, -4($t0)
	add $t5, $t3, $t4
	sw $t5, 0($t0)

return: slti $t6, $s2, 8
	beq $t6, $zero, fim
	nop

	addi $s2, $s2, 1
	j teste
	nop    

par:
	sll $t3, $s2, 1
	sw $t3, 0($t0)
	j return
	nop
fim: nop
  
   