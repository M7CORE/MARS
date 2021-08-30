#compare values
#beq
.data
.text
beq $t0, $t1, L1 #willc oompare $t0 and $t1, if they are equal then  it goes to label L1
#otherwise it will continue its flow
#ble is less then, equal to
#bqz compares register, if the value is 0 it branches to the label
#bez compares that the value is not 0 and it will branch to the label
#branch interrupsts flow, jump doesnt have a condition
#bgt is branch greater than
#blt is branch less than
li $t3, 0 #initialize variable
li $t0, 0 #initialize variable
loop: #condition
blt $t0, $t1, loop #checks condition to decide if go through the loop again
#the condition being checked should be the opposite of the condition in the code 