/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    printf("%d\n", *p);
  return 0;
}

*/

/*
	DICIONÁRIO
	ebx   i         
	eax  *p    
*/

.data
nums:	.byte	10, -21, -30, 45
Sf:	.string "%d\n"

.text
.globl	main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rbx, -8(%rbp)
	movq	%r12, -16(%rbp)
/********************************************************/

	movl	$0, %ebx
	movq	$nums, %r12	

L1:
	cmpl	$4, %ebx	/* if */
	je	L2		

	movsbl	(%r12), %eax	/* estende o byte do *p */

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
	movq	$Sf, %rdi	/* primeiro parametro (ponteiro)*/
	movl	%eax, %esi	/* segundo parametro  (inteiro) */
	call	printf		/* chama a funcao da biblioteca */
/*************************************************************/

	addl	$1, %ebx	
	addq	$1, %r12	
	jmp	L1		

L2:	
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq	$0, %rax	/* rax = 0  (valor de retorno) */
	movq	-8(%rbp), %rbx
	movq	-16(%rbp), %r12
	leave
	ret		
/***************************************************************/