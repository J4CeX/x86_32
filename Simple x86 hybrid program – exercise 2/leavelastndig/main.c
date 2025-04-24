#include <stdio.h>
#include <stdlib.h>

char *leavelastndig(char *s, int n);

int main(int argc, char *argv[]) {
    if (argc == 3) {
        int n = atoi(argv[2]);
        printf("%s\n", leavelastndig(argv[1], n));
    }
    else {
        printf("%s\n", "Wrong argument number");
    }
    return 0;
}