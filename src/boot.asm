; boot.asm
BITS 16
ORG 0X7C00

start:
    ; Chargement du Kernel (un fichier binaire)
    mov ax, 0x07C0
    mov ds, ax
    mov si, hello
    call print_string
    cli
    hlt

print_string:
    mov ah, 0x0E
.loop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

hello db 'Hello, World! In Assembly!!', 0

TIMES 510-($-$$) db 0
DW 0xAA55