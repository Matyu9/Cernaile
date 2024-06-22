cmake_minimum_required(VERSION 3.28)
project(Cernaile C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "-ffreestanding -O2 -Wall -Wextra")
set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -T linker.ld")

# Définir le binaire du Kernel
add_executable(kernel.bin src/kernel.c src/boot.asm)

# Copier le fichier biaire
add_custom_command(TARGET kernel.bin POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary kernel.bin kernel.img
    COMMENT "Building kernel.img")
