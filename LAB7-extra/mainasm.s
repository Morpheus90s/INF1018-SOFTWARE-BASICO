
    .data
Sf:     .string "%d\n"       # Formato para printf

    .text
    .globl main
    .extern dados            # dados é definido em dados.c

main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rbx, -8(%rbp)
	movq	%r12, -16(%rbp)
/********************************************************/

    movl    $0, %ebx         # i = 0
    movq    $dados, %r12     # p = &dados
    movl    $0, %r13d        # max = 0

L1:
    cmpl    $3, %ebx         # if (i < 3)?
    jge     L2               # se i >= 3, sai

    movzbl  (%r12), %eax     # eax = p->cc (char -> int)
    testl   %eax, %eax       # cc != 0 ?
    je      NEXT

    movl    4(%r12), %eax    # eax = p->ci
    cmpl    %r13d, %eax      # ci > max ?
    jle     NEXT
    movl    %eax, %r13d      # max = p->ci

NEXT:
    addq    $8, %r12         # p++ (struct tem 1+3(pad)+4 = 8 bytes)
    addl    $1, %ebx         # i++
    jmp     L1

L2:
/********************************************************/
/* Impressão do resultado                               */
    movq    $Sf, %rdi        # primeiro parâmetro
    movl    %r13d, %esi      # segundo parâmetro
    movl    $0, %eax
    call    printf
/********************************************************/

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
	movq	$Sf, %rdi	/* primeiro parametro (ponteiro)*/
	movl	%eax, %esi	/* segundo parametro  (inteiro) */
	call	printf		/* chama a funcao da biblioteca */
/*************************************************************/

/********************************************************/
/* Finalização - NÃO ALTERAR                            */
    movq    $0, %rax
    movq    -24(%rbp), %r13
    movq    -16(%rbp), %r12
    movq    -8(%rbp), %rbx
    leave
    ret
/********************************************************/
