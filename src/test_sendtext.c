#include "xaut.h"
#include <stdio.h>

int main(int argc, char** argv) {
    if (argc < 3) return 1;
    
    char* id_text;
    char* send_text;
    if (strcmp(argv[1], "--v") == 0) {
        if (argc < 4) return 1;
        extra_verbose(1);
        id_text = argv[2];
        send_text = argv[3];
    } else {
        id_text = argv[1];
        send_text = argv[2];
    }

    Window winid = atoi(id_text);
        
    if(activate_window(winid)) {
        sleep(1);
        type(send_text);
        return 0;
    }    
    return 1;
}