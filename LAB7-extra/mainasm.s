/* DICIONÁRIO 
    ebx    i      
    r12    *p       
    r13d   max   
    eax   = temporário
    dados  = array de structs 
*/

.data
Sf:     .string "%d\n"       /* formato printf para inteiro */
Sf2:    .string "\n"         /* segunda string de formato para printf */

.text
.globl main
.extern dados        

main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp) /* guarda r12 */
/********************************************************/

    movl    $0, %ebx           
    movq    $dados, %r12        /* p = &dados */
    movl    $0, %r13d         

L1:
    cmpl    $3, %ebx            /* while */
    jge     L2                 

    movzbl  (%r12), %eax        /* eax = p->cc*/
    testl   %eax, %eax          /* cc != 0 */
    je      NEXT               

    movl    4(%r12), %eax      
    cmpl    %r13d, %eax       
    jle     NEXT                
    movl    %eax, %r13d        

NEXT:
    addq    $8, %r12           
    addl    $1, %ebx           
    jmp     L1

L2:
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)       */
  movq    $Sf, %rdi            /* primeiro parametro (ponteiro)*/
  movl    %r13d, %esi          /* segundo parametro (inteiro) */
  movl  $0, %eax
  call  printf                 /* chama a funcao da biblioteca */
/*************************************************************/

/*************************************************************/
/* este trecho imprime o \n (estraga %eax)                  */
  movq    $Sf2, %rdi           /* primeiro parametro (ponteiro)*/
  movl  $0, %eax
  call  printf                 /* chama a funcao da biblioteca */
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax               /* rax = 0  (valor de retorno) */
  movq  -16(%rbp), %r12        /* recupera r12 */
  movq  -8(%rbp), %rbx         /* recupera rbx */
  leave
  ret      
/***************************************************************/
