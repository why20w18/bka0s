;bkaOs
;bootPrint.asm

printYazdir:
pusha


start:

mov al,[bx]
cmp al,0
je done

;eger dongu bozulmadiysa

mov ah,0x0e ;tty hizmeti=video hizmetini istedim
int 10h ;bios kesmesini cagirdim SeaBIOS


done:
popa
ret
;printYazdir fonksiyonun sonu

printYeniSatir:

pusha


mov ah,0x0e ;hizmet istedik tty icin
mov al,0x0a ;imleci asagi indirdik \n 0x0a = hexa degeri linefeed
int 10h ;bios komutu isledi

mov al,0x0d ;\r carriage return hexa olarak al registerina atandi
int 10h


popa
ret
;printYeniSatir fonksiyonun sonu



