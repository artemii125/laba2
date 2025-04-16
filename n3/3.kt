fun main() {
    print("Введите количество чисел и желаемые числа: ")
    val input = readLine()!!.split(" ")
    val amount = input[0].toInt() // кол-во чисел (не используется в алгоритме)
    val numbers = input.subList(1, input.size) // список чисел
    val odd = mutableListOf<Int>() // список для хранения количества нечетных цифр

    for (numStr in numbers) {
        var count = 0
        for (digitChar in numStr) {
            val digit = digitChar.toString().toInt()
            if (digit % 2 != 0) {
                count++
            }
        }
        odd.add(count)
    }

    println("Количество нечетных цифр в числах: $odd")
}
