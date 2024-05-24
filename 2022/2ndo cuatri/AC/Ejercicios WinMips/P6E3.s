.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
RESULTADO: .word 0

.code
	lwu $s0, DATA ($0)
	lwu $s1,  CONTROL ($0)
	jal ingreso
	dadd $s3, $v0, $0
	jal ingreso
	dadd $s4, $v0, $0
	jal resultado
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

	
resultado: dadd $t0, $s3, $s4
	sd $t0, 0 ($s0)
	daddi $t1, $0, 2
	sd $t1, 0 ($s1)
	jr $ra