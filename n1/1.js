// Функция для проверки простого числа
function smpl(n) {
    if (n < 2) return false;
    for (let i = 2; i <= Math.sqrt(n); i++) {
        if (n % i === 0) return false;
    }
    return true;
}

const readline = require('readline');
const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
rl.question("Введите число для определения разности между ним и ближайшим простым: ", (input) => {
    const N = parseInt(input);
    if (N > 2){
        // Поиск ближайшего простого числа <= N
        let smaller = N;
        while (!smpl(smaller)) smaller--;
    
        // Поиск ближайшего простого числа >= N
        let larger = N;
        while (!smpl(larger)) larger++;
    
        // Сравнение расстояний и вывод
        console.log("Разность:", Math.min(N - smaller, larger - N));
    }
    console.log("Разность:", N - 2);
    rl.close();
    
});
