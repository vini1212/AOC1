.data 
	a: .word 1
	b: .word 2
	c: .word 3
	med: .space 16
	
.text
	lui $t0, 0x1001
	lw $s0, 0($t0)
	lw $s1, 4($t0)
	lw $s2, 8($t0)
	
#desenvolvimento da mediana
	ori $t1, $zero, 3
	add $t2, $s0, $s1
	add $t2, $t2, $s2
	
#fazendo a media
	div $t2, $t1
	mflo $t3 #resultado da divisao
	
#salvando na memoria
	sw $t3, 12($t0)
