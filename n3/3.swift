import Foundation
print("Введите количество чисел и желаемые числа: ", terminator: "")
if let line = readLine() {
    let parts = line.split(separator: " ").map { String($0) }
    let numbers = parts[1..<parts.count] // все числа после первого
    var oddCounts: [Int] = []
    // перебор чисел
    for num in numbers {
        var count = 0
        for ch in num { // перебор цифр в числе
            if let digit = Int(String(ch)), digit % 2 == 1 { // проверка на нечетность
                count += 1
            }
        }
        oddCounts.append(count)
    }
    print("Количество нечётных цифр в числах:", terminator: " ")
    for count in oddCounts {
        print(count, terminator: " ")
    }
}
