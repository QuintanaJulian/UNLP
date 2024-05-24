.data
valor: .double 20.0
texto: .asciiz "El resultado es: "
CONTROL: .word 0x10000
DATA: .word 0x10008

.text
lwu $s0, CONTROL ($0)
lwu $s1, DATA ($0)

daddi $t0, $0, 8
sd $t0, 0 ($s0)
l.d f0, 0 ($s1)
l.d f1, valor ($0)

c.le.d f0, f1
bc1t division
sub.d f2, f0, f1
mul.d f3, f2, f0
j fin

division:
sub.d f2, f1, f0
div.d f3, f2, f0

fin: 
sd $t1, texto ($0)
sd $t1, 0 ($s1)
daddi $t0, $0, 4 
sd $t0, 0 ($s0)
daddi $t0, $0, 3 
s.d f3, 0 ($s1)
sd $t0, 0 ($s0)
halt