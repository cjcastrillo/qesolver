#
#	Name:		Carlos Castrillo
#	Project:	5
#	Due:		11/24/2021
#	Course:		cs-2640-02-f21
#
#	Description:
#				Use the FPU to do the qudratic formula
#
	
	.data
intro:
	.asciiz	"Quadratic Equation Solver by C. Castrillo\n\n"
prompta:
	.asciiz	"Enter values for a? "
promptb:
	.asciiz	"Enter values for b? "
promptc:
	.asciiz	"Enter values for c? "
result1:
	.asciiz	"Not a quadratic equation."
result2:
	.asciiz	"Roots are imaginary."
result3:
	.asciiz	"x = "
result4:
	.asciiz "x1 = "
result5:
	.asciiz "x2 = "
valuea:
	.float	0.0
valueb:
	.float	0.0
valuec:
	.float	0.0

	.text
main:
	la	$a0, intro
	li	$v0, 4
	syscall
	la	$a0, prompta	#Get value for a
	syscall
	li	$v0, 6
	syscall
	mfc1	$t0, $f0
	sw	$t0, valuea
	la	$a0, promptb	#Get value for b
	li	$v0, 4
	syscall
	li	$v0, 6
	syscall
	mfc1	$t0, $f0
	sw	$t0, valueb
	la	$a0, promptc	#Get value for c
	li	$v0, 4
	syscall
	li	$v0, 6
	syscall
	mfc1	$t0, $f0
	sw	$t0, valuec
	jr	$ra

quadeqs:

sqrts:
	sqrt.s	$f0, $f12
	jr	$ra