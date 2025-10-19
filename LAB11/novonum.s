/* Dicionario
    rdi  1º arg
    rsi  2º arg
    rax  retorno da função
*/ 

    .globl novonum
    .extern printf
    .extern scanf
 
novonum:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp         

    # printf("numero: ");
    leaq msg(%rip), %rdi    
    movl $0, %eax           
    call printf

    # scanf("%d", &minhalocal);
    leaq -4(%rbp), %rsi     
    leaq fmt(%rip), %rdi    
    movl $0, %eax
    call scanf

    # return minhalocal;
    movl -4(%rbp), %eax

    leave
    ret

    .section .rodata
msg: .string "numero: "
fmt: .string "%d"
