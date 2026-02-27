.global __hard_reset
.global stack_start  
.global lab1
.syntax unified

// Визначаємо константи для розрахунку
#define VAL_A #4
#define VAL_B #3
#define VAL_C #2

.section .text

__hard_reset:
    b lab1

lab1:
    // 1. Завантажуємо значення змінних у регістри
    mov r0, VAL_A      // r0 = a
    mov r1, VAL_B      // r1 = b
    mov r2, VAL_C      // r2 = c

    // 2. Обчислюємо (a * b) для умови
    mul r3, r0, r1      // r3 = a * b

    // 3. Перевірка умови (a * b) >= 10
    cmp r3, #10
    
    ite ge              // If-Then-Else блок
    orrge r4, r0, r1    // Якщо >= 10: r4 = (a | b)
    mullt r4, r0, r1    // Якщо < 10:  r4 = (a * b)

    // 4. Множимо результат на c
    mul r0, r4, r2      // r0 = r4 * c (Кінцевий результат)

_loop:
    b _loop             // Нескінченний цикл, щоб програма не вилетіла
