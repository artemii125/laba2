#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main() {
    int amount;
    cout << "Введите количество чисел и желаемые числа: ";
    cin >> amount;

    vector<string> numbers(amount);
    for (int i = 0; i < amount; i++) {
        cin >> numbers[i];
    }

    vector<int> odd; // список нечётных цифр
    int count = 0;   // счётчик нечётных цифр

    // перебор чисел
    for (string num : numbers) {
        for (char digit : num) {
            if ((digit - '0') % 2 == 1) { // проверка на нечётность
                count++;
            }
        }
        odd.push_back(count); // добавление в список
        count = 0; // сброс счётчика
    }

    cout << "Количество нечётных цифр в числах: ";
    for (int i : odd) {
        cout << i << " ";
    }
    cout << endl;
    return 0;
}
