#include <iostream>
using namespace std;

int main() {
    int cups[2];
    cout << "Введите кол-во полных банок и эквивалент обмена: ";
    cin >> cups[0] >> cups[1];

    int drunk = cups[0]; // изначально выпито
    int i = 0; // счётчик шагов
    int full = 0; // сколько новых банок получено

    // пока можно совершать обмен
    while (cups[0] >= cups[1]) {
        i += 1; // шаг: опустошили
        full = cups[0] / cups[1]; // обмен
        i += 1;
        int empty = cups[0] % cups[1]; // остаток пустых
        drunk += full;
        cups[0] = full + empty; // обновляем
    }

    i += 1; // шаг: допили остатки
    cout << "Выпито банок и кол-во итераций: " << drunk << " " << i << endl;
    return 0;
}
//
