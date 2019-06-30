.data
	space: .word 

.text
	la $s0, 0xffff0004
	la $t0, space
	li $a3, 0
#Borda superior
	li $t1, 0xFDF5E6 #Branco (OldLace)
#Borda inferior
	li $t2, 0xFFFFF0 #Branco (Ivory)
#Laterais
	li $t3, 0x000000 #Preto (Black)
#PaletaCima
	li $t4, 0xFAF0E6 #Branco (Linen)
#Meio
	li $t5, 0xFF00FF #Branco (Cornsilk)
#Bola
	li $t6, 0xFFFAF0 #Branco (FloralWhite)
#MeioPaletas
	li $t7, 0xFFF0F5 #Branco (LavenderBlush)
#Contador de Pixels	
	li $t8, 64
	
#PaletaBaixo
	li $t9, 0xFFFAFA #Branco (Snow)
	li, $s1, 119 #w
	li, $s2, 115 #s
	li, $k0, 50 #2
	li, $k1, 56 #8

PaletteR:
	la $t0, space
	addi $t0, $t0, 3064
	li $t8, 8
	
		jal print_palette
		nop

		jal print_palette_middle
		nop
		
	Down1:
		beq $t8, 0, PaletteL
		nop
		
		jal print_palette_down
		nop
		
		j Down1
		nop

	
PaletteL:
	la $t0, space
	addi $t0, $t0, 2308
	li $t8, 8
  	
  	Main:
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down:
		beq $t8, 0, Keyboard
		nop
		
		jal print_palette_down
		nop
				
		j Down
		nop


Keyboard:
Play1:
	la $s6, space
	addi $s6, $s6, 2308
	
	inicio:
	addi $t0, $s6, 0
	lw $s5, ($s0)
	
	jal Delay
	nop

	beq $s5, $s1, UP
	nop
		beq $s5, $s2, DOWN
		nop
			bne $a3, $zero, second
			nop
				j Play2
				nop
			second:
				j inicio1
				nop
	
	UP:	
		li $t8, 8
		addi $s6, $s6, -256
		lw $s7, ($s6)
		
		jal print_palette1
		nop
		
		jal print_palette_middle1
		nop
		
	Down2:
		beq $t8, 0, pintar
		nop
		
		jal print_palette_down1
		nop
				
		j Down2
		nop
	
	pintar:
		addi $t0, $s6, 0
		sw $zero, ($s0)
		li $t8, 8
	
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down3:
		beq $t8, 0, inicio
		nop
		
		jal print_palette_down
		nop
				
		j Down3
		nop
		
	DOWN:	
		li $t8, 8
		addi $s6, $s6, 256
		lw $s7, ($s6)
		
		beq $s7, $t1, inicio
		nop
			beq $s7, $t2, inicio
			nop
		jal print_palette1
		nop
		
		jal print_palette_middle1
		nop
		
	Down7:
		beq $t8, 0, pintar2
		nop
		
		jal print_palette_down1
		nop
				
		j Down7
		nop
	
	pintar2:
		addi $t0, $s6, 0
		sw $zero, ($s0)
		li $t8, 8

		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down4:
		beq $t8, 0, inicio
		nop
		
		jal print_palette_down
		nop
				
		j Down4
		nop

Play2:
	la $a3, space
	addi $a3, $a3, 3064
	
	inicio1:
	lw $s5, ($s0)
	addi $t0, $a3, 0
	
	jal Delay
	nop
	
	beq $s5, $k1, UP1
	nop
		beq $s5, $k0, DOWN1
		nop
			j inicio
			nop
	
	UP1:	
		li $t8, 8
		addi $a3, $a3, -256
		lw $a1, ($a3)
		
		beq $a1, $t1, inicio1
		nop
			beq $a1, $t2, inicio1
			nop
		
		jal print_palette1
		nop
		
		jal print_palette_middle1
		nop
		
	Down5:
		beq $t8, 0, pintar1
		nop
		
		jal print_palette_down1
		nop
				
		j Down5
		nop
	
	pintar1:
		addi $t0, $a3, 0
		sw $zero, ($s0)
		li $t8, 8
	
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down6:
		beq $t8, 0, inicio1
		nop
		
		jal print_palette_down
		nop
				
		j Down6
		nop
		
	DOWN1:	
		li $t8, 8
		addi $a3, $a3, 256
		lw $a1, ($a3)
		
		beq $a1, $t1, inicio1
		nop
			beq $a1, $t2, inicio1
			nop
		jal print_palette1
		nop
		
		jal print_palette_middle1
		nop
		
	Down8:
		beq $t8, 0, pintar3
		nop
		
		jal print_palette_down1
		nop
				
		j Down8
		nop
	
	pintar3:
		addi $t0, $a3, 0
		sw $zero, ($s0)
		li $t8, 8

		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down9:
		beq $t8, 0, inicio1
		nop
		
		jal print_palette_down
		nop
				
		j Down9
		nop
	
		
#Subrotina para printar o jogo a parte superior
print_superior:
	beq $t8, $zero, Return1
	nop
	
	sw $t1, ($t0)
	add $t0, $t0, 4
	addi $t8, $t8, -1
        
        j print_superior
        nop
Return1:
        jr $ra
        nop
		
#Subrotina para printar o jogo a parte inferior
print_bottom: 	
	beq $t8, $zero, Return2
	nop
		
	sw $t2, ($t0)
	add $t0, $t0, 4
	addi $t8, $t8, -1
	
	j print_bottom
	nop
Return2:	
	jr $ra
	nop

#Subrotina para printar a parte lateral
print_side:
	beq $t8, $zero, Return3
	nop
	
	sw $t3, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_side
	nop
	
Return3:
	jr $ra
	nop

#Subrotina para printa as paletas
print_palette:
	beq $t8, 5, Return4
	nop
		
	sw $t4, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette
	nop
	
Return4:
	jr $ra
	nop

print_palette_middle:
	beq $t8, 3, Return5
	nop
	
	sw $t7, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette_middle
	nop
	
Return5:
	jr $ra
	nop	
	
print_palette_down:
	sw $t9, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	jr $ra
	nop
	
#Subrotina para printa as paletas
print_palette1:
	beq $t8, 5, Return41
	nop
		
	sw $zero, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette1
	nop
	
Return41:
	jr $ra
	nop

print_palette_middle1:
	beq $t8, 3, Return51
	nop
	
	sw $zero, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette_middle1
	nop
	
Return51:
	jr $ra
	nop	
	
print_palette_down1:
	sw $zero, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	jr $ra
	nop

Delay:
     li $t8, 3 #Verificar velocidade na apresentação
          Continua10:
		beq $t8, $zero, Return23
			nop
			addi $t8, $t8, -1
		
			j Continua10
			nop
	  Return23:
	  	jr $ra
	  	nop

Exit:
	nop
