/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}
*/

/* DICIONÁRIO
   %rdi  *p 1º arg
   %esi   n 2º arg
   %ebx   i 
   %r12   salvar
   %eax   acumulador
   %rcx   i * 4
   %edx   a[i]
*/

    .text
    .globl foo
foo:

    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp        
    movq    %rbx, -8(%rbp)   
    movq    %r12, -16(%rbp)  

    movl    $0, %ebx         
    movq    %rdi, %r12       
    xorl    %eax, %eax       

L_loop:
    cmpl    %esi, %ebx      
    jge     L_end

    movslq  %ebx, %rcx       
    imulq   $4, %rcx         

    /* carregar a[i] */
    movl    (%r12,%rcx), %edx 

    /* s += a[i] */
    addl    %edx, %eax

    /* se a[i] == 0, então a[i] = s; s=0; */
    cmpl    $0, %edx
    jne     L_continue

    /* armazenar s em a[i] */
    movl    %eax, (%r12,%rcx)  
    xorl    %eax, %eax        

L_continue:
    addl    $1, %ebx          
    jmp     L_loop

L_end:

    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret