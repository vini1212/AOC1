.data
	string: .asciiz "testando meu professor" 
	
.text

lui $t0, 0x1001
lb $t1,0($t0)

loop: slti $t2, $t1, 97 
      slti $t3, $t1, 123 
      nor $t2,$t2,$0 
      and $t2,$t3,$t2 
      bne $t2,1,space 
      nop
      subiu $t1,$t1,32
      sb $t1,0($t0)
      j else
      nop
      
space: addi $t0, $t0, 1
       lb $t1,0($t0)
       beq $t1,$0,fim 
       nop
       beq $t1,32,space
       nop       
       j loop
       nop
       
else:
	addiu $t0,$t0,1
	lb $t1,0($t0)
	beq $t1,32,space
	nop
	beq $t1,$0,fim 
	nop
	sb $t1,($t0)
	j else
	nop
       
fim: nop
      		