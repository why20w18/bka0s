;bkaOs BOOTLOADER 0.2

mov ah,0eh ;0eh = 0x0e
mov al,'b'
int 0x10

mov ah,0x0e
mov al,'k'
int 0x10

mov ah,0x0e
mov al,'a'
int 10h

mov ah,0x0e
mov al,'O'
int 0x10

mov ah,0x0e
mov al,'s'
int 0x10

mov ah,0x0e
mov al,'!'
int 0x10
int 0x10 ;2 unlem al registeri hala deger tutuyor

times 510 - ($-$$) db 0
dw  0xaa55 ;magic number
