.data
	string: .asciiz "ONE RING to rule Them aLL"

.text
	la $t0, string
	li $t1, 1
	li $s0, 32
	
loop:	lb $t2, ($t0)
	
	beq $t2, $zero, fim
	nop
	
	beq $t2, $s0, space
	nop
	
	slti $t3, $t2, 96
	
	beq $t3, $t1, mai
	nop
	
	addi $t2, $t2, -32
	
	sb $t2, ($t0)
	
	addi $t0, $t0, 1
	
	j loop
	nop
	
mai:	addi $t2, $t2, 32
	
	sb $t2, ($t0)
	
	addi $t0, $t0, 1
	
	j loop
	nop
	
space:	sb $t2, ($t0)
	addi $t0, $t0, 1	
	
	j loop
	nop
	
fim: 	li $v0, 10
	syscall