const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите количество чисел и желаемые числа: ", (line) => {
    const lst = line.split(' ');
    const amount = parseInt(lst[0]); // количество чисел
    const numbers = lst.slice(1); // список чисел
    let odd = []; // список нечётных цифр
    let count = 0; // счётчик нечётных цифр

    for (let i of numbers) { // перебор чисел
        for (let i1 of i) { // перебор цифр числа
            if (parseInt(i1) % 2 === 1) { // проверка на нечётность
                count += 1;
            }
        }
        odd.push(count); // добавление количества нечётных цифр
        count = 0; // сброс счётчика
    }

    console.log("Количество нечётных цифр в числах:", odd);
    rl.close();
});
