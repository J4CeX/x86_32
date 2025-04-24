#include <stdio.h>

char *rmspc(char *s);

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++)
        printf("%s\n", rmspc(argv[i]));
}