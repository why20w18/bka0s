;bkaOs BOOTLOADER 0.1

times 510-($-$$) db 0 ;510 byte
dw 0xaa55 ;2 byte imza defined word
