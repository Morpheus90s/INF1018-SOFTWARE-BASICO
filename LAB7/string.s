/*
char S2[] = {65,108,111,32,123,103,97,108,101,114,97,125,33,0};
int main(void) {
  char *pc = S2;
  while (*pc) {
    if (*pc != '{' && *pc != '}') 
      printf("%c", *pc);  
    pc++;
  }
  printf("\n"); 
  return 0;
}
*/

/*
DICIONÁRIO
S2      Array global 
Sf      String
Sf2      "\n"
%r12    *pc
*/

.data
S2:     .byte 65,108,111,32,123,103,97,108,101,114,97,125,33,0
Sf:     .string "%c"   /* string de formato para printf */
Sf2:    .string "\n"   /* string de formato para printf */

.text
.globl main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)
    movq    %r12, -16(%rbp)
/********************************************************/

    movq    $S2, %r12 

L1:
    cmpb    $0, (%r12)
    je      L2

    movsbl  (%r12), %eax 
    cmpb    $123, %al
    je      SKIP
    cmpb    $125, %al
    je      SKIP

    /*************************************************************/
    /* este trecho imprime o valor de %eax (estraga %eax)  */
      movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
      movl    %eax, %esi   /* segundo parametro  (inteiro) */
      movl  $0, %eax
      call  printf       /* chama a funcao da biblioteca */
    /*************************************************************/

SKIP:
    addq    $1, %r12
    jmp     L1

L2:
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
    movq    $0, %rax
    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret
/***************************************************************/
