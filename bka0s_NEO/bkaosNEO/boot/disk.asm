;bka0s_NEO SEKTOR OKUMA

disk_yukle:

pusha
push dx ;main.asm uzerin dx ile diske yukleme yapilacaktir

mov ah,0x02
mov al,dh   ;okunacak sektor sayisi
mov cl,0x02 ;okunmaya hangi sektorden baslanacak
mov ch,0x00 ;cylinder no
mov dh,0x00 ;0 ve 1 floppy disk , 0x80 ve 0x81 hdd
	    ;mov dl,0x00 drive no
int 0x13    ;bios kesmesi


jc disk_hatasi
pop dx
cmp al,dh   ;main.asm'den dh kac sektor okunacagini girer
jne sektor_hatasi
popa
ret

disk_hatasi:
mov bx,DISK_HATA_MESAJ
call yaz
call yenis
mov dh,ah  ;hata mesaji ah'dadir dh'a atadik

jmp disk_sonsuz_dongu

sektor_hatasi:
mov bx,SEKTOR_HATA_MESAJ
call yaz

disk_sonsuz_dongu:
jmp $

DISK_HATA_MESAJ: db "bka0s_NEO: Disk okuma hatasi !",0
SEKTOR_HATA_MESAJ: db "bkaos_NEO: Okunan sektor sayisi hatasi !",0

