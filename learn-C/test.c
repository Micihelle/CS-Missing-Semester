#include <stdio.h>

void crash() {
    int *p = NULL;
    *p = 42;  // 故意解引用空指针，触发崩溃
}

int main() {
    crash();
    return 0;
}

