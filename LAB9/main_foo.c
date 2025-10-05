#include <stdio.h>

void foo(int a[], int n);

int main(void) {
    int a[5] = {1, 2, 0, 3, 0};
    int i;
    foo(a, 5);
    for (i=0; i<5; i++)
        printf("%d ", a[i]);
    printf("\n");
    return 0;
}
