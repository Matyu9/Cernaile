/* Constante pour le header du MultiBoot */
.set ALIGN,      1<<0              /* Aligner les modules chargés */
.set MEMINFO,    1<<1              /* Obtention de la memory map */
.set FLAGS,      ALIGN | MEMINFO   /* Variable pour le flag MultiBoot */
.set MAGIC,      0x1BADB002        /* 'magic number' pour que le bootloader trouve les headers */
.set CECKSUM,    -(MAGIC + FLAGS)  /* Checksum pour prouver le multiboot */


.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/*
    Stack Pointer Register (ESP)
*/

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB