void test1_entrypoint() {
}

void test2_entrypoint() {
}

void test3_entrypoint() {
}

void mainNEO() {
    char* video_memoryVGA = (char*) 0xb8000;
    *video_memoryVGA = "VGAVGAVGA";
}
