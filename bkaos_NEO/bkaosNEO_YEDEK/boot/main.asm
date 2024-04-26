;bka0s_NEO bootloader 

[org 0x7c00]              
KERNEL_OFFSET equ 0x1000 ;kernel adresi

mov [BOOT_DRIVE] , dl

;stack
mov bp, 0x9000
mov sp, bp


mov bx,bkaosREAL
call yaz
call yenis

call kernel_yukle

;switch islemi real ve protected arasinda
call switchPM
jmp $

%include "print.asm"       ;versiyon-2'deki fonksiyonumuz
%include "gdt.asm"         ;GDT'yi dahil ettik
%include "switch.asm"
%include "VGAprint.asm"
%include "disk.asm"


;kernel diskten okunacaktir
[bits 16]
kernel_yukle:
mov bx,bkaosKERNEL
call yaz
call yenis

mov bx,KERNEL_OFFSET;0x1000'den oku ve sakla
mov dh,2	    ;okunacak sektor sayisi 0x01 boot 0x02'de kernel vardir
mov dl,[BOOT_DRIVE] ;driver no
call disk_yukle
ret


;registerlar adinda e on ekini aldi
[bits 32]

START_PROTECTED:
mov ebx,bkaosPROTECTED
call yazPM
call KERNEL_OFFSET ;tum kontrol artik kernelde
jmp $

BOOT_DRIVE db 0 
bkaosREAL db "bka0s_NEO 16 bitlik REAL MODDA CALISIYOR",0
bkaosPROTECTED db "bka0s_NEO 32 bitlik PROTECTED MODDA CALISIYOR",0
bkaosKERNEL db "bka0s_NEO Kerneli ana bellege yukleniyor",0

;ilk sektor boot sektoru
times 510 - ($-$$) db 0
dw 0xaa55
