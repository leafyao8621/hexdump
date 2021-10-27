#include <stdio.h>

int main(void) {
    for (int in = getchar(); in != -1; in = getchar()) {
        printf("%02X\n", in);
    }
    return 0;
}
