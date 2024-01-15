;bootMain.asm  bka0s


[org 0x7c00]

;printte bx registerindeki karakterleri donguye sokup ekrana basmistik stringimizi
;bu registera atayacagiz


mov bx,OsAcilisYazisi
call printYazdir ;bootPrint icindeki fonksiyonu cagirdik


call printYeniSatir


mov bx,OsKapanisYazisi
call printYazdir

;sonsuz bekleme
jmp $



;bootPrint.asm dosyasini include etme fonk kullanmak icin
%include "bootPrint.asm"



OsAcilisYazisi:
db 'bkaOs Calismaya Basladi',0


OsKapanisYazisi:
db 'bkaOs Kapatiliyor',0



;Sonucta bu bir bootloader ve magic number koymamiz 510 byte doldurmamiz gerekiyor
times 510-($-$$) db 0
dw 0xaa55
