timer equ 10h
PIC equ 20h
int0 equ 24h
PIO equ 30h
HAND equ 40h

org 2000
  cli
  mov ax, 11111111b
  mov pio + 2, ax
  mov ax, 0h
  mov pio + 3, ax
  sti  
lazo IN al, pio
  OUT pio + 1, al; 
  jmp lazo
HLT
END
