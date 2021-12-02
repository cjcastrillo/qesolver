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
