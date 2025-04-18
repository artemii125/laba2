BITS 64

section .data
    prompt db "Введите количество чисел и сами числа через пробел: ", 0
    prompt_len equ $ - prompt
    newline db 10

section .bss
    buffer resb 256
    odd_counts resb 128
    digit_char resb 1

section .text
    global _start

_start:
    ; write(1, prompt, prompt_len)
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; read(0, buffer, 256)
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 256
    int 0x80

    mov esi, buffer      ; текущий символ
    xor edi, edi         ; счётчик чисел
    xor ecx, ecx         ; общее количество чисел

    ; читаем первое число (amount)
    xor ebx, ebx
.read_amount:
    mov al, [esi]
    cmp al, ' '
    je .amount_done
    sub al, '0'
    imul ebx, ebx, 10
    add bl, al
    inc esi
    jmp .read_amount

.amount_done:
    mov ecx, ebx
    inc esi

.process_next_number:
    cmp edi, ecx
    je .print_results

    mov al, [esi]
    cmp al, 10
    je .print_results

    xor ebx, ebx

.next_digit_number:
    mov al, [esi]
    cmp al, 10
    je .number_done
    cmp al, ' '
    je .number_done
    sub al, '0'
    cmp al, 9
    ja .skip_char
    and al, 1
    cmp al, 1
    jne .skip_char
    inc bl

.skip_char:
    inc esi
    jmp .next_digit_number

.number_done:
    mov [odd_counts + edi], bl
    inc edi
    inc esi
    jmp .process_next_number

.print_results:
    xor esi, esi

.print_loop:
    cmp esi, edi
    je .exit

    mov al, [odd_counts + esi]
    add al, '0'
    mov [digit_char], al

    ; write(1, digit_char, 1)
    mov eax, 4
    mov ebx, 1
    mov ecx, digit_char
    mov edx, 1
    int 0x80

    ; write(1, newline, 1)
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    inc esi
    jmp .print_loop

.exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
