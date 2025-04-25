import * as readline from 'readline';

const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout
});

rl.question("Введите кол-во полных банок и эквивалент обмена: ", (input) => {
	if (!input.trim()) {
		console.error("Нет ввода");
		rl.close();
		return;
	}	
	const cups = input.trim().split(/\s+/).map(Number);
    
	let drunk = cups[0];
	let i = 0;

	while (cups[0] >= cups[1]) {
		i++; // шаг опустошения
		const full = Math.floor(cups[0] / cups[1]); // полные банки после обмена
		i++; // шаг обмена
		drunk += full; // увеличиваем счётчик выпитых
		cups[0] = full + (cups[0] % cups[1]); // новые полные + оставшиеся пустые
	}

	i++; // финальное опустошение
	console.log(`Выпито банок и кол-во итераций: ${drunk} ${i}`);
    
	rl.close();
});
