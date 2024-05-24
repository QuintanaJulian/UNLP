.data 
coorX:  .byte   24 
coorY:  .byte   24 
color:  .byte   255, 0, 255, 1 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
 
 
 
.text 
 
lwu $s6, CONTROL($zero) ; $s6 = dirección de CONTROL 
lwu $s7, DATA($zero) ; $s7 = dirección de DATA 




daddi $t1, $0, 2
daddi $t9, $0, 49
daddi $t0, $0, 8
daddi $t4, $0, 0

x_y: daddi $t1, $t1, -1

lazo: sd $t0, 0 ($s6)
lbu $a0, 0 ($s7)
slt $t2, $a0, $0
bnez $t2, lazo
slt $t3, $t9, $a0
bnez $t3, lazo
sd $a0, coorX ($t4)
daddi $t4, $0, 8
bnez $t1, x_y


daddi $t1, $0 , 4
dadd $t2, $0, $0
lazo2: sd $t0, 0 ($s6)
lbu $t3, 0 ($s7) 
sb $t3, color ($t2)
daddi $t2, $t2, 1
daddi $t1, $t1, -1
bnez $t1, lazo2



 
daddi $t0, $zero, 7 
sd $t0, 0($s6) 

lbu $s0, coorX($zero) 
sb $s0, 5($s7) 
lbu $s1, coorY($zero) 
sb $s1, 4($s7) 
lwu $s2, color($zero) 
sw $s2, 0($s7) 

daddi $t0, $zero, 5 
sd $t0, 0($s6) 
halt