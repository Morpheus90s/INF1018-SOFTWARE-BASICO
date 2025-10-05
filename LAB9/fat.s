/* 
int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}
*/

/* DICIONÁRIO
   %edi  n
   %eax  retorno
   %edx  temporário
*/

    .text
    .globl fat

fat:
                                        
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp       
    movq    %rbx, -8(%rbp)
    movq    %r12, -16(%rbp)
 
    cmpl    $0, %edi        
    je      fat_base

    movl    %edi, -4(%rbp)  
    subl    $1, %edi        
    call    fat             

    movl    -4(%rbp), %edx  
    imull   %edx, %eax      
    jmp     fat_end

fat_base:
    movl    $1, %eax       

fat_end:
    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret