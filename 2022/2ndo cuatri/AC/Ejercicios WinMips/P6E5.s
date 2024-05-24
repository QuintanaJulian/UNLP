.data
CONTROL: .word32 0x10000
DATA:  .word32 0x10008


.code
lwu $s0, CONTROL ($0)
lwu $s1, DATA ($0)


daddi $t0, $0, 8
sd $t0, 0 ($s0)
l.d f1, 0 ($s1)
sd $t0, 0 ($s0)
ld $a0, 0 ($s1)

jal a_la_potencia

s.d f0, 0 ($s1)
daddi $t1, $0, 3
sd $t1, 0 ($s0)
halt



a_la_potencia: mtc1 $r0, f0
	cvt.d.l f0, f0
	c.eq.d f0, f1
	bc1t fin
	beqz $a0, uno
	daddi $a0, $a0, -1
	mov.d f0, f1
	beqz $a0, fin
lazo: mul.d f0, f0, f1
	daddi $a0, $a0, -1
	bnez $a0, lazo
	j fin
uno: daddi $t1, $0 , 1
	mtc1 $t1, f0
	cvt.d.l f0, f0
fin: jr $ra