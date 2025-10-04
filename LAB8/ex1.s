/*
   Programa C original:
   #include <stdlib.h>
   int main() {
       system("ls -ls");
       return 0;
   }
*/

.data
s1:     .string "ls -ls"     /* string passada para system */

.text
.globl main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)     /* guarda rbx */
    movq    %r12, -16(%rbp)    /* guarda r12 */
/********************************************************/

    movq    $s1, %rdi          /* 1º parâmetro: endereço da string */
    movl    $0, %eax
    call    system             /* chama system("ls -ls") */

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
    movq    $0, %rax           /* rax = 0 (valor de retorno) */
    movq    -16(%rbp), %r12    /* recupera r12 */
    movq    -8(%rbp), %rbx     /* recupera rbx */
    leave
    ret
/***************************************************************/
