using System;
class Program {
    static void Main() {
        Console.Write("Введите кол-во полных банок и эквивалент обмена: ");
        string[] input = Console.ReadLine().Split();
        int[] cups = { int.Parse(input[0]), int.Parse(input[1]) };

        int drunk = cups[0]; // изначально выпито
        int i = 0;           // счётчик шагов
        int full = 0;        // результат обмена
        if (cups[0] < 1)  return;
        // пока можно обменивать
        while (cups[0] >= cups[1]) {
            i += 1; // опустошаем
            full = cups[0] / cups[1]; // обмен
            i += 1;
            int empty = cups[0] % cups[1]; // остаток
            drunk += full;
            cups[0] = full + empty; // обновление
        }
        i += 1; // допиваем
        Console.WriteLine("Выпито банок и кол-во итераций: " + drunk + " " + i);
    }
}
