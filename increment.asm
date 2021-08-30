#Exercise 1-a Portfolio 2 06/03/2020
#Maria Corella 4418914
#Increment from 0 to 20 and display the decimal number

.data
space: .asciiz " "
.text
li $t1, 0
li $t2, 20
loop: bgt $t1, $t2, exit #condition to exit loop
li $v0, 1 #syscall to print integer
la $a0, ($t1) #load the sbtraction into $a0
syscall #print this number
li $v0, 4 #load print command
la $a0, space #print space
syscall
addi $t1, $t1, 1 #increment number by 1
ble $t1, $t2, loop #condition to continue loop
exit: 
li $v0, 10 #load exit syscall
syscall #call the function