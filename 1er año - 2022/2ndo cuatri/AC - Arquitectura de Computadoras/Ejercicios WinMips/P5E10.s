.data
vocales: .asciiz 'AEIOUaeiou'
caracter: .asciiz "Hola como estas?"
cantidad: .word 0

.code 
	daddi $sp, $0, 0x400
	jal CONTAR_VOC
	sd $v0, cantidad ($0)
	halt
	

CONTAR_VOC: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	dadd $v0, $0, $0
	dadd $s0, $0, $0
lazo2: lb $a0, caracter ($s0)
	beqz $a0, fin2
	jal ES_VOCAl
	daddi $s0, $s0, 1
	j lazo2
fin2: ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

ES_VOCAl: daddi $t0, $0, vocales
lazo: lb $t1, 0 ($t0)
	beqz $t1, fin
	daddi $t0, $t0, 1
	bne $t1, $a0, lazo
	daddi $v0, $v0, 1
fin:	jr $ra