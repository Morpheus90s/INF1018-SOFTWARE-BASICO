/*
int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}
*/

/* DICIONÁRIO
  %rdi → x ponteiro para struct
  %eax → a soma
  0(%rdi) → x->val int 4 bytes
  8(%rdi) → x->next ponteiro
*/
.text
.globl add

add:
  pushq %rbp
  movq %rsp, %rbp
  movl $0, %eax        # Inicializa a = 0 

loop:
  cmpq $0, %rdi        #x == NULL?
  je end_add           # sai do loop
    
  addl (%rdi), %eax    
  movq 8(%rdi), %rdi   
  jmp loop

end_add:
  leave
  ret