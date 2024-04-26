void fakeFonksiyon() {
	//entrypointi fake fonksiyon
	//ileri atti
}

void mainNEO() {

    char* video_memory = (char*) 0xb8000;
    *video_memory = 'X';
}
