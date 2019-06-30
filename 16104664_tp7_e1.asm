.data
	string: .asciiz "Eu amo muito meu professor de AOC-I."
	
.text

lui $t0, 0x1001#ponteiro para controle da palavra ler 
lui $t1, 0x1001#ponteiro para controle de espaço na palavra
ori $t2, $zero, 32

loop: lb $s0, 0($t0)#carrega o char
      beq $s0, $zero, fim
      nop
    
      beq $s0, $t2, space
      nop
      
      sb $s0, 0($t1)
      
      addi $t0, $t0, 1
      addi $t1, $t1, 1
      
      j loop
      nop
      
space: addi $t0, $t0, 1
       j loop
       nop
       
fim: sb $s0, 0($t1)
     sb $s0, 1($t1)
     sb $s0, 2($t1)
     sb $s0, 3($t1)
     sb $s0, 4($t1)
     sb $s0, 5($t1)
