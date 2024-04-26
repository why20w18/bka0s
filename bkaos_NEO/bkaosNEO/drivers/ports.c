//bkaOs_NEO hedef porttan veri okuma ve yazma

unsigned char port_byte_input(unsigned short portNO){
	
	//unsigned short portNO max 2^16-1 deger alir
	//portNO int'dir int=4byte short=2byte=16 bit
	
	unsigned char cikti;
	__asm__("in %%dx , %%al" : "=a"(cikti) : "d"(portNO));
	return cikti;
}

void port_byte_output(unsigned short portNO , unsigned char veri){
	//port numarasi ve veriyi arguman olarak alir
	//%% ile gosterilen registerlarda islemler soldan saga yapilir
	
	//cikti yukarida char tipindedir veriyide char olarak ayarladik
	__asm__("out %%al , %%dx" : : "a"(veri) , "d"(portNO));
	//al registerindaki veri degerini dx registerindaki portNO'ya yaz
}

unsigned short port_word_input(unsigned short portNO){

	unsigned short cikti;
	__asm__("in %%dx , %%ax" : "=a"(cikti) : "d"(portNO));
	return cikti; //cikti int tipinde

}

void port_word_output(unsigned short portNO , unsigned short veri){
	//veri int tipinde
	__asm__("out %%ax , %%dx" : : "a"(veri) , "d"(portNO));
}
