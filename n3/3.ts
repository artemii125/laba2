import * as readline from 'readline';
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
rl.question('Введите числа через пробел: ', (input: string) => {
    const lst: string[] = input.trim().split(/\s+/);
    
    //Получаем только числа (игнорируем первый элемент если нужно)
    const numbers: string[] = lst.slice(1);
    
    //Массив для результатов
    const odd: number[] = [];
    let count: number = 0;

    //Подсчет нечетных цифр в каждом числе
    for (const num of numbers) {
        for (const char of num) {
            if (parseInt(char) % 2 === 1) {
                count++;
            }
        }
        odd.push(count);
        count = 0;
    }

    console.log('Количество нечетных цифр:', odd);
    rl.close();
});
