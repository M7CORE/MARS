.data
prompt1: .asciiz "\nEnter n :"
.text
li $v0, 4 #syscall for print
la $a0, prompt1 #load message
syscall #print message
li $v0,5 # read a value for n from the user
syscall #read value
move $t5,$v0 # store n in $t5
beqz $t5, done
#Beginning code for Fibonacci
li $a0,1 # initialize counter variable
move $v0, $a0 #move counter to v0
li $t0, 0 #base case for 0
fib:
#t0 = n-2
#v0 = n - 1
beq $a0, $t5, done # when loop is run n number of times, exit from loop
add $t1, $t0, $v0 # fib(n)=fib(n-1) +fib(n-2). Add 2 previous numbers
move $t0, $v0 # move n - 1 to n - 2
move $v0, $t1 # move n t0 n-1
addi $a0, $a0, 1 # increment loop counter
bge $a0, 1, fib # if $a0 is greater than 1, go back to fib loop
done:
move $a0,$v0 # print the nth fibonacci number
li $v0, 1 
syscall
