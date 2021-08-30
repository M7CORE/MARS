#Exercise 2-b Portfolio 2 06/03/2020
#Maria Corella 4418914
#Counts from 0 to 20 and prints result in binary

.data
nline: .asciiz "\n"
.text
li $t1, 0
li $t2, 20
loop: bgt $t1, $t2, exit #condition to exit loop
li $v0, 35 #syscall to print in binary
la $a0, ($t1) #load the sbtraction into $a0
syscall #print this number
li $v0, 4 #load print command
la $a0, nline #print space
syscall
addi $t1, $t1, 1 #increment number by 1
ble $t1, $t2, loop #condition to continue loop
exit: 
li $v0, 10 #load exit syscall
syscall #call the function