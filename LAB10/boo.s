/*
void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}
*/

/* DICIONÁRIO
 %rdi → px (ponteiro para struct X)
 %esi → n (contador do loop)
 %edx → val (valor constante)
 %rbx → px (cópia de %rdi, callee-saved)
 Argumentos para f: %edi, %esi
*/

.text
.globl boo

boo:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx              # Salva RBX
    
    movq %rdi, %rbx         # RBX = px

loop:
    testl %esi, %esi        # Checa
    jle end_boo             # sai do loop
    decl %esi               # n--

    movl (%rbx), %edi       # 1º arg
    movl %edx, %esi         # 2º arg
    call f                  # Chama f()
    
    movl %eax, 4(%rbx)      # retorno de f
    
    addq $8, %rbx           # px++
    jmp loop

end_boo:
    popq %rbx               # Restaura RBX
    leave
    ret