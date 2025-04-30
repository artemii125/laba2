use std::io;

// Функция для проверки, является ли число простым
fn smpl(n: i32) -> bool {
    if n < 2 {
        return false;
    }
    for i in 2..=((n as f64).sqrt() as i32) {
        if n % i == 0 {
            return false;
        }
    }
    true
}

fn main() {
    println!("Введите число для определения разности между ним и ближайшим простым:");

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let N: i32 = input.trim().parse().unwrap();

    if N > 2 {
        // Поиск ближайшего простого числа <= N
        let mut smaller = N;
        while !smpl(smaller) {
            smaller -= 1;
        }

        // Поиск ближайшего простого числа >= N
        let mut larger = N;
        while !smpl(larger) {
            larger += 1;
        }

        // Сравнение расстояний и вывод результата
        let diff = (N - smaller).abs().min((larger - N).abs());
        println!("Разность: {}", diff);
    } else {
        println!("Разность: {}", N - 2);
    }
}
