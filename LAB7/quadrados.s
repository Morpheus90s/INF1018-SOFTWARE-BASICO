/*
#include <stdio.h>

int main(void) {
    int i = 1;

    while (i <= 10) {
        printf("%d\n", i * i);
        i++;
    }

    return 0;
}
*/

.data
Sf:     .string "%d\n"

.text
.globl main
main:

/********************************************************/
/* prologo - não mexer */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)
    movq    %r12, -16(%rbp)
/********************************************************/

    movl    $1, %ebx        /* i = 1 */

WHILE_LOOP:
    cmpl    $10, %ebx       /* i <= 10 ? */
    jg      END_WHILE       /* se i > 10, sai do loop */

    movl    %ebx, %eax
    imull   %eax, %eax      /* eax = i*i */

    /*************************************************************/
    /* este trecho imprime o valor de %eax */
      movq    $Sf, %rdi    /* primeiro parametro (ponteiro) */
      movl    %eax, %esi   /* segundo parametro (inteiro) */
      movl  $0, %eax
      call  printf
    /*************************************************************/

    addl    $1, %ebx        /* i++ */
    jmp WHILE_LOOP

END_WHILE:
/**************************************************************/
/* finalizacao - não mexer */
    movq    $0, %rax
    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret
/***************************************************************/
