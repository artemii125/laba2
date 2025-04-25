BITS 64 ;Используем 64-битный режим процессора

section .data ;Инициализированные данные
    prompt db "Введите количество чисел и сами числа через пробел: ", 0
    prompt_len equ $ - prompt ;Длина строки
    newline db 10 ;Символ новой строки

section .bss ;Секция неинициализированных данных
    buffer resb 256 ;Максимум символов
    odd_counts resb 128 ;Максимум чисел для массива
    digit_char resb 1 ;буфер для вывода 1 цифры

section .text ;Секция кода
    global _start

_start:
    ;Вызов ввода 
    mov eax, 4 ;Номер сстемного вызова write
    mov ebx, 1 ;Файловый дескриптор stdout
    mov ecx, prompt ;Указатель на строку для вывода
    mov edx, prompt_len ;Длина строки
    int 0x80 ;Прерывание

    ;Анализ ввода
    mov eax, 3 ;Номер системного вызова read
    mov ebx, 0 ;Файловый дескриптор stdin
    mov ecx, buffer ;Указатель на буфер для чтения
    mov edx, 256 ;Максимальное число байт для чтения
    int 0x80 ;Прерывание

    mov esi, buffer      ; текущий символ
    xor edi, edi         ; счётчик чисел
    xor ecx, ecx         ; общее количество чисел

    ; читаем первое число (amount)
    xor ebx, ebx ;ebx хранит число
.read_amount:
    mov al, [esi] ;Загрузка текущего символа
    cmp al, ' ' ;Проверка на пробел
    je .amount_done ;Если пробел - переход к следующему
    sub al, '0' ;Преобразование символа в число
    imul ebx, ebx, 10 ;Уножение на 10
    add bl, al ;Добавление новой цифры
    inc esi ;Переход к следующему 
    jmp .read_amount ;Повторение

.amount_done: 
    mov ecx, ebx ;Сохранение кол-ва чисел в ecx
    inc esi ;Пропуск пробела после кол-ва

; Основной цикл обработки чисел
.process_next_number: 
    cmp edi, ecx ;Проверка - обработаны ли все
    je .print_results ;Тогда вывод

    mov al, [esi] ;Проверка следующего символа
    cmp al, 10 ;Проверка на конец строки
    je .print_results ;Конец - вывод

    xor ebx, ebx ; ;Счетчик

.next_digit_number: ;Цикл обработки цифр в числе
    mov al, [esi] ;Загрузка текущего символа
    cmp al, 10 ;Проверка на конец строки
    je .number_done 
    cmp al, ' ' ;Проверка на пробел
    je .number_done
    sub al, '0' 
    cmp al, 9 ;Проверка что это цифра (0-9)
    ja .skip_char ;Если не цифра - пропуск
    and al, 1 ;Проверяем первый бит - четность
    cmp al, 1 ;Если 1 - цифра нечетная
    jne .skip_char ;Если четная - пропуск
    inc bl ;Увеличение счетчика

.skip_char: 
    inc esi ;Переход к следующему символу
    jmp .next_digit_number ;Продолжение обработки числа

.number_done:
    mov [odd_counts + edi], bl ;Сохраняем результат
    inc edi ;Увеличение счетчика
    inc esi ;Пропуск пробела после числа
    jmp .process_next_number ;Обработка следующего числа

.print_results: ;Вывод результата
    xor esi, esi ;Сброс идекса для вывода

.print_loop: 
    cmp esi, edi ;Проверка выведен ли весь результат
    je .exit ;Да - выход

    mov al, [odd_counts + esi] 
    add al, '0' ;Преоброзование цифу в символ
    mov [digit_char], al 

    ; Вывод цифры
    mov eax, 4 
    mov ebx, 1
    mov ecx, digit_char
    mov edx, 1
    int 0x80 

    ; Выводим перевод строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    inc esi ;Переход к следующующему результату 
    jmp .print_loop ;Продолжение вывода

;Завершение программы
.exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
