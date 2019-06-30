.data
	n: .word 5
	x: .space 4
	
.text
	lui $t0, 0x1001
	lw $s0, 0($t0) #n do fatorial
	ori $t1, $zero, 1 #contador
	add $s1, $s0, $zero
	
teste:  beq $s0, $t1, fim
        nop

	mult $s1, $t1
  	mflo $s1
        
	addi $t1, $t1, 1

        j teste
        nop
        
fim: sw $s1, 4($t0)        		
  	
   	
	
