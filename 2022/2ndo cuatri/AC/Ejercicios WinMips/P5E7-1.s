.data
numero: .word 23
tabla: .word 15, 13, 55, 336, 512, 1024, 2048, 24, 5, 1
fin: .word 0
resultado: .word 0

.text
daddi $a1, $0, tabla
daddi $t0, $0, fin
dsub $t1, $t0, $a1
daddi $t2, $0, 8
ddiv $a2, $t1, $t2   
lwu $a0, numero($0)
jal buscar
sd $v0, resultado($0)
halt

buscar: dadd $v0, $0, $0
lazo: lwu $t1, 0 ($a1) 
slt $t2, $a0, $t1
beqz $t2, dist
daddi $v0, $v0, 1
dist:  daddi $a1, $a1, 8
daddi $a2, $a2, -1
bnez $a2, lazo
fin: jr $ra