#include <unistd.h>

unsigned long long buf[1];
unsigned long long tmp[1];

int main(void) {
    for (; read(0, buf, 1);) {
        *tmp = *buf;
        *buf >>= 4;
        if (*buf < 10) {
            *buf += '0';
        } else {
            *buf -= 10;
            *buf += 'A';
        }
        write(1, buf, 1);

        *buf = *tmp;
        *buf &= 0xf;
        if (*buf < 10) {
            *buf += '0';
        } else {
            *buf -= 10;
            *buf += 'A';
        }
        write(1, buf, 1);

        *buf = 10;
        write(1, buf, 1);
    }
}
