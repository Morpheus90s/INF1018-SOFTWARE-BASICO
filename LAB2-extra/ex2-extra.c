#include <stdio.h>

void num2string(char *s, int num, int base) {
    const char digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
    int i = 0;

    if (num == 0) {
        s[0] = '0';
        s[1] = '\0';
        return;
    }

    while (num > 0) {
        s[i++] = digits[num % base];
        num /= base;
    }

    s[i] = '\0';

    for (int j = 0; j < i / 2; j++) {
        char temp = s[j];
        s[j] = s[i - j - 1];
        s[i - j - 1] = temp;
    }
}

int main() {
    char s[20];

    num2string(s, 255, 10);
    printf("%s\n", s);

    num2string(s, 255, 16);
    printf("%s\n", s);  

    num2string(s, 255, 2);
    printf("%s\n", s);  

    return 0;
}