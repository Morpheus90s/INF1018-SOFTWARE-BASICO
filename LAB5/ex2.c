#include <stdio.h>

void dump(void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%02x ", *p1);
    p1++;
  }
  printf("\n");
}

struct X1 { char c1; int i; char c2; };
struct X2 { long l; char c; };
struct X3 { int i; char c1; char c2; };
struct X4 { struct X2 x; char c; };
struct X5 { char c1; char c2; char c3; };
struct X6 { short s1; int i; char c[3]; short s2; };
union U1 { int i; char c[5]; };
union U2 { short s; char c[5]; };

int main(void) {
  printf("sizeof(char)=%zu short=%zu int=%zu long=%zu\n\n",
         sizeof(char), sizeof(short), sizeof(int), sizeof(long));

  struct X1 x1 = { 0x11, 0x22222222, 0x33 };
  printf("X1 sizeof=%zu dump: ", sizeof(x1)); dump(&x1, sizeof(x1));

  struct X2 x2 = { (long)0x0102030405060708ULL, 0x12 };
  printf("X2 sizeof=%zu dump: ", sizeof(x2)); dump(&x2, sizeof(x2));

  struct X3 x3 = { 0x33333333, 0x44, 0x55 };
  printf("X3 sizeof=%zu dump: ", sizeof(x3)); dump(&x3, sizeof(x3));

  struct X4 x4 = { { (long)0x0605040302010000ULL, 0x66 }, 0x77 };
  printf("X4 sizeof=%zu dump: ", sizeof(x4)); dump(&x4, sizeof(x4));

  struct X5 x5 = { 0x11, 0x22, 0x33 };
  printf("X5 sizeof=%zu dump: ", sizeof(x5)); dump(&x5, sizeof(x5));

  struct X6 x6 = { 0x4444, 0x55555555, {0x61,0x62,0x63}, 0x6666 };
  printf("X6 sizeof=%zu dump: ", sizeof(x6)); dump(&x6, sizeof(x6));

  union U1 u1;
  u1.i = 0x0a0b0c0d;
  printf("U1 sizeof=%zu dump: ", sizeof(u1)); dump(&u1, sizeof(u1));

  union U2 u2;
  u2.s = 0x0e0f;
  printf("U2 sizeof=%zu dump: ", sizeof(u2)); dump(&u2, sizeof(u2));

  return 0;
}
