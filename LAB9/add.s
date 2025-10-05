/* 
int add (int a, int b, int c) {
  return a+b+c;
}
*/

/* DICIONÁRIO
   %edi   a  1º argumento
   %esi   b  2º argumento
   %edx   c  3º argumento
   %eax   retorno
*/

    .text
    .globl add

add:
                                              
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)      
    movq    %r12, -16(%rbp)     

    movl    %edi, %eax     
    addl    %esi, %eax      
    addl    %edx, %eax      

    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret