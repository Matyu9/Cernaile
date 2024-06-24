cmake_minimum_required(VERSION 3.25)
project(Cernaile C ASM_NASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "-ffreestanding -O2 -Wall -Wextra")
set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -T ${CMAKE_SOURCE_DIR}/linker.ld")

# Define the output format for NASM
set(CMAKE_ASM_NASM_OBJECT_FORMAT bin)

# Define source files
set(SOURCES src/kernel.c src/boot.asm)

# Define the kernel binary
add_executable(kernel.bin ${SOURCES})

# Copy the binary file
add_custom_command(TARGET kernel.bin POST_BUILD
        COMMAND objcopy -O binary kernel.bin kernel.img
        COMMENT "Building kernel.img")
