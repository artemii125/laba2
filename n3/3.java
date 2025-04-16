import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите количество чисел и желаемые числа: ");
        String input = sc.nextLine();  // считываем всю строку

        // Разделяем ввод на части
        String[] inputs = input.split(" ");
        int amount = Integer.parseInt(inputs[0]); // количество чисел
        String[] numbers = new String[amount];
        
        // Заполняем массив числами
        for (int i = 0; i < amount; i++) {
            numbers[i] = inputs[i + 1];
        }

        // Для хранения количества нечётных цифр
        int[] oddCounts = new int[amount];
        
        // Перебор чисел
        for (int i = 0; i < amount; i++) {
            int count = 0;
            for (char digit : numbers[i].toCharArray()) {
                if (Character.getNumericValue(digit) % 2 == 1) { // проверка на нечётность
                    count++;
                }
            }
            oddCounts[i] = count; // сохраняем количество нечётных цифр для каждого числа
        }

        System.out.print("Количество нечётных цифр в числах: ");
        for (int i = 0; i < oddCounts.length; i++) {
            System.out.print(oddCounts[i] + " ");
        }
        System.out.println();
    }
}
