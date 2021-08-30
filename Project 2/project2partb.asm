#Maria Corella 7/8/2020
#EEL3801
#Counts the C, H, A, R, G, E, O, N in a string,
#$t0 - used to hold C counter
#$t1 - used to hold H counter
#$t2 - used to hold A counter
#$t3 - used to hold R counter
#$t4 - used to hold G counter
#$t5 - used to hold E counter
#$t6 - used to hold O counter
#$t7 - used to hold N counter
#$t8 - used to hold the character
#$t9 - used to hold the loop counter
#$a0 - used to hold the address of string
#$v0 - syscall parameter and return value

.data
str: .asciiz "To assist N.C. Division of Motor Vehicle customers and partners in dealing with the impact of the coronavirus pandemic, a provision included in the COVID-19 bill signed into law today by Governor Cooper grants a five-month extension of the expiration date on more than two dozen DMV credentials."
ccount: .asciiz "C:"
hcount: .asciiz "\nH:"
acount: .asciiz "\nA:"
rcount: .asciiz "\nR:"
gcount: .asciiz "\nG:"
ecount: .asciiz "\nE:"
ocount: .asciiz "\nO:"
ncount: .asciiz "\nN:"
pound: .asciiz "#"
newline: .asciiz "\n"

.text
la $a0, str #load string to address $a0

li $t0, 0 #initialize C counter to 0
li $t1, 0 #initialize H counter to 0
li $t2, 0 #initialize A counter to 0
li $t3, 0 #initialize R counter to 0
li $t4, 0 #initialize G counter to 0
li $t5, 0 #initialize E counter to 0
li $t6, 0 #initialize O counter to 0
li $t7, 0 #initialize N counter to 0

loop:
lb $t8, 0($a0) #load next character
beqz $t8, exit #check for null terminating character
#lowercase onearchg
beq $t8, 111, labelo #check if char is o
beq $t8, 110, labeln #check if char is n
beq $t8, 101, labele #check if char is e
beq $t8, 97, labela #check if char is a
beq $t8, 114, labelr #check if char is r
beq $t8, 99, labelc #check if char is c
beq $t8, 104, labelh #check if char is h
beq $t8, 103, labelg #check if char is g
#uppercase
beq $t8, 79, labelo #check if char is O
beq $t8, 78, labeln #check if char is N
beq $t8, 69, labele #check if char is E
beq $t8, 65, labela #check if char is A
beq $t8, 82, labelr #check if char is R
beq $t8, 67, labelc #check if char is C
beq $t8, 72, labelh #check if char is H
beq $t8, 71, labelg #check if char is G
addi $a0, $a0, 1 #advance the address by 1 if none of the above
j loop #jump to loop label if char is none of the above

labelc:
addi $t0, $t0, 1 #increment C counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labelh:
addi $t1, $t1, 1 #increment H counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labela:
addi $t2, $t2, 1 #increment A counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labelr:
addi $t3, $t3, 1 #increment R counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labelg:
addi $t4, $t4, 1 #increment G counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labele:
addi $t5, $t5, 1 #increment E counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labelo:
addi $t6, $t6, 1 #increment O counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

labeln:
addi $t7, $t7, 1 #increment N counter by 1
addi $a0, $a0, 1 #advance the address by 1
j loop

exit:
li $v0, 4 #load print string command
la $a0, ccount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t0 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, hcount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t1 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, acount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t2 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, rcount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t3 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, gcount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t4 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, ecount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t5 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, ocount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t6 #loads counter to be printed
syscall #syscall to print the counter

li $v0, 4 #load print string command
la $a0, ncount #load count string
syscall #syscall to print string

li $v0, 1 #loads print integer command
move $a0, $t7 #loads counter to be printed
syscall #syscall to print the counter

#Start printing the histogram

li $v0, 4 
la $a0, newline
syscall

li $v0, 4 
la $a0, newline
syscall

li $v0, 4 #load print string command
la $a0, ccount #load count string
syscall #syscall to print string

li $t9, 0 #set loop counter to 0

cpound: #loop to print pound sign for C
bge $t9, $t0, cpoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j cpound

cpoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, hcount #load count string
syscall #syscall to print string

hpound: #loop to print pound sign for H
bge $t9, $t1, hpoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j hpound

hpoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, acount #load count string
syscall #syscall to print string

apound: #loop to print pound sign for A
bge $t9, $t2, apoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j apound

apoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, rcount #load count string
syscall #syscall to print string

rpound: #loop to print pound sign for R
bge $t9, $t3, rpoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j rpound

rpoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, gcount #load count string
syscall #syscall to print string

gpound: #loop to print pound sign for G
bge $t9, $t4, gpoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j gpound

gpoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, ecount #load count string
syscall #syscall to print string

epound: #loop to print pound sign for E
bge $t9, $t5, epoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j epound

epoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, ocount #load count string
syscall #syscall to print string

opound: #loop to print pound sign for O
bge $t9, $t6, opoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j opound

opoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 4 #load print string command
la $a0, ncount #load count string
syscall #syscall to print string

npound: #loop to print pound sign for N
bge $t9, $t7, npoundexit #jump to next label if loop is completed
li $v0, 4 #load the print command
la $a0, pound #load the pound sign
addi $t9, $t9, 1 #increment the counter
syscall #print the pound sign
j npound

npoundexit:
li $t9, 0 #set loop counter to 0

li $v0, 10 #loads exit command
syscall #syscall to exit the program
