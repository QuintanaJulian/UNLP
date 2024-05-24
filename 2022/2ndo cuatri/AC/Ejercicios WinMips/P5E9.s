.data
vocales: .asciiz 'AEIOUaeiou'
caracter: .ascii "i"
cantidad: .word 0

.code
	dadd $v0, $0, $0
	lb $a0, caracter ($0)
	jal ES_VOCAl
	sd $v0, cantidad ($0)
	halt
	


ES_VOCAl: daddi $t0, $0, vocales
lazo: lb $t1, 0 ($t0)
	beqz $t1, fin
	daddi $t0, $t0, 1
	bne $t1, $a0, lazo
	daddi $v0, $v0, 1
fin:	jr $ra