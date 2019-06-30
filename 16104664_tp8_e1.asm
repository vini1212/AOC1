.data
	litros: .space 4
	
.text

la $t0, litros


loop:
      
      #quantidade de quilometros
      li $v0, 5
      syscall
      or $s0, $v0, $zero
      beq $s0, $zero, fim
      nop
      
      #quantidade de litros
      li $v0, 5
      syscall
      or $s1, $v0, $zero
      
      div $s0, $s1
      mflo $t2  
      
      la $a0, 0($t2)
      li $v0, 1
      syscall
      
      li $v0, 11
      li $a0, 10
      syscall
      
      sw $t2, 0($t0)
      add $t0, $t0, 4
      
      
      
      j loop
      nop
      
fim: nop      