#include <ctype.h>
#include <stdio.h>

int string2num (char *s, int base) {
  int a = 0, v;
  for (; *s; s++) {
    if (isdigit(*s)) {
      v = *s - '0';
    } else {
      v = (*s - 'a') + 10;
    }
    a = a*base + v;
  }
  return a;
}

int main (void) {
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("z09b", 36));
  return 0;
}
