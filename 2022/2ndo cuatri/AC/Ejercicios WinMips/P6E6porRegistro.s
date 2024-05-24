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

x_y: daddi $t1, $t1, -1
dadd $s0, $s1, $0

lazo: sd $t0, 0 ($s6)
lbu $s1, 0 ($s7)
slt $t2, $s1, $0
bnez $t2, lazo
slt $t3, $t9, $s1
bnez $t3, lazo

bnez $t1, x_y


daddi $t1, $0 , 4
dadd $t3, $0, $0
lazo2: sd $t0, 0 ($s6)
lbu $t2, 0 ($s7) 
dsllv $t2, $t2, $t3
dadd $s2, $s2, $t2
daddi $t1, $t1, -1
daddi $t3, $t3, 8
bnez $t1, lazo2



 
daddi $t0, $zero, 7 
sd $t0, 0($s6) 

 

sb $s0, 5($s7) 

sb $s1, 4($s7)  

sw $s2, 0($s7) 

daddi $t0, $zero, 5 
sd $t0, 0($s6) 
halt