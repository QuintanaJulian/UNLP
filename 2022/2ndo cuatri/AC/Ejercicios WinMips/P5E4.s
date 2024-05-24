.data
peso: .double 65.9
estatura: .double 1.75
IMC: .double 0
class: .double 18.5, 25, 30
estado: .word 0

.text
l.d f0, peso ($0)
l.d f1, estatura ($0)
jal calculo
s.d f3, IMC ($0)
jal catalogar
sb $v0, estado ($0)
halt


calculo: mul.d f2, f1, f1
div.d f3, f0, f2
jr $ra

catalogar: dadd $v0 , $0, $0
dadd $t0, $0, $0
daddi $t1, $0, 4
lazo: beq $v0, $t1, fin
l.d f4,  class ($t0)	
c.lt.d f3, f4
daddi $t0, $t0, 8
daddi $v0, $v0, 1
bc1f lazo
fin: jr $ra		