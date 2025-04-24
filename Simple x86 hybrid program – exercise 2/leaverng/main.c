#include <stdio.h>

char *leaverng(char *s, char a, char b);

int main(int argc, char *argv[]) {
    if (argc == 4) {
        printf("%s\n", leaverng(argv[1], argv[2][0], argv[3][0]));
    }
    else {
        printf("%s\n", "Wrong argument number");
    }
    return 0;
}