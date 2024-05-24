 
.data 
texto: .asciiz "Hola, Mundo!"  ; El mensaje a mostrar
CONTROL: .word32 0x10000
DATA: .word32 0x10008
 
 
 
.text 
jal INSERT_CHAR

lwu $s0, DATA($zero) ; $s0 = dirección de DATA 
daddi $t0, $zero, texto ; $t0 = dirección del mensaje a mostrar 
sd $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje 

lwu $s1, CONTROL($zero) ; $s1 = dirección de CONTROL 
daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla 

daddi $t0, $zero, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII 
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje 
halt 

INSERT_CHAR: daddi $t0, $0, 9
	lwu $t2, CONTROL ($0)
	lwu $t3, DATA ($0)
	sd $t0, 0($t2)
	lbu $t0, 0 ($t3)
	sb $t0, texto ($0)
	jr $ra 