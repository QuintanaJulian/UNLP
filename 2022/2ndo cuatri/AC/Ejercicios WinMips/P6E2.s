.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
CERO: .asciiz "CERO"
.asciiz "UNO"
.asciiz "DOS"
.asciiz "TRES"
.asciiz "CUATRO"
.asciiz "CINCO"
.asciiz "SEIS"
.asciiz "SIETE"
.asciiz "OCHO"
.asciiz "NUEVE"

.code
	lwu $s0, DATA ($0)
	lwu $s1,  CONTROL ($0)
	jal ingreso
	jal muestra
	halt


ingreso: daddi $t0, $0, 9
daddi $t1, $0, 0x30
daddi $t2, $0, 0x39
lazo: sd $t0, 0 ($s1)
lbu $v0, 0 ($s0)
slt $t3, $v0, $t1 
bnez $t3, lazo
slt $t4, $t2, $v0
bnez $t4, lazo
daddi $v0, $v0, -0x30
jr $ra

	
muestra: dsll $t2, $v0, 3
daddi $t3, $t2, CERO
sd $t3, 0 ($s0)
daddi $t0, $0, 4
sb $t0, 0 ($s1)
jr $ra