    .globl bemboba
    .extern addl

bemboba:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp            

    movl    %edi, -4(%rbp)       
    movq    %rbx, -16(%rbp)      
    leaq    -20(%rbp), %rbx     
    movl    $0, -8(%rbp)         

.L_loop:
    movl    -8(%rbp), %eax       
    cmpl    $4, %eax
    jge     .L_done_loop

    movl    -4(%rbp), %edx       
    movl    %edx, (%rbx)         

    addq    $4, %rbx             
    addl    $1, -8(%rbp)         
    jmp     .L_loop

.L_done_loop:
    leaq    -20(%rbp), %rdi      
    movl    $4, %esi             
    call    addl                 

    movq    -16(%rbp), %rbx     
    leave
    ret

    .section .note.GNU-stack,"",@progbits
