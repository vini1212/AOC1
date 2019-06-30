.data
	string:  .asciiz  "Quantos valores deseja inserir num vetor: "
	string1: .asciiz  "ERRO!!"
	string2: .asciiz  "Soma dos Pares: "
	string3: .asciiz  "\nQuantidade dos Pares: "
	string4: .asciiz  "\nSoma dos Impares: "	
	string5: .asciiz  "\nQuantidade dos Impares: "
	string6: .asciiz  "\nSoma Total: "
.text

	lui $t0, 0x1001
	lui $t1, 0x1001
	li $t3, 1
	
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	slti $t4, $t2, 0 ### VERIFICA SE O PROGRAMA PODE INICIAR OU NÂO ###

	beq $t4, $t3, fim1
	nop
	
	beq $t2, $zero, fim2
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal vetor
	nop
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal pares
	nop

	
			
	add $t5, $s4, $s6 #REALIZA A SOMA FINAL DOS PARES COM IMPARES

	##### IMPRIME OS VALORES PARES###
	li $v0, 4
	la $a0, string2
	syscall
	
	move $a0, $s6
	
	li $v0, 1
	syscall
	
	
	##### IMPRIME A QUANTIDADE DE PARES###
	li $v0, 4
	la $a0, string3
	syscall
	
	move $a0, $s7
	
	li $v0, 1
	syscall
	
	##### IMPRIME OS VALORES IMPARES###
	li $v0, 4
	la $a0, string4
	syscall 
	
	move $a0, $s4
	
	li $v0, 1
	syscall
	
	##### IMPRIME A QUANTIDADE DE IMPARES###
	li $v0, 4
	la $a0, string5
	syscall
	
	move $a0, $s5
	
	li $v0, 1
	syscall
	
	##### IMPRIME A SOMA TOTAL #####
	li $v0, 4
	la $a0, string6
	syscall
	
	move $a0, $t5
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
### COLOCA VALORES NO VETOR NA MEMORIA ###	
vetor:	addi $sp, $sp, -4
	sw $ra, ($sp)

	li $s0, 0 #contador
	move $s1, $t2
	
loop:	beq $s0, $s1, volta
	nop
	
	li $v0, 5
	syscall
	
	move $s2, $v0
	
	sw $s2, ($t0)
	
	addi $t0, $t0, 4
	addi $s0, $s0, 1
	
	j loop
	nop

### VOLTA PARA MAIN ###	
volta:	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
	
### FAZ ACESSO PARA VERIFICAR SE É PAR OU IMPAR ###	
pares:	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $s0, 0 #contador
	li $s1, 2 #para saber se é par
	
loop1:	beq $s0, $t2, volta2
	nop
	
	lw $s2, ($t1)
	
	div $s2, $s1
	mfhi $s3
	
	beq $s3, $zero, par
	nop

### SOMA A QUANTIDADE DE IMPARES E A SOMA DOS VALORES ###	
	add $s4, $s2, $s4
	addi $s5, $s5, 1
	addi $t1, $t1, 4
	addi $s0, $s0, 1
	
	j loop1
	nop
	
### SOMA A QUANTIDADE DE PARES E A SOMA DOS VALORES ###	
par:	add $s6, $s6, $s2	
	addi $s7, $s7, 1
	addi $t1, $t1, 4
	addi $s0, $s0, 1
	
	j loop1
	nop 
	

volta2: lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop

### SE COLOCAR ALGUM VALOR NEGATIVO ###
fim1:	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 10
	syscall  

### SE COLOCAR ZERO NO INICIO DO VETOR ###
fim2:	li $v0, 10
	syscall