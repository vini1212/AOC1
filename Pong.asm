.data

LOOP1: .word 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0
.text

  la $t8, LOOP1           #

  li $t2, 114             #sound's timbre  ???
Loop:

  lw $t1, 0($t8)
  addiu $t8, $t8, 4  # Increment play data
  addi $t7, $t7, 1        #$t7 is used to verify the loop's end
  bne $0, $t1, PlaySound      
  li $a0, 100
  li $v0, 32
  syscall                    #sleep syscall
Afterplayng:
  beq $t7, 16, ReinitializeLoopCounter
  j Loop                #jumps back to the top of loop
PlaySound:
  li $a0, 62 
#  li $a1, 100
  li $a1, 500  # half second
  move $a2, $t2
  li $a3, 120
  la $v0, 33
  syscall                #calls service 33, playing music
  j Afterplayng
ReinitializeLoopCounter:
  addi $t7, $0, 1
  la $t8, LOOP1           # Reinitialize $t8
  j Loop