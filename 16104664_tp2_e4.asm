#x
ori $t1, $zero, 3
#y
ori $t2, $zero, 4
#z
ori $t3, $zero, 5

#operação 4x

add $t4, $t4, $t1
add $t4, $t4, $t1
add $t4, $t4, $t1
add $t4, $t4, $t1

#operação 2y

sll $t5, $t2, 1

#operação 3z

add $t6, $t6, $t3
add $t6, $t6, $t3
add $t6, $t6, $t3

#soma final

add $t7, $t4, $t6
sub $t7, $t7, $t5


