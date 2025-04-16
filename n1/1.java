import kotlin.math.sqrt

// Функция для определения, является ли число простым
fun smpl(n: Int): Boolean {
    if (n < 2) return false
    for (i in 2..sqrt(n.toDouble()).toInt()) {
        if (n % i == 0) return false
    }
    return true
}

fun main() {
    print("Введите число для определения разности между ним и ближайшим простым: ")
    val N = readln().toInt()

    // Поиск ближайшего простого числа, меньшего или равного N
    var smaller = N
    while (!smpl(smaller)) smaller--

    // Поиск ближайшего простого числа, большего или равного N
    var larger = N
    while (!smpl(larger)) larger++

    // Сравнение расстояний и вывод результата
    if (N - smaller <= larger - N)
        println("Разность: ${N - smaller}")
    else
        println("Разность: ${larger - N}")
}
//
