.data
#if you dont define the string as asciiz, just ascii, it wull print a string until a null character.
out_string: .asciiz "\nHello, World!\n"
.text
#use f1 help for all directives
#syscall has a step list that has to be followed. Load into register, load argument, issue syscall.
#for "print string" load 4, then load string into $ao. We have nothing to retrive from the call.
li $v0, 4 #load immeciate into that location. $vo is used for system calls with the number as directive.
la $a0, out_string #load address of the string, not the value
syscall #calls syscall of 4
li $v0, 10 #loads value into a location
syscall #calls syscall of 10