#include "xaut.h"
#include <stdio.h>

int main(int argc, char** argv) {
    if (argc < 2) return 1;
    
    char* title;
    if (strcmp(argv[1], "--v") == 0) {
        if (argc < 3) return 1;
        extra_verbose(1);
        title = argv[2];
    } else title = argv[1];
        
    Window ret = find_window(title);
    printf("%lu\n", *(unsigned long*)&ret);
    return 0;
}