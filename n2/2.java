import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите кол-во полных банок и эквивалент обмена: ");
        int[] cups = { sc.nextInt(), sc.nextInt() };

        int drunk = cups[0]; // начальное количество выпитых банок
        int i = 0; // счётчик итераций
        int full = 0; // количество банок, полученных при обмене

        // пока можно обменять пустые банки на полные
        while (cups[0] >= cups[1]) {
            i += 1; // шаг: опустошение банок
            full = cups[0] / cups[1]; // обмен: сколько полных получаем
            i += 1; // шаг: сам обмен
            int empty = cups[0] % cups[1]; // остаток банок, которые не удалось обменять
            drunk += full; // прибавляем полученные к выпитым
            cups[0] = full + empty; // обновляем количество банок (новые + оставшиеся)
        }

        i += 1; // шаг: выпиваем всё, что осталось
        System.out.println("Выпито банок и кол-во итераций: " + drunk + " " + i);
    }
}
