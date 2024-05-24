.data
tabla_1: .word 21, 1, 5, 16, 8, 39, 10, 41, 4, 33

tabla_2: .word 34, 24, 15, 32, 17, 28, 11, 20, 44, 21
min_tabla1: .word 00
max_tabla1: .word 00
min_tabla2: .word 00
max_tabla2: .word 00
rojo: .byte 255,0,0,0
verde: .byte 0,255,0,0

CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL ($0)
lwu $s1, DATA ($0)

daddi $a1, $0, 10
daddi $a0, $0, tabla_1
jal calcular
sd $v0, min_tabla1 ($0)
sd $v1, max_tabla1 ($0)

daddi $a1, $0, 10
daddi $a0, $0, tabla_2
jal calcular
sd $v0, min_tabla2 ($0)
sd $v1, max_tabla2 ($0)


daddi $t0, $0, 5
lwu $t4, rojo ($0)
lbu $t1, min_tabla1 ($0)
lbu $t2, max_tabla2 ($0)
sb $t1, 5 ($s1)
sb $t2, 4 ($s1)
sw $t4, 0 ($s1)
sb $t0, 0 ($s0)


daddi $t0, $0, 5
lwu $t4, verde ($0)
lbu $t1, min_tabla2 ($0)
lbu $t2, max_tabla1 ($0)
sb $t1, 5 ($s1)
sb $t2, 4 ($s1)
sw $t4, 0 ($s1)
sd $t0, 0 ($s0)


halt


calcular: daddi $t1, $0, 99
	daddi $t2, $0, -99
lazo:	lbu $t0, 0 ($a0)
	slt $t8, $t0, $t1
	beqz $t8, sig
	dadd $t1, $0, $t0
sig:	slt $t9, $t2, $t0
	beqz $t9, no
	dadd $t2, $0, $t0
no:	daddi $a1, $a1, -1
	daddi $a0, $a0, 8	
	bnez $a1, lazo
	dadd $v0, $0, $t1
	dadd $v1, $0, $t2
jr $ra