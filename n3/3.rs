use std::io;
fn main() {
    println!("Введите количество чисел и желаемые числа: ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    // Преобразуем ввод в вектор
    let input: Vec<&str> = input.trim().split_whitespace().collect();
    let amount: usize = input[0].parse().unwrap();
    let numbers = &input[1..];

    let mut odd = Vec::new(); // список нечётных цифр
    let mut count = 0; // счётчик нечётных цифр

    // перебор чисел
    for num in numbers {
        for digit in num.chars() {
            if digit.to_digit(10).unwrap() % 2 == 1 { // проверка на нечётность
                count += 1;
            }
        }
        odd.push(count); // добавляем количество нечётных цифр
        count = 0; // сброс счётчика
    }
    println!("Количество нечётных цифр в числах: {:?}", odd);
}
