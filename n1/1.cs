using System;

class Program
{
    // Функция для проверки, является ли число простым
    static bool smpl(int n)
    {
        if (n < 2) return false;
        for (int i = 2; i <= Math.Sqrt(n); i++)
        {
            if (n % i == 0) return false;
        }
        return true;
    }

    static void Main()
    {
        Console.Write("Введите число для определения разности между ним и ближайшим простым: ");
        int N = int.Parse(Console.ReadLine());
        if (N > 2){
        // Поиск ближайшего простого числа <= N
        int smaller = N;
        while (!smpl(smaller)) smaller--;

        // Поиск ближайшего простого числа >= N
        int larger = N;
        while (!smpl(larger)) larger++;

        // Сравнение расстояний и вывод результата
        Console.WriteLine("Разность: " + Math.Min(N - smaller, larger - N));
        }
        Console.WriteLine("Разность: ", N - 2);
    }
}

