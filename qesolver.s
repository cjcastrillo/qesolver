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
	l.s	$f12, valuea
	l.s	$f13, valueb
	l.s	$f14, valuec
	jal	quadeqs
	li	$a0, '\n'
	li	$v0, 11
	syscall
	beq	$v0, -1, imaginary
	beqz	$v0, none
	beq	$v0, 1, single
	la	$a0, result4	#2 roots, so print both
	li	$v0, 4
	syscall
	mov.s	$f12, $f0
	li	$v0, 1
	syscall
	li	$a0, '\n'
	li	$v0, 11
	syscall
	la	$a0, result5
	li	$v0, 4
	syscall
	mov.s	$f12, $f1
	li	$v0, 1
	syscall
	b	exit
imaginary:
	la	$a0, result2
	li	$v0, 4
	syscall
	b	exit
none:
	la	$a0, result1
	li	$v0, 4
	syscall
	b	exit
single:
	la	$a0, result3
	li	$v0, 4
	syscall
	mov.s	$f12, $f0
	li	$v0, 1
	syscall
exit:
	li	$v0, 10
	syscall

quadeqs:
	c.eq.s	$f12, $f20	#check if a and b values give a quadratic equation
	bc1f	discriminant
	c.eq.s	$f13, $f20
	bc1f	singleroot
	li	$v0, 0	#both a and b are 0 so not a quadratic equation
	jr	$ra
singleroot:		#linear functiong given, so only 1 root return -c/b
	li	$v0, 1
	neg.s	$f16, $f14
	div.s	$f0, $f16, $f13
	jr	$ra
discriminant:
	mul.s	$f4, $f13, $f13	#calculate discriminant
	mul.s	$f5, $f12, $f14
	li.s	$f6, 4.0
	mul.s	$f5, $f5, $f6
	sub.s	$f4, $f4, $f5
	c.lt.s	$f4, $f20	#check if discriminant is negative
	bc1f	tworoots
	li	$v0, -1	#discriminant is negative so roots are not real numbers
	jr	$ra
tworoots:		#there are 2 roots. Finish rest of quadratic formula to find them
	mov.s	$f5, $f12
	mov.s	$f12, $f4
	jal	sqrts
	neg.s	$f6, $f13	#-b
	li.s	$f7, 2.0
	mul.s	$f8, $f5, $f7	#2a
	add.s	$f1, $f6, $f0
	div.s	$f1, $f1, $f8	#(-b+sqrt(discriminant))/2a
	sub.s	$f0, $f6, $f0
	div.s	$f0, $f0, $f8	##(-b-sqrt(discriminant))/2a
	li	$v0, 2
	jr	$ra

sqrts:
	sqrt.s	$f0, $f12
	jr	$ra