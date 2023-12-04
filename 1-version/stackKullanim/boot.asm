;bkaOs bootloader 0.2.2

mov ah,0x0e ;bios pencereye yazma hizmeti

mov bp,0x8000 ;0x7c00 adresinden uzakta stack segmenti sectik ust uste yazilmasin
mov sp,bp     ;stack bos oldugundan sp=top pointer ve bp=dip pointer esittir

push 's'
push 'O'
push 'a'
push 'k'
push 'b' ;en ustteki veriyi cekerek ilerleyecegiz bkaOs yazmasi bekleniyor

pop bx
mov al,bl ;mov al,bx 16 bitlik registere 8 bit atanamayacagindan hata verir
int 0x10  ;b degeri

pop bx
mov al,bl
int 10h ;k degeri

pop bx
mov al,bl 
int 10h ;a degeri

pop bx
mov al,bl
;mov al,byte ptr bl : Kullanimi hata verir
int 10h ;O degeri

pop bx
mov al,bl
int 0x10 ;s degeri

times 510-($-$$) db 0
dw 0xaa55 ;magic number bios burayi kontrol eder
