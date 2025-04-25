import * as readline from 'readline';

// Создаем интерфейс для ввода/вывода
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Функция для проверки простого числа
function smpl(n: number): boolean {
    if (n < 2) return false;
    for (let i = 2; i <= Math.sqrt(n); i++) {
        if (n % i === 0) return false;
    }
    return true;
}

rl.question("Число для определения разности этого числа и ближайшего простого : ", (input) => {
    const N = parseInt(input.trim());
    
    if (isNaN(N)) {
        console.error("Нет ввода");
        rl.close();
        return;
    }

    // Поиск ближайшего простого числа ≤ N
    let smaller = N;
    while (!smpl(smaller)) {
        smaller--;
        if (smaller < 2) break; // Простые числа начинаются с 2
    }

    // Поиск ближайшего простого числа ≥ N
	let larger = N;
	while (!smpl(larger)) {
		larger++;
	}

	// Сравнение расстояний
	const distanceToSmaller = N - smaller;
	const distanceToLarger = larger - N;
    
	// Вывод минимального расстояния
	console.log(Math.min(distanceToSmaller, distanceToLarger));
    
	rl.close();
});
