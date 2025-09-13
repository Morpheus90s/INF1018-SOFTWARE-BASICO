#include <stdio.h>

void dump(void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%02x ", *p1);
    p1++;
  }
  printf("\n");
}

struct X {
  int a;
  short b;
  int c;
};

int main(void) {
  int i, j;
  short a[2][3];
  int b[2];

  for (i = 0; i < 2; i++) {
    b[i] = i;
    for (j = 0; j < 3; j++)
      a[i][j] = 3*i + j;
  }

  printf("sizeof(char)=%zu short=%zu int=%zu long=%zu\n",
         sizeof(char), sizeof(short), sizeof(int), sizeof(long));

  printf("\nArray b (int b[2]) - tamanho %zu bytes:\n", sizeof(b));
  dump(b, sizeof(b));

  printf("\nArray a (short a[2][3]) - tamanho %zu bytes:\n", sizeof(a));
  dump(a, sizeof(a));

  struct X x = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};
  printf("\nstruct X sizeof=%zu bytes\n", sizeof(x));
  dump(&x, sizeof(x));

  return 0;
}