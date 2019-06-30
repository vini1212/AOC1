.data
	string: .asciiz "0. Circunferência\n1. Retângulo\n2. Triângulo\n"
.text

la $a0, string
li $v0, 4
syscall
#valores fixos para calculos
ori $s0, $zero, 3 #valor de pi aproximado
ori $s1, $zero, 1
ori $s2, $zero, 2

li $v0, 5
syscall

move $t0, $v0

beq $t0, $zero, loop0
nop

beq $t0, $s1, loop1
nop

beq $t0, $s2, loop2
nop

loop0: addi $sp, $sp, -4
       sw $ra, ($sp)
       
	jal circunferencia
	nop
	
	move $v0, $t0
	la $a0, ($t0)
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

loop1: addi $sp, $sp, -4
       sw $ra, ($sp)
       
	jal retangulo
	nop
	
	move $v0, $t2
	la $a0, ($t2)
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
loop2: addi $sp, $sp, -4
       sw $ra, ($sp)
       
	jal triangulo
	nop
        
        move $v0, $t2
	
	la $a0, ($t2)
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall	
	
	
circunferencia: addi $sp, $sp, -4
		sw $ra, ($sp)
		
		li $v0, 5 #pergunta ao usuario o valor de R
		syscall
		
		move $t0, $v0		
		
		
		#Calculo da area do circulo
		mult $t0, $t0
		mflo $t0
		
		mult $t0, $s0
		mflo $t0
               
               lw $ra, ($sp)
               addi $sp, $sp, 4
               
               jr $ra
               nop

retangulo: addi $sp, $sp, -4
	   sw $ra, ($sp)
	   
	   li $v0, 5 #pergunta ao usuario o valor de A
	   syscall
	   
	   move $t0, $v0
	   
	   li $v0, 5 #pergunta ao usuario o valor de B
	   syscall
	   
	   move $t1, $v0
	   
	   
	   #Calculo da area do retangulo
	   mult $t0, $t1
	   mflo $t2
	   
	   lw $ra, ($sp)
	   addi $sp, $sp, 4
	   
	   jr $ra
	   nop
	   
triangulo: addi $sp, $sp, -4
	   sw $ra, ($sp)
	   
	   li $v0, 5 #pergunta ao usuario o valor de A
	   syscall
	   
	   move $t0, $v0
	   
	   li $v0, 5 #pergunta ao usuario o valor de B
	   syscall
	   
	   move $t1, $v0
	   
	   #Calculo da Area do triangulo
	   mult $t0, $t1 
	   mflo $t2
	   
	   div $t2, $s2
	   mflo $t2
	   
	   lw $ra, ($sp)
	   addi $sp, $sp, 4
	   
	   jr $ra
	   nop
