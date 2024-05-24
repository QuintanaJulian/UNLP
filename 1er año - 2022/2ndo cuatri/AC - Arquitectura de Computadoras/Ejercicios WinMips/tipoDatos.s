 
.data 
n1: .double 9.13 
n2: .double 6.58 
res1: .double 0.0
res2: .double 2.5, 3.9
hola: .word 0x0123456789abcdef
hola2: .byte 99
hola3: .word32 0x0123456789
p: .ascii "Hola"
p2: .asciiz "Hola"
 
.code 
l.d   f1, n1(r0) 
l.d   f2, n2(r0) 
add.d  f3, f2, f1 
mul.d  f4, f2, f1 
s.d   f3, res1(r0) 
s.d   f4, res2(r0) 
halt 