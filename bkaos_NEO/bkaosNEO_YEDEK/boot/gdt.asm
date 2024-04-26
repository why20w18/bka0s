;bka0s_NEO Global Descriptor Tables 

gdtb_start:

;baslangic icin 8 bytelik sifir
dd 0x0
dd 0x0


;data segmenti
gdtb_data:

dw 0xffff ;16 bitlik ilk segmentin uzunlugu(adresi)
dw 0x0 ;base baslangic adresi(uzunlugu)
db 0x0 ;8 bit ikinci segment base

;flagler
db 10010010b
db 11001111b

db 0x0 ;8bit ucuncu segment base


;code segmenti
gdtb_code:

dw 0xffff
dw 0x0
db 0x0

db 10011010b 
db 11001111b

db 0x0

gdtb_end:



gdtb_describe:
;global table describe

dw gdtb_end - gdtb_start -1
dd gdtb_start

DATA_SEG equ gdtb_data - gdtb_start
CODE_SEG equ gdtb_code - gdtb_start
