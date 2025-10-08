/* Pedro Augusto Beserra da Silva - 2321374 - Turma B */

#include "bigint.h"
#include <stdio.h>

void printBigInt(BigInt a) {
    for (int i = NUM_BITS/8 - 1; i >= 0; i--)
        printf("%02X", a[i]);
    printf("\n");
}

int main() {
    BigInt a, b, res;

    printf("Teste big_val:\n");
    big_val(a, 1);
    big_val(b, -2);
    printBigInt(a);
    printBigInt(b);

    printf("\nTeste big_comp2 (-a):\n");
    big_comp2(res, a);
    printBigInt(res);

    printf("\nTeste soma:\n");
    big_val(a, 5);
    big_val(b, 7);
    big_sum(res, a, b);
    printBigInt(res);

    printf("\nTeste subtração:\n");
    big_val(a, 10);
    big_val(b, 3);
    big_sub(res, a, b);
    printBigInt(res);

    printf("\nTeste multiplicação:\n");
    big_val(a, 6);
    big_val(b, 4);
    big_mul(res, a, b);
    printBigInt(res);

    printf("\nTeste deslocamentos:\n");
    big_shl(res, a, 1);
    printf("a << 1: "); printBigInt(res);
    big_shr(res, a, 1);
    printf("a >> 1: "); printBigInt(res);
    big_sar(res, a, 1);
    printf("a >> 1 (aritmético): "); printBigInt(res);

    return 0;
}