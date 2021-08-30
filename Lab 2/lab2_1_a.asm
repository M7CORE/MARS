#Exercise 1-a Portfolio 2 06/03/2020
#Maria Corella 4418914
#Gives difference of two numbers given by the user.
#$t0 holds largest number, $t1 holds smaller number
#$t2 holds the difference of the other values.
#$v0 syscall parameter and return value
#$a0 syscall parameter
.data
	#out_1: .asciiz "\nInput larger number\n"
	#out_2: .asciiz "\ninput smaller number\n"
	#out_3: .asciiz "\nThe difference is:\n"
.text
li $v0, 5 #syscall to read
syscall #loads read value to $v0
addi $t0, $v0, 0  #places read value into $t0 

li $v0, 5 #syscall to read
syscall #loads read value to $v0
add $t1, $v0, 0 #places read value into $t0 

sub $t2, $t0, $t1 #execute the subtraction

li $v0, 1 #syscall to print integer
la $a0, ($t2) #load the sbtraction into $a0
syscall #print this number

li $v0, 10 #load exit syscall
syscall #call the function