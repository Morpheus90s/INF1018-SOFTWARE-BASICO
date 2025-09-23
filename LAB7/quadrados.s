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

/*
DICIONÁRIO
   %ebx   i         
   %eax   i*i  
   %rbp 
   %rsp  

*/

.data
Sf:     .string "%d\n"

.text
.globl main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rbx, -8(%rbp)
	movq	%r12, -16(%rbp)
/********************************************************/

    movl    $1, %ebx      

WHILE_LOOP:
    cmpl    $10, %ebx       
    jg      END_WHILE       /*  i > 10*/

    movl    %ebx, %eax
    imull   %eax, %eax      /* eax = i*i */

    /*************************************************************/
    /* este trecho imprime o valor de %eax */
      movq    $Sf, %rdi    /* primeiro parametro (ponteiro) */
      movl    %eax, %esi   /* segundo parametro (inteiro) */
      movl  $0, %eax
      call  printf
    /*************************************************************/

    addl    $1, %ebx
    jmp WHILE_LOOP

END_WHILE:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/
