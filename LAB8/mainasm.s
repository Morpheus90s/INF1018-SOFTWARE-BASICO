/*
   #include <stdio.h>
   #define LIM 1

   int filtro(int x, int lim);

   int nums[5] = {3,-5,7,8,-2};

   int main() {
       int i;
       int *p = nums;
       for (i = 0; i < 5; i++) {
           printf("%d\n", filtro(*p, LIM));
           p++;
       }
       return 0;
   }
*/

/* DICIONÁRIO
   %rbx  i
   %r12 *p
   %rdi  printf
   %rsi  argumento da função
   %rax  retorno de funções
*/

.data
nums:   .int 3, -5, 7, 8, -2     
s1:     .string "%d\n"           

.text
.globl main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)      /* guarda rbx */
    movq    %r12, -16(%rbp)     /* guarda r12 */
/********************************************************/

    movl    $0, %ebx           
    movq    $nums, %r12       

L1:
    cmpl    $5, %ebx           
    jge     FIM

    movl    (%r12), %edi      
    movl    $1, %esi           
    call    filtro             

    movq    $s1, %rdi          
    movl    %eax, %esi         
    movl    $0, %eax
    call    printf

    addq    $4, %r12           
    incl    %ebx              
    jmp     L1

FIM:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
    movq    $0, %rax           /* rax = 0 (valor de retorno) */
    movq    -16(%rbp), %r12    /* recupera r12 */
    movq    -8(%rbp), %rbx     /* recupera rbx */
    leave
    ret
/***************************************************************/
