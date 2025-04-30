use std::io;

fn main() {
    // Ввод данных
    println!("Введите кол-во полных банок и эквивалент обмена:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let mut cups: Vec<i32> = input.split_whitespace().map(|s| s.parse().unwrap()).collect();

    let mut drunk = cups[0]; // уже выпито
    let mut i = 0; // счётчик шагов
    let mut full; // получаемые в обмене полные банки
    if cups[0] > 0{
        // Пока есть возможность обменивать
        while cups[0] >= cups[1] {
            i += 1; // шаг: опустошаем банки
            full = cups[0] / cups[1]; // шаг: получаем полные банки
            i += 1; // шаг: обмен выполнен
            let empty = cups[0] % cups[1]; // остаток пустых
            drunk += full; // прибавляем к выпитому
            cups[0] = full + empty; // обновляем запас
        }
    
        i += 1; // шаг: выпиваем остатки
        println!("Выпито банок и кол-во итераций: {} {}", drunk, i);
    }
}
