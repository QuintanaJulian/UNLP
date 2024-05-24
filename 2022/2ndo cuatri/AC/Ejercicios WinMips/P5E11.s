.data
tabla: .word 2,5,6,3,9,1,18,17,55,0
resultado: .word 0

.code
daddi $t0, $0, tabla
daddi $sp, $0, 0x400
jal CONTAR
sd $v0, resultado ($0)

halt

CONTAR: dadd $v0, $0, $0
	daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
lazo:	lw $a0, 0 ($t0)
	beqz $a0, fin
	jal ES_IMPAR
	dadd $v0, $v0, $v1
	daddi $t0, $t0, 8
	j lazo
fin:	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra


ES_IMPAR:  andi $v1, $a0, 1
	jr $ra
	

