.data
clave: .asciiz "H4cK"
ERROR: .asciiz "ERORR"
CORRECTO: .asciiz "Bienvenido"
prueba: .word 0000
CONTROL: .word32 0x10000
DATA:  .word32 0x10008

.code
	lwu $s0, CONTROL ($0)
	lwu $s1, DATA ($0)
	lwu $s2, prueba ($0)
	lwu $s3, clave ($0)
otra:	jal char
	jal respuesta
	bnez $v1, otra
	halt


char: daddi $t0, $0, 9
	dadd $t1, $0 , $0
	daddi $t2, $0, 4
lazo: sd $t0, 0 ($s0)
	ld $t4, 0 ($s1)
	sb $t4, prueba ($t1)
	daddi $t1, $t1, 1
	bne $t1, $t2, lazo
	jr $ra


respuesta: dadd $t0, $0, $0
	daddi $t4, $0, 4
lazo2: lbu $t1, prueba ($t0)
	lbu $t2, clave ($t0)
	daddi $t0, $t0, 1
	daddi $t4, $t4, -1
	bne $t1, $t2, incorrecto
	bnez $t4, lazo2
correcto: dadd $v1, $0, $0
	daddi $t0, $0, CORRECTO
	sb $t0, 0 ($s1)
	j fin
incorrecto: daddi $v1, $0, 1
	daddi $t0, $0, ERROR
	sd $t0, 0 ($s1)
fin: daddi $t1, $0, 4
	sd $t1, 0 ($s0)
	jr $ra 