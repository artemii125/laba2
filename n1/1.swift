import Foundation

// Проверка простого числа
func smpl(_ n: Int) -> Bool {
    if n < 2 { return false }
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    return true
}
print("Введите число для определения разности между ним и ближайшим простым:", terminator: " ")
if let line = readLine(), let N = Int(line) {

    // Поиск ближайшего простого числа <= N
    var smaller = N
    while !smpl(smaller) { smaller -= 1 }

    // Поиск ближайшего простого числа >= N
    var larger = N
    while !smpl(larger) { larger += 1 }

    // Вывод результата
    print("Разность:", min(N - smaller, larger - N))
}
//
