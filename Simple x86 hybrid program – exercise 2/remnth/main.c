#include <stdio.h>
#include <stdlib.h>

char *remnth(char *s, int n);

int main(int argc, char *argv[]) {
    if (argc == 3) {
        int n = atoi(argv[2]);
        printf("%s\n", remnth(argv[1], n));
    }
    else {
        printf("%s\n", "Wrong argument number");
    }
    return 0;
}