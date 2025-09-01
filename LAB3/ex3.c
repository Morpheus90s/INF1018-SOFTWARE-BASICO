#include <stdio.h>

unsigned char switch_byte(unsigned char x) {
    return ((x & 0xF0) >> 4) | ((x & 0x0F) << 4);
}

unsigned char rotate_left(unsigned char x, int n) {
    return ((x << n) | (x >> (8 - n))) & 0xFF;
}

int main() {
    unsigned char a = 0xAB;
    printf("switch_byte(%02X) = %02X\n", a, switch_byte(a));

    unsigned char b = 0x61;
    printf("rotate_left(%02X,1) = %02X\n", b, rotate_left(b,1));
    printf("rotate_left(%02X,2) = %02X\n", b, rotate_left(b,2));
    printf("rotate_left(%02X,7) = %02X\n", b, rotate_left(b,7));

    return 0;
}
