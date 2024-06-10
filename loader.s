.section .multiboot
    .long 0x1BADB002         # Multiboot header magic number
    .long 0                   # Flags (unused)
    .long -(0x1BADB002 + 0)   # Checksum (magic + flags)

.section .text
.extern kernelMain
.global loader

loader:
    mov $kernel_stack, %esp

    # Set up the parameters for calling kernelMain
    mov $0, %eax              # Multiboot structure address (not used here)
    mov $0x2BADB002, %ebx     # Magic number

    call kernelMain

_stop:
    cli
    hlt
    jmp _stop

.section .bss
    .space 2*1024*1024
kernel_stack:

