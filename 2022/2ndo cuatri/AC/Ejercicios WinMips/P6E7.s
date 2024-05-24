.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008 
	coorX: .byte 1
	coorY: .byte 1
	color: .byte 255, 255, 255, 255

.code
lwu $s0, CONTROL ($0)
lwu $s1, DATA ($0)
lbu $s4, coorY ($0)
lbu $s5, coorX ($0)
lwu $s6, color ($0)
sw $s6, 0 ($s1)
daddi $sp, $0, 0x400
daddi $s7, $0, 5


jal leer_char

daddi $t0, $0, 7
sb $s2, 0 ($s0)


dadd $s2, $0, $0
bne $s2, $v0, sig_0
jal es_cero
sig_0: daddi $s2, $s2, 1
bne $s2, $v0, sig_1
jal es_uno
sig_1: daddi $s2, $s2, 1
bne $s2, $v0, sig_2
jal es_dos
sig_2: daddi $s2, $s2, 1
bne $s2, $v0, sig_3
jal es_tres
sig_3: daddi $s2, $s2, 1
bne $s2, $v0, sig_4
jal es_cuatro
sig_4: daddi $s2, $s2, 1
bne $s2, $v0, sig_5
jal es_cinco
sig_5: daddi $s2, $s2, 1
bne $s2, $v0, sig_6
jal es_seis
sig_6: daddi $s2, $s2, 1
bne $s2, $v0, sig_7
jal es_siete
sig_7: daddi $s2, $s2, 1
bne $s2, $v0, sig_8
jal es_ocho
sig_8: daddi $s2, $s2, 1
bne $s2, $v0, fin
jal es_nueve
fin: halt


leer_char: daddi $t0, $0, 9
daddi $t1, $0, 0x30
daddi $t2, $0, 0x39
lazo: sd $t0, 0 ($s0)
lbu $v0, 0 ($s1)
slt $t3, $v0, $t1
bnez $t3, lazo
slt $t3, $t2, $v0
bnez $t3, lazo
daddi $v0, $v0, -0x30
jr $ra


es_cero: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal ab
	jal d_ab
	jal d_ar	
	jal i_ab
	jal i_ar
	jal ar
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_uno: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal d_ab
	jal d_ar
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra	

es_dos: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal i_ab
	jal ce	
	jal d_ar
	jal ar
	jal ab
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_tres: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal ab
	jal d_ab
	jal ce
	jal d_ar
	jal ar
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_cuatro: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal d_ab
	jal ce
	jal d_ar
	jal i_ar
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_cinco: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal ab
	jal d_ab
	jal i_ar
	jal ar
	jal ce
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_seis: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal ab
	jal d_ab
	jal i_ab
	jal i_ar
	jal ar
	jal ce
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_siete: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal d_ab
	jal d_ar
	jal ar
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_ocho: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal ab
	jal d_ab
	jal d_ar	
	jal i_ab
	jal i_ar
	jal ar
	jal ce
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

es_nueve: daddi $sp, $sp, -8
	sd $ra, 0 ($sp)
	jal d_ab
	jal d_ar	
	jal i_ar
	jal ar
	jal ce
	ld $ra, 0 ($sp)
	daddi $sp, $sp, 8
	jr $ra

d_ar: daddi $t0, $s5, 4
	daddi $t1, $s4, 4
	daddi $t2, $0, 3
	sb $t0, 5 ($s1)
lazo1: sb $t1, 4 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t1, $t1, 1
		bnez $t2, lazo1
jr $ra


d_ab: daddi $t0, $s5, 4
	daddi $t1, $s4, 1
	daddi $t2, $0, 3
	sb $t0, 5 ($s1)
lazo2: sb $t1, 4 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t1, $t1, 1
		bnez $t2, lazo2
jr $ra

i_ar: daddi $t0, $s5, 0
	daddi $t1, $s4, 4
	daddi $t2, $0, 3
	sb $t0, 5 ($s1)
lazo3: sb $t1, 4 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t1, $t1, 1
		bnez $t2, lazo3
jr $ra

i_ab: daddi $t0, $s5, 0
	daddi $t1, $s4, 1
	daddi $t2, $0, 3
	sb $t0, 5 ($s1)
lazo4: sb $t1, 4 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t1, $t1, 1
		bnez $t2, lazo4
jr $ra

ab: daddi $t0, $s5, 1
	daddi $t1, $s4, 0
	daddi $t2, $0, 3
	sb $t1, 4 ($s1)
lazo5: sb $t0, 5 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t0, $t0, 1
		bnez $t2, lazo5
jr $ra


ce: daddi $t0, $s5, 1
	daddi $t1, $s4, 4
	daddi $t2, $0, 3
	sb $t1, 4 ($s1)
lazo6: sb $t0, 5 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t0, $t0, 1
		bnez $t2, lazo6
jr $ra




ar: daddi $t0, $s5, 1
	daddi $t1, $s4, 7
	daddi $t2, $0, 3
	sb $t1, 4 ($s1)
lazo7: sb $t0, 5 ($s1)
		daddi $t2, $t2, -1
		sb $s7, 0 ($s0)
		daddi $t0, $t0, 1
		bnez $t2, lazo7
jr $ra








