.data 
	str1: .asciiz "Entre com o valor de fibonacci: "
	str2: .asciiz " "

.text

	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	move $s0, $v0
	move $s1, $s0
	
	li $t0, 1
	li $t1, 1
	li $s3, 4 #faz o teste se acabou o fibonacci printou todos os numero pois o v0 vai ficar em 4 por conta do espaço
	
	jal fibonacci
	nop
	
	beq $v0, $s3, final
	nop
	
fibonacci:	addi $sp, $sp, -4
		sw $ra, ($sp)
		
		beq $s1, $t0, print
		nop
		
		subi $s1, $s1, 1
		
		jal fibonacci
		nop
		
print:	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	move $t0, $s2
	add $t2, $s2, $t1
	move $t1, $t0
	move $t0, $t2
	move $s2, $t0
	
	la $a0, ($s2)
	li $v0, 1
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	jr $ra
	nop  
		
final:	li $v0, 10
	syscall		
