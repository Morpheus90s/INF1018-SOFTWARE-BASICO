/*
int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}
*/

/* DICIONÁRIO
  %rdi  → x ponteiro de struct
  %eax  → retorno da função
  %r12d → callee-saved
*/
.text
.globl add2

add2:
    pushq %rbp
    movq  %rsp, %rbp
    pushq %r12             # Salva R12

    cmpq  $0, %rdi
    je    base_case        

    # Caso Recursivo
    movl  (%rdi), %r12d    # Salva  %r12d
    
    movq  8(%rdi), %rdi    
    call  add2             # Chama add2
    
    addl  %r12d, %eax      
    jmp   end_func

base_case:
    movl  $0, %eax         

end_func:
    popq %r12              
    leave
    ret