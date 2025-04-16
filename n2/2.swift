import Foundation
print("Введите кол-во полных банок и эквивалент обмена: ", terminator: "")
if let line = readLine() {
   var cups = line.split(separator: " ").map { Int($0)! } // [полные, обмен]
    var drunk = cups[0] // изначально выпито
    var i = 0           // счётчик шагов
    var full: Int       // сколько полных банок в обмене

    // пока можно обменивать
    while cups[0] >= cups[1] {
        i += 1
        full = cups[0] / cups[1] // обмен
        i += 1
        let empty = cups[0] % cups[1] // остаток пустых
        drunk += full
        cups[0] = full + empty // обновляем банки
    }

    i += 1 // допиваем
    print("Выпито банок и кол-во итераций: \(drunk) \(i)")
}
