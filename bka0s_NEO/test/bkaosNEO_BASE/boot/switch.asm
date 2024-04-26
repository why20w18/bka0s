[bits 16]

switchPM:

cli
lgdt [gdtb_describe]
mov eax, cr0
or eax, 0x1 
mov cr0, eax
jmp CODE_SEG:init_pm

[bits 32]

init_pm:         ;32 bit komut setini kullanmaya basladik

mov ax, DATA_SEG ;segment registerlarini guncelliyoruz
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ebp, 0x90000 
mov esp, ebp

call START_PROTECTED
