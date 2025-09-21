/*
int nums[4] = {65, -105, 111, 34};
int main(void) {
    int i = 0, s = 0;

    while (i < 4) {
        s = s + nums[i];
        i++;
    }

    printf("soma = %d\n", s);
    return 0;
}
*/

.data
nums:   .long 65, -105, 111, 34
Sf:     .string "soma = %d\n"

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

    movl    $0, %ebx        /* i = 0 */
    movl    $0, %r12d       /* s = 0 */

WHILE:
    cmpl    $4, %ebx        /* enquanto i < 4 */
    jge     END

    movslq  %ebx, %rcx      /* rcx = i */
    imulq   $4, %rcx        /* rcx = i * sizeof(int) */
    movl    nums(%rcx), %eax
    addl    %eax, %r12d     /* s += nums[i] */

    addl    $1, %ebx         /* i++ */
    jmp WHILE

END:
    /*************************************************************/
    /* este trecho imprime o valor de %r12d (estraga %eax)  */
      movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
      movl    %r12d, %esi   /* segundo parametro  (inteiro) */
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
