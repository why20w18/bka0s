[bits 32]

VIDEO_MEMORY equ 0xb8000
BEYAZ_RENK equ 0x0f
YESIL_RENK equ 0x02
MAVI_RENK equ 0x01
KOYU_MAVI_RENK equ 0x68

yazPM:

pusha
mov edx, VIDEO_MEMORY

yazPM_loop:

mov al, [ebx] 
mov ah, YESIL_RENK
cmp al, 0 
je yazPMbitisBOOL
mov [edx], ax
add ebx, 1 
add edx, 2
jmp yazPM_loop

yazPMbitisBOOL:

popa
ret
