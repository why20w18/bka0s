#include "../drivers/ports.h"

void fakeFonksiyon() {
	//entrypointi fake fonksiyon
	//ileri atti
}

void mainNEO() {
/*
    char* video_memory = (char*) 0xb8000;
    *video_memory = 'X';
*/	
			//portNO,veri
	port_byte_output(0x3d4,14);
	
	int konum = port_byte_input(0x3d5);
	konum = konum << 8; //bitwise 8 bit sola kaydirdik
	
	port_byte_output(0x3d4,15);
	konum = konum + port_byte_input(0x3d5);

	int vga_adresi_dinamik = konum *2;
	
	char *vga_bellegi = 0xb8000;
	
	vga_bellegi[vga_adresi_dinamik] = 'W';
	vga_bellegi[vga_adresi_dinamik+1] = 0x0f; //beyaz imlec siyah arkaplan
						  //switch.asm'de VGA color palet
						  //kismindakinin aynisi
		
    
    }
