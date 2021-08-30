#Maria Corella
#10/04/2020
#EEL4768 - HW2
#Bubble Sort Algorithm

.data
numbers: .word 2, 1, 2, 3, 4, 5, 7, 9, 8
comma: .asciiz ", "

.text
la $s0, numbers #load address, i type, ALU
li $t0, 0 #use as counter i, i type, ALU
li $t1, 0 #use as counter j, i type, ALU
li $t2, 8 #array size - 1, i type, ALU

loop:
sll $t3, $t1, 2 #move by 2, r type, ALU
add $t3, $s0, $t3 #get next address, r type, ALU
lw $t4, 0($t3) #load the number, i type, memory
lw $t5, 4($t3) #load the next number, i type, memory
bgt $t5, $t4, noswap #first number is greater than next, r and i type, branch and other
beq $t5, $t4, noswap #first number is equal to the next, r and i type, branch
sw $t5, 0($t3) #do swap, i type, memory
sw $t4, 4($t3) #do swap, i type, memory

noswap:
addi $t1, $t1, 1 #j++, i type, ALU
sub $t6, $t2, $t0 #find size - i - 1, r type, ALU
bne $t1, $t6, loop #if the loop hasn't finished, r and i type, brnach
addi $t0, $t0, 1 #i++, i type, ALU
li $t1, 0 #j = 0, i type, ALU
bne $t0, $t2, loop #keep looping, r and i type, branch

li $t0, 0 #set counter to 0, i type, ALU

print:
sll $t7, $t0, 2 #find shift amount, r type, ALU
add $t7, $s0, $t7 #shift address by that amount, r type, ALU
li $v0,1 #i type, ALU
lb $a0,0($t7) #i type, ALU
syscall #r type, other
li $v0,4 #i type, ALU
la $a0,comma #i type, ALU
syscall	#r type, other
addi $t0, $t0, 1 # increment counter, i type, ALU
ble $t0, $t2, print #loop if char available, r and i type, branch

li $v0, 10 #load exit syscall, i type, ALU
syscall #call the function, r type, other
