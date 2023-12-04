;bkaOS BOOTLOADER 0.3


mov ah,0x0e ;0eh

mov al,"1"
int 0x10

;1'den sonraki degeri bastirmadi
mov al,ramdeki_degerim
int 0x10

;2'den sonraki degeri bastirmadi
mov al,"2"
int 0x10

mov al,[ramdeki_degerim]
int 10h

;3'den sonraki degeri bastirdi , baslangic adresini ekledik uzerine
mov al,"3"
int 0x10

mov bx,ramdeki_degerim
add bx,0x07c00
mov al,[bx]
int 10h

;bootuc dosyasi bu satirlar arasinda kalan kodu icermez-----------------------------
;4'den sonraki deger
mov al,"4"
int 0x10

mov al,[0x7c42] ;7c42 adresindeki ram degerini getir
int 0x10
;bootuc dosyasi bu satirlar arasinda kalan kodu icermez-----------------------------
jmp $

ramdeki_degerim:
	db "B" ;0x42 ascii degeri
	       ;xxd ile bellek adresini kontrol edip 4. olarak eklyecegim
	       ;42 cikti

times 510-($-$$) db 0 
dw 0xaa55 ;magic number
