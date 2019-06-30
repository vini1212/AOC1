######################################################################
# 			     PONG                                    #
######################################################################
#           	Mateus Brugnaroto & Vinicius Renato           	     #
######################################################################						                                                                       							    
#       Bitmap Display Settings:                                     #
#	Unit Width: 8						     #
#	Unit Height: 8						     #
#	Display Width: 512					     #
#	Display Height: 256					     #
#	Base Address for Display: 0x10001000 (static data)	     #
######################################################################

.data
	space: .word 
	string: .asciiz "---MENU PONG---\n0.Jogar\n1.Como Jogar\n2.Sair\n"
	string1: .asciiz "\nInformações e Obejtivo:\n O jogo consiste em duas raquetes das quais ficam uma em cada lado do campo.\n Funciona como um jogo de ping-pong onde os jogadores precisam rebater a bolinha para o adversï¿½rio tentando, assim, marcar o ponto.\n Vence quem fizer o primeiro ponto!!\n\nControles:\n Player 1: W (para cima) e S (para baixo) (Esquerda)\n Player 2: 8 (para cima) e 2 (para baixo) (Direita)\n\nDeseja jogar (0) ou sair (2):"
	cores: .word 0xFDF5E6 0xFFFFF0 0x696969 0xFAF0E6 0xFFF8DC 0xFFFAF0 0xFFF0F5 0xFFFAFA
	
.text
	la $s0, 0xffff0004
	la $t0, space
	li $s6, 0
	li $t8, 64 #Contador de Pixels
	li $s3, 50
	li $s4, 49
	li $s7, 48

#Keyboard
	li, $s1, 119 #w
	li, $s2, 115 #s
	li, $k0, 50 #2
	li, $k1, 56 #8
	
	li $v0, 4
	la $a0, string
	syscall
	
menu:	
	la $s0, 0xffff0004
	lw $s5, ($s0)

	beq $s5, $s7, Top
	nop
	
	beq $s5, $s3, Exit
	nop
	
	beq $s5, $s4, Detail
	nop
	
	j menu
	nop
	
	Detail: 
	li $v0, 4
	la $a0, string1
	syscall
	
menu1:
	la $s0,0xffff0004	
	lw $s5, ($s0)
	
	beq $s5, $s7, Top
	nop
	
	beq $s5, $s3, Exit
	nop
	
	j menu1
	nop
	
#Pixels da Borda Superiores
Top:
	li $s4, 0
	jal print_superior	
	nop
	
#Pixels da Borda Inferior
Bottom:	
	li $t8, 64
	la $t0, space
	addi $t0, $t0, 7936
	
	jal print_bottom
	nop	
		
#Pixels da Lateral Esquerda
SideL:
	la $t0, space
	addi $t0, $t0, 256
	li $t8, 30

	jal print_side
	nop

#Pixels da Lateral Direita
SideR:
	la $t0, space
	addi $t0, $t0, 508
	li $t8, 30

	jal print_side
	nop
	
#Pixels da Paleta Esquerda
PaletteL:
	la $t0, space
	addi $t0, $t0, 2820
	li $t8, 8
  
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down:
		beq $t8, 0, PaletteR
		nop
		
		jal print_palette_down
		nop
				
		j Down
		nop

#Pixels da Paleta Direita
PaletteR:
	la $t0, space
	addi $t0, $t0, 3064
	li $t8, 8
	
		jal print_palette
		nop

		jal print_palette_middle
		nop
		
	Down1:
		beq $t8, 0, Middle
		nop
		
		jal print_palette_down
		nop
		
		j Down1
		nop

#Pixels do Meio
Middle:
	la $t0, space
	addi $t0, $t0, 384
	li $s7, 9
    
    Condition:
	li $t8, 2
	addi $s7, $s7, -1
    	
    	beq $s7, $zero, Inicio
	nop
    
    Middle_1:
	beq $t8, $zero, Next
	nop
	
	jal print_middle
	nop
	
	j Middle_1
	nop
    	
    	Next:
    		li $t8, 2 
    		
    		Middle_2:
			beq $t8, $zero, Condition
			nop	
				add $t0, $t0, 256
				addi $t8, $t8, -1
			j Middle_2
			nop

#Inicio do jogo
Inicio:
#Pixels da Bola
	
	la $s3, space
	addi $s3, $s3, 3440
	lw $t6, cores+20
	sw $t6, ($s3)
	sw $zero, ($s3)
	
	j Toc
	nop
MoveBall:
	jal Sound
	nop
	
	addi $s3, $s3, -4
	
	Toc:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, -4
	lw $t8, ($s3)
	
	lw $t1, cores
	lw $t2, cores+4
	lw $t3, cores+8
	lw $t4, cores+12
	lw $t5, cores+16
	lw $t6, cores+24
	lw $t7, cores+28
	
	beq $t8, $t3, Finish
	nop
	beq $t8, $t6, ReplaceMeio
	nop
		beq $t8, $t4, ReplaceUp1
		nop
			beq $t8, $t7, ReplaceDown1
			nop
				beq $t8, $t1, ReplaceTop1
				nop
					beq $t8, $t2, ReplaceBot1
					nop
						beq $t8, $t5, Dev
						nop
							addi $sp, $sp, -4
							sw $ra, ($sp)
							
							jal PixelBall
							nop
						j Toc
						nop
						Dev:
							jal Delay
							nop
							
							j Toc
							nop
				
			
ReplaceMeio:
	
	jal Sound
	nop
	
	addi $s3, $s3, 4
	
	Toc1:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
			
	addi $s3, $s3, 4
	lw $t8, ($s3)
	
	lw $t1, cores+8
	lw $t2, cores+12
	lw $t3, cores+16
	lw $t4, cores+24
	lw $t5, cores+28
	
	beq $t8, $t1, Finish
	nop
	beq $t8, $t4, MoveBall
	nop
		beq $t8, $t2, ReplaceUp2
		nop
			beq $t8, $t5, ReplaceDown2
			nop
				beq $t8, $t3, Dev1
				nop
				
					addi $sp, $sp, -4
					sw $ra, ($sp)
				
					jal PixelBall
					nop	
				j Toc1
				nop
				Dev1:	
						jal Delay
						nop
						
						j Toc1
						nop
ReplaceUp1:
	jal Sound
	nop
	
	addi $s3, $s3, -252
	
	Toc2:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, -252
	lw $t8, ($s3)
	
	lw $t1, cores
	lw $t2, cores+8
	lw $t3, cores+16
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceTop1
		nop
			beq $t8, $t3, Dev2
			nop
				addi $sp, $sp, -4
				sw $ra, ($sp)
				
				jal PixelBall
				nop
				
			j Toc2
			nop
			Dev2:
				jal Delay
				nop
							
				j Toc2
				nop
			
ReplaceDown1:
	jal Sound
	nop
	
	addi $s3, $s3, 260
	
	Toc3:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, 260
	lw $t8, ($s3)
	
	lw $t2, cores+4
	lw $t3, cores+8
	lw $t5, cores+16
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceBot1
		nop
			beq $t8, $t3, Dev3
			nop
				addi $sp, $sp, -4
				sw $ra, ($sp)
				
				jal PixelBall
				nop
			j Toc3
			nop
			Dev3:
				jal Delay
				nop
							
				j Toc3
				nop

ReplaceTop1:
	jal Sound
	nop
	
	addi $s3, $s3, 256
	
	Toc4:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, 260
	lw $t8, ($s3)
	
	lw $t1, cores+4
	lw $t2, cores+8
	lw $t3, cores+12
	lw $t4, cores+16
	lw $t5, cores+24
	lw $t6, cores+28
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceBot1
		nop
			beq $t8, $t5, MoveBall
			nop
				beq $t8, $t3, ReplaceUp2
				nop
					beq $t8, $t6, ReplaceDown2
					nop
						beq $t8, $t4, Dev4
						nop
							addi $sp, $sp, -4
							sw $ra, ($sp)
							
							jal PixelBall
							nop
						j Toc4
						nop
						Dev4:
							jal Delay
							nop
							
							j Toc4
							nop

ReplaceBot1:
	jal Sound
	nop
	
	addi $s3, $s3, -256
	
	Toc5:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, -252
	lw $t8, ($s3)
	
	lw $t1, cores
	lw $t2, cores+8
	lw $t3, cores+12
	lw $t4, cores+16
	lw $t5, cores+24
	lw $t6, cores+28
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t5, MoveBall
		nop
			beq $t8, $t3, ReplaceUp2
			nop
				beq $t8, $t6, ReplaceDown2
				nop
					beq $t8, $t1, ReplaceTop1
					nop
						beq $t8, $t4, Dev5
						nop
							addi $sp, $sp, -4
							sw $ra, ($sp)
							
							jal PixelBall
							nop
						j Toc5
						nop
						Dev5:
							jal Delay
							nop
							
							j Toc5
							nop

ReplaceUp2:
	jal Sound
	nop
	
	addi $s3, $s3, -260
	
	Toc6:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, -260
	lw $t8, ($s3)
	
	lw $t1, cores
	lw $t2, cores+8
	lw $t3, cores+16
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceTop2
		nop
			beq $t8, $t3, Dev6
			nop
				addi $sp, $sp, -4
				sw $ra, ($sp)
				
				jal PixelBall
				nop
			j Toc6
			nop
			Dev6:
				jal Delay
				nop
							
				j Toc6
				nop

ReplaceDown2:
	jal Sound
	nop
	
	addi $s3, $s3, 252
	
	Toc7:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, 252
	lw $t8, ($s3)
	
	lw $t1, cores+4
	lw $t2, cores+8
	lw $t3, cores+16
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceBot2
		nop
			beq $t8, $t3, Dev7
			nop
				addi $sp, $sp, -4
				sw $ra, ($sp)
				
				jal PixelBall
				nop
			j Toc7
			nop
			Dev7:
				jal Delay
				nop
							
				j Toc7
				nop
ReplaceTop2:
	jal Sound
	nop
	
	addi $s3, $s3, 256
	
	Toc8:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, 252
	lw $t8, ($s3)
	
	lw $t1, cores+4
	lw $t2, cores+8
	lw $t3, cores+12
	lw $t4, cores+16
	lw $t5, cores+24
	lw $t6, cores+28
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t1, ReplaceBot2
		nop
			beq $t8, $t5, ReplaceMeio
			nop
				beq $t8, $t3, ReplaceUp1
				nop
					beq $t8, $t6, ReplaceDown1
					nop
						beq $t8, $t4, Dev8
						nop
							addi $sp, $sp, -4
							sw $ra, ($sp)
							
							jal PixelBall
							nop
						j Toc8
						nop
						Dev8:
							jal Delay
							nop
							
							j Toc8
							nop
ReplaceBot2:
	jal Sound
	nop
	
	addi $s3, $s3, -256
	
	Toc9:
	lw $s5, ($s0)
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal fplay
	nop
	
	addi $s3, $s3, -260
	lw $t8, ($s3)
	
	lw $t1, cores
	lw $t2, cores+8
	lw $t3, cores+12
	lw $t4, cores+16
	lw $t5, cores+24
	lw $t6, cores+28
	
	beq $t8, $t2, Finish
	nop
		beq $t8, $t5, ReplaceMeio
		nop
			beq $t8, $t3, ReplaceUp1
			nop
				beq $t8, $t6, ReplaceDown1
				nop
					beq $t8, $t1, ReplaceTop2
					nop
						beq $t8, $t4, Dev9
						nop
							addi $sp, $sp, -4
							sw $ra, ($sp)
							
							jal PixelBall
							nop
						j Toc9
						nop
						Dev9:
							jal Delay
							nop
							
							j Toc9
							nop
#Keyboard
Play1:
	la $s6, space
	addi $s6, $s6, 2820
	move $s7, $s6
	addi $s7, $s7, 1792
	
	inicio:
	move $t0, $s6
	lw $s5, ($s0)
	
	jal Delay2
	nop
	
	beq $s5, $s1, UP
	nop
		beq $s5, $s2, DOWN
		nop
		
	UP:	
		jal Delay2
		nop
		
		li $t8, 8
		addi $s6, $s6, -256
		addi $s7, $s7, -256
		li $a3, 0
		
		jal print_palette1
		nop
		
		beq $a3, 1, Return11
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
		sw $zero, ($s0)
		addi $t0, $s6, 0
		li $t8, 8
	
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down3:
		beq $t8, 0, return10
		nop
		
		jal print_palette_down
		nop
				
		j Down3
		nop
		
	DOWN:	
		jal Delay2
		nop
		
		addi $s7, $s7, 256
		lw $v1, ($s7)
		
		lw $t2, cores+4
		
		beq $v1, $t2, Return13
		nop
			
		li $t8, 8
		addi $s6, $s6, 256

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
		sw $zero, ($s0)
		addi $t0, $s6, 0
		li $t8, 8

		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down4:
		beq $t8, 0, return10
		nop
		
		jal print_palette_down
		nop
				
		j Down4
		nop

Play2:
	la $s4, space
	addi $s4, $s4, 3064
	move $t9, $s4
	addi $t9, $t9, 1792
	
	inicio1:
	move $t0, $s4
	lw $s5, ($s0)
	
	jal Delay2
	nop
	
	beq $s5, $k1, UP1
	nop
		beq $s5, $k0, DOWN1
		nop
		
	UP1:	
		jal Delay2
		nop
		
		li $t8, 8
		addi $s4, $s4, -256
		addi $t9, $t9, -256
		li $a3, 0
		
		jal print_palette1
		nop
		
		beq $a3, 1, Return12
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
		sw $zero, ($s0)
		addi $t0, $s4, 0
		li $t8, 8
	
		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down6:
		beq $t8, 0, return10
		nop
		
		jal print_palette_down
		nop
				
		j Down6
		nop
		
	DOWN1:	
		jal Delay2
		nop
		
		addi $t9, $t9, 256
		lw $a2, ($t9)
		
		lw $t2, cores+4
		
		beq $a2, $t2, Return14
		nop
		
		li $t8, 8
		addi $s4, $s4, 256
		
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
		sw $zero, ($s0)
		addi $t0, $s4, 0
		li $t8, 8

		jal print_palette
		nop
		
		jal print_palette_middle
		nop
		
	Down9:
		beq $t8, 0, return10
		nop
		
		jal print_palette_down
		nop
				
		j Down9
		nop
Return11:
	addi $s6, $s6, 256
	j return10
	nop
	
Return12:
	addi $s4, $s4, 256
	j return10
	nop

Return13:
	addi $s7, $s7, -256
	j return10
	nop

Return14:
	addi $v0, $v0, -256
	j return10
	nop
	
#Subrotina para Deletar as paletas
print_palette1:
	
	move $a1, $t0
	addi $a1, $a1, -256
	lw $a2, ($a1)
	
	lw $t1, cores
	
	beq $a2, $t1, Return42
	nop
		
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
	
Return42:
	li $a3, 1
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

Delay2:
     li $t8, 100 #Verificar velocidade na apresentaï¿½ï¿½o
          Continua11:
		beq $t8, $zero, Return23
			nop
			addi $t8, $t8, -1
		
			j Continua11
			nop
	  Return23:
	  	jr $ra
	  	nop
	
PixelBall:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	sw $t6, ($s3)
	#Delay
		jal Delay
		nop
	sw $zero, ($s3)
	
	lw $ra, ($sp)
	addi $sp, $sp, +4

	jr $ra
	nop

Delay:
     li $t8, 15000 #Verificar velocidade na apresentaï¿½ï¿½o
          Continua10:
		beq $t8, $zero, Return
			nop
			addi $t8, $t8, -1
		
			j Continua10
			nop
	  Return:
	  	jr $ra
	  	nop

#Subrotina para printar o jogo a parte superior
print_superior:
	beq $t8, $zero, Return1
	nop
	
	lw $t1, cores
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
	
	lw $t1, cores+4		
	sw $t1, ($t0)
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
	
	lw $t1, cores+8
	sw $t1, ($t0)
	addi $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_side
	nop
	
Return3:
	jr $ra
	nop

#Subrotina para printar a parte do meio 
print_middle:
	lw $t1, cores+16
	sw $t1, ($t0)
	add $t0, $t0, 256
	addi $t8, $t8, -1
	
	jr $ra
	nop

#Subrotina para printa as paletas
print_palette:
	lw $t1, cores+12
	beq $t8, 5, Return4
	nop
		
	sw $t1, ($t0)
	addi $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette
	nop
	
Return4:
	jr $ra
	nop

print_palette_middle:
	beq $t8, 3, Return5
	nop
	
	lw $t1, cores+24
	sw $t1, ($t0)
	addi $t0, $t0, 256
	addi $t8, $t8, -1
	
	j print_palette_middle
	nop
	
Return5:
	jr $ra
	nop	
	
print_palette_down:
	lw $t1, cores+28
	sw $t1, ($t0)
	addi $t0, $t0, 256
	addi $t8, $t8, -1
	
	jr $ra
	nop

fplay:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	beq $s5, $s1, teste1
	nop
		bne $s5, $s2, teste2
		nop
	
	teste1:	
		bne $s6, $zero, second
		nop
			j Play1
			nop
		second:
			j inicio
			nop
	
	teste2:
	beq $s5, $k1, prox
	nop
		bne $s5, $k0, return10
		nop
	prox:
		bne $s4, $zero, prox1
		nop
			j Play2
			nop
		prox1:
			j inicio1
			nop
	return10:
		lw $ra, ($sp)
		addi $sp, $sp, +4
		
		jr $ra

Sound: 
	li $a0, 61
	li $a1, 500
	li $a2, 5
	li $a3, 120
	la $v0, 31
	syscall	

	jr $ra
	nop
Finish:
	la $t0, space
	li $a1, 2048
	li $a2, 0
	li $a3, 1
	li $t1, 0x000000
	li $s3, 0
	li $s4, 0
	li $s5, 0
	
	Gol:
	beq $a1, $a2, Exit
	nop
		sw $t1, ($t0)
		addi $t0, $t0, 4
		addi $a2, $a2, 1
		
		beq $a2, 651, G
		nop
		
		beq $a2, 779, G2
		nop
		
		beq $a2, 843, G2
		nop
		
		beq $a2, 907, G2
		nop
		
		beq $a2, 971, G2
		nop
		
		beq $a2, 1035, G2
		nop
		
		beq $a2, 1099, G2
		nop
		
		beq $a2, 1163, FimGOL
		nop
		
		j Gol
		nop
	
	FimGOL:
		jal O1
		nop
		
		jal Space
		nop
		
		jal O1
		nop
		
		jal Space
		nop
		
		jal O1
		nop
		
		jal Space
		nop
		
		jal O1
		nop
		
		j Gol
		nop
	
	G:
		jal O1
		nop
	
		jal Space
		nop

		jal O1
		nop
	
		jal Space
		nop

		jal Ponto
		nop
		
		jal Space3
		nop
		
		jal Ponto
		nop
		
		jal Space2
		nop
		
	G2:
		beq $a2, 907, G3
		nop
			beq $a2, 971, G4
			nop
				beq $a2, 1035, G4
				nop
					beq $a2, 1099, G4
					nop
		
		jal Ponto
		nop
		
		jal Space3
		nop
		
		j O2
		nop
	
	G3:
		jal Ponto
		nop
		
		jal Mid2
		nop
		
		jal Ponto
		nop
		
		jal Ponto
		nop
		
		jal Ponto
		nop
		
		jal Ponto
		nop
		
		jal Space
		nop
		
		j O2
		nop
		
	G4:
		jal Ponto
		nop
		
		jal Mid
		nop
		
		jal Ponto
		nop
		
		jal Space
		nop

	O2: 
		jal Ponto
		nop
		
		jal Mid
		nop
	
		jal Ponto
		nop
		
		jal Space
		nop

		jal Ponto
		nop
		
		jal Space3
		nop
		
		jal Ponto
		nop
	
		j Gol
		nop

O1: 
	li $a3, 1
	
	I:	
	sw $t2, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
		
	beq $a3,9,BackI
	nop 	
	j I
	nop	
	BackI:
		jr $ra
		nop
Space:
	li $a3, 1
	
	II:
	sw $t1, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
		
	beq $a3, 3, BackII
	nop
	j II
	nop
	BackII:
		jr $ra
		nop

Space2:
	li $a3, 1
	
	IV:
	sw $t1, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
		
	beq $a3, 34, BackIV
	nop
	j IV
	nop
	BackIV:
		jr $ra
		nop

Space3:
	li $a3, 1
	
	V:
	sw $t1, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
		
	beq $a3, 10, BackV
	nop
	j V
	nop
	BackV:
		jr $ra
		nop
	
Ponto:
	sw $t2, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	
	jr $ra
	nop

Mid:
	li $a3, 1
	
	III:
	sw $t1, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
			
	beq $a3, 7, BackIII
	nop		
	j III
	nop
	BackIII:
		jr $ra
		nop

Mid2:
	li $a3, 1
	
	VI:
	sw $t1, ($t0)
	addi $t0, $t0, 4
	addi $a2, $a2, 1
	addi $a3, $a3, 1
			
	beq $a3, 4, BackVI
	nop		
	j VI
	nop
	BackVI:
		jr $ra
		nop

Exit:
	nop
