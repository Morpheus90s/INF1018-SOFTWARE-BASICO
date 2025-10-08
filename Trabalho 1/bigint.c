/* Pedro Augusto Beserra da Silva - 2321374 - Turma B */

#include "bigint.h"
#include <string.h>

static void big_clear(BigInt res) {
    memset(res, 0, NUM_BITS / 8);
}

void big_val(BigInt res, long val) {
    big_clear(res);
    int bytes = NUM_BITS / 8;
    int n = (int) sizeof(long);
    for (int i = 0; i < n && i < bytes; i++) {
        res[i] = (unsigned char)((val >> (8 * i)) & 0xFF);
    }

    unsigned char fill = (val < 0) ? 0xFF : 0x00;
    for (int i = n; i < bytes; i++) {
        res[i] = fill;
    }
}

void big_comp2(BigInt res, BigInt a) {
    int bytes = NUM_BITS / 8;
    BigInt tmp;
    for (int i = 0; i < bytes; i++)
        tmp[i] = (unsigned char)(~a[i]);

    unsigned int carry = 1;
    for (int i = 0; i < bytes; i++) {
        unsigned int sum = tmp[i] + carry;
        res[i] = (unsigned char)(sum & 0xFF);
        carry = (sum >> 8);
    }
}

void big_sum(BigInt res, BigInt a, BigInt b) {
    int bytes = NUM_BITS / 8;
    unsigned int carry = 0;
    for (int i = 0; i < bytes; i++) {
        unsigned int sum = (unsigned int)a[i] + (unsigned int)b[i] + carry;
        res[i] = (unsigned char)(sum & 0xFF);
        carry = (sum >> 8);
    }
}

void big_sub(BigInt res, BigInt a, BigInt b) {
    BigInt negb;
    big_comp2(negb, b);
    big_sum(res, a, negb);
}

void big_mul(BigInt res, BigInt a, BigInt b) {
    int bytes = NUM_BITS / 8;
    BigInt tmpA, tmpShift, sum;
    memcpy(tmpA, a, bytes);
    big_clear(res);

    for (int i = 0; i < NUM_BITS; i++) {
        int byte = i / 8, bit = i % 8;
        if (((b[byte] >> bit) & 1) != 0) {
    
            big_sum(sum, res, tmpA);
            memcpy(res, sum, bytes);
        }

        big_shl(tmpShift, tmpA, 1);
        memcpy(tmpA, tmpShift, bytes);
    }
}

void big_shl(BigInt res, BigInt a, int n) {
    int bytes = NUM_BITS / 8;
    if (n == 0) { memcpy(res, a, bytes); return; }
    big_clear(res);

    int byteShift = n / 8;
    int bitShift = n % 8;

    for (int i = bytes - 1; i >= 0; --i) {
        int src = i - byteShift;
        if (src < 0) continue;
        unsigned int v = ((unsigned int)a[src] << bitShift) & 0xFFu;
        unsigned char out = (unsigned char)(v & 0xFFu);
        if (bitShift != 0 && src - 1 >= 0) {
            out |= (unsigned char)((a[src - 1] >> (8 - bitShift)) & 0xFFu);
        }
        res[i] = out;
    }
}

void big_shr(BigInt res, BigInt a, int n) {
    int bytes = NUM_BITS / 8;
    if (n == 0) { memcpy(res, a, bytes); return; }
    big_clear(res);

    int byteShift = n / 8;
    int bitShift = n % 8;

    for (int i = 0; i + byteShift < bytes; ++i) {
        int src = i + byteShift;
        unsigned char out = (unsigned char)((a[src] >> bitShift) & 0xFFu);
        if (bitShift != 0 && src + 1 < bytes) {
            out |= (unsigned char)((a[src + 1] << (8 - bitShift)) & 0xFFu);
        }
        res[i] = out;
    }
}

void big_sar(BigInt res, BigInt a, int n) {
    int bytes = NUM_BITS / 8;
    if (n == 0) { memcpy(res, a, bytes); return; }

    BigInt tmp;
    
    big_shr(tmp, a, n);

    int sign_bit = (a[bytes - 1] & 0x80) ? 1 : 0;
    if (sign_bit) {
        
        for (int k = 0; k < n; ++k) {
            int pos = NUM_BITS - 1 - k;       
            int byte = pos / 8;
            int bit = pos % 8;
            tmp[byte] |= (unsigned char)(1u << bit);
        }
    }

    memcpy(res, tmp, bytes);
}