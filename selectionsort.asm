#Maria Corella
#10/04/2020
#EEL4768 - HW2
#Selection Sort Algorithm
#$t0 = length of array - 1
#$t1 = i counter
#$t2 = address of array
#t3 = end flag
#$t4 = min
#t5 = j counter
#$s0 = shift amount for min
#$t6 = word at min
#$s1 = shift amount for i
#$t7 = word at j
#$t8 = temp
#$s2 = hold address
#$t9 = shift for printing
#$s4 = length
#$s3 = counter for printing

.data
array:  .word  2, 1, 2, 3, 4, 5, 7, 9, 8
comma: .asciiz ", "

.text
li $t0, 8 #store length - 1, i type, ALU
li $t1, 0 #start counter, i type, ALU
la $t2, array #load array,  2 i type, ALU
li $s3, 0 #counter to print, i type, ALU
li $s4, 9 #length, i type, ALU

loop1: 
slt $t3, $t1, $t0   # set flag if i counter < length, r type, other
beq $t3, $zero, print # check flag, i type, branch
addi $t4, $t1, 0 #set min to i, i type, ALU
addi $t5, $t1, 1 #j counter = i + 1, i type, ALU
  
loop2: 
slt $t3, $t5, $s4 #set flag if j counter < length, r type, other
beq $t3, $zero, endloop2 #check flag, i type, branch

sll $s0, $t4, 2 #get next shift, r type, ALU
add $s0, $s0, $t2 #address of min, r type, ALU
lw $t6, 0($s0)# load value at min, i type, memory

sll $s1, $t5, 2 #get next shift, r type, ALU
add $s1, $s1, $t2 #address of j, r type, ALU
lw $t7, 0($s1) #load word at j, i type, memory

slt $t3, $t7, $t6 #set flag if j < min, r type, other
beq $t3, $zero, ifstatement #check flag, i type, branch
addi $t4, $t5, 0 #min = j, i type, ALU
j ifstatement #j type, jump

ifstatement: 
beq $t4, $t1, jinc #swap if min != i, i type, branch
sll $s1, $t4, 2 #get next shift for min, r type, ALU
add $s1, $s1, $t2 #get address of min, r type, ALU
lw $t8, 0($s1) #have t8 store min value, i type, memory

sll $s2, $t1, 2 #get next shift for i, r type, ALU
add $s2, $s2, $t2 #get address for i, r type, ALU
lw $s0, 0($s2) #load word at i, i type, memory

sw $s0, 0($s1) #set min value = i value, i type, memory
sw $t8, 0($s2) #set i value = min value, i type, memory
addi $t5, $t5, 1 #increment j, i type, ALU
addi $t4, $t1, 0 #min = i, i type, ALU
j loop2	# j type, jump

jinc: 
addi $t5, $t5, 1 #increment j, i type, ALU
j loop2 # j type, jump

endloop2: 
addi $t1, $t1, 1 #increment i, i type, ALU
j loop1	# j type, jump
			
print:
sll $t9, $s3, 2 #find shift amount, r type, ALU
add $t9, $t2, $t9 #shift address by that amount, r type, ALU
li $v0,1 # i type, ALU
lb $a0, 0($t9) # i type, ALU
syscall # r type, other
li $v0,4 # i type, ALU
la $a0,comma # i type, ALU
syscall	# r type, other
addi $s3, $s3, 1 # increment counter, i type, ALU
ble $s3, $t0, print #loop if char available, r and i type, branch

li $v0, 10 #load exit syscall, i type, ALU
syscall #call the function, r type, other
