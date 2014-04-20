	
	.data
	question1: .asciiz "How many characters do you want to play with 5,6 or 7 \n"
	file: .asciiz "words.txt"
	buffer: .space 20
	newline: .asciiz "\n"
	.globl main

.text

main:
	#Testing parseFile function 
        la $a0,question1 
        li $v0, 4
	syscall
	#read input from user	
	li $v0,5
	syscall
	move $s1,$v0
	
	#call parseFile
        jal parseFile
        sw $v0,4($sp)
        #exit program
        li $v0,10
        syscall

parseFile:
	
	
	#Load file name
	la $a0, file	        
	li $a1, 0		#Set flag to 0 =read-only
	li $a2, 0		#set mode to 0
	#Open file; file descriptor is now contained in $v0
	li $v0, 13	   	
	syscall
	#Store file descriptor
	move $s0, $v0		
	
	
	#Move FD to $a0
	move $a0, $s0	
	#Load buffer	
	la $a1, buffer	
	
	li $a2, 20		
	li $v0, 14		#Read the file
	syscall
	move $s1, $v0		#Save how many chars read
	
	
	
	#Load buffer
	la $a0, buffer	
	#Print string
	li $v0, 4		
	syscall
	
	jr $ra
	#must implement to check how many bytes in words returned
checkWords:
	
	
