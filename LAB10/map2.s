/*
void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}
*/

/* DICIONÁRIO
 %rdi → um 
 %rsi → outro 
 %edx → n tamanho do loop
 %ecx → i 
*/
    .text
    .globl map2
map2:
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %ecx           # i = 0

for_loop:
    cmpl %edx, %ecx
    jge end_map2            # sai do loop
    
    movl (%rdi,%rcx,4), %edi   
    call f                     # Chama f()
    
    # outro[i] = retorno de f
    movl %eax, (%rsi,%rcx,4)   
    
    incl %ecx                   # i++
    jmp for_loop

end_map2:
    leave
    ret