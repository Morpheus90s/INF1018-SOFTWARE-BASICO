#include <stdio.h>

int is_little() {
    unsigned int x = 13;
    unsigned char *p = (unsigned char*)&x;
    return p[0] == 13;
}

int main() {
    if (is_little())
        printf("Memoria little-endian\n");
    else
        printf("Memoria big-endian\n");
    return 0;
}
