.data
	string: .asciiz "Quantos números deseja calcular: "
	string1: .asciiz "Soma: "
	string2: .asciiz "Pares: "
.text

	lui $t0, 0x1001
	lui $t1, 0x1001
	
main:	li $v0, 4
	la $a0, string
	syscall

	li $v0, 5
	syscall
	
	move $t2, $v0	
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal vetor
	nop
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal soma
	nop
	
fim:	li $v0, 4
	la $a0, string1
	syscall
	
	move $a0, $s5

	li $v0, 1
	syscall
	
	li $v0, 11
	li $a0, 10
	syscall	
	
	li $v0, 4
	la $a0, string2
	syscall
	
	move $a0, $s2
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
soma:	li $s0, 0 #contador do vetor
	li $s1, 2 #descobre se é par
	li $s2, 0 #contador de quantos pares tem
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
loop:	beq $s0, $t2, sai
	nop
	
	lw $s3, 0($t1)
	
	div $s3, $s1
	mfhi $s4
	
	beq $s4, $zero, par
	nop
	
	addi $t1, $t1, 4
	addi $s1, $s1, 1
	
	j loop	
	nop
	
par:	add $s5, $s5, $s3
	addi $s2, $s2, 1
	addi $s0, $s0, 1
	addi $t1, $t1, 4
	
	j loop
	nop
		
sai:	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
			

vetor:	li $s0,0

	addi $sp, $sp, -4
	sw $ra, ($sp)
	
insere:	beq $s0, $t2, volta
	nop
	
	li $v0, 5
	syscall
	
	move $s1, $v0
	
	sw $s1, ($t0)
	addi $s0, $s0, 1
	addi $t0, $t0, 4
	
	j insere
	nop
	
volta:	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop