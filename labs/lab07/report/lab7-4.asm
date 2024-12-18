%include 'in_out.asm'

SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
rem: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax

    cmp edi, 3
    je calculate_3x

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax

    add esi, 1
    mov edi, esi
    jmp output_result

calculate_3x:
    mov eax, edi
    imul eax, 3
    mov edi, eax

output_result:
    mov eax, rem
    call sprint
    mov eax, edi
    call iprintLF
    call quit
