#include <stdio.h>

// Em Ass não fazemos nada com  o include (por enquanto)

/* Dicionario
Reg  Var 
rbx  pc
eax  temp

*/

.data #Vareaveis globais e strings constante
#char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};

S2: .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf: .string %c

.text #segmento do  cod 
#int main (void) {

.globl main

main:

#char *pc = S2;

#char *pc;
#pc = S2;

movq $2, rbx //'q' porque é um sistema de 64 bits

WHILE:
#while (*pc){
  cmpb $0, (%rbx) //lembrar que qnd comparamos os elementos invertemos as ordens
  je FORA_WHILE

//printf ("%c", *pc++);
  #temp = *pc;
  movsbl (%rbx), %eax

  printf("%c", temp);
  
  
  
  pc++;
  incq %erbx
#}
jmp WHILE

printf("\n");
  return 0;
}
