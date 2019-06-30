ori $t1, $zero, 0x1234
sll $t1, $t1, 16

ori $t1, $t1, 0x5678

#8
or $t3, $t1, $t1
sll $t2, $t3, 28

#7
or $t3, $t1, $t1
srl $t3, $t3, 4
sll $t3, $t3, 28
srl $t3, $t3, 4
or $t2, $t2, $t3

#6
or $t3, $t1, $t1
srl $t3, $t3, 8
sll $t3, $t3, 28
srl $t3, $t3, 8
or $t2, $t2, $t3

#5
or $t3, $t1, $t1
srl $t3, $t3, 12
sll $t3, $t3, 28
srl $t3, $t3, 12
or $t2, $t2, $t3

#4
or $t3, $t1, $t1
srl $t3, $t3, 16
sll $t3, $t3, 28
srl $t3, $t3, 16
or $t2, $t2, $t3

#3
or $t3, $t1, $t1
srl $t3, $t3, 20
sll $t3, $t3, 28
srl $t3, $t3, 20
or $t2, $t2, $t3

#2
or $t3, $t1, $t1
srl $t3, $t3, 24
sll $t3, $t3, 28
srl $t3, $t3, 24
or $t2, $t2, $t3

#1
or $t3, $t1, $t1
srl $t3, $t3, 28
or $t2, $t2, $t3

