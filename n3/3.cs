using System;
using System.Collections.Generic;

class Program {
    static void Main() {
        Console.Write("Введите количество чисел и желаемые числа: ");
        string[] input = Console.ReadLine().Split();
        int amount = int.Parse(input[0]); // количество чисел
        string[] numbers = new string[amount];
        Array.Copy(input, 1, numbers, 0, amount);

        List<int> odd = new List<int>(); // список нечётных цифр
        int count = 0; // счётчик нечётных цифр

        // перебор чисел
        foreach (string num in numbers) {
            foreach (char digit in num) {
                if ((digit - '0') % 2 == 1) { // проверка на нечётность
                    count++;
                }
            }
            odd.Add(count); // добавление количества нечётных цифр
            count = 0; // сброс счётчика
        }
        Console.Write("Количество нечётных цифр в числах: ");
        foreach (int i in odd) {
            Console.Write(i + " ");
        }
        Console.WriteLine();
    }
}
