#include <iostream>
#include <cmath>
using namespace std;

// Функция для проверки, является ли число простым
bool smpl(int n) {
	for (int i = 2; i <= sqrt(n); i++) {
        	if (n % i == 0) return false;
    	}
    	return true;
}

int main() {
	int N;
    	cout << "Введите число для определения разности между ним и ближайшим простым: ";
    	cin >> N;
	if (N > 2){
	    	// Поиск ближайшего простого числа <= N
	    	int smaller = N;
	    	while (!smpl(smaller)) smaller--;
	
	    	// Поиск ближайшего простого числа >= N
	    	int larger = N;
	    	while (!smpl(larger)) larger++;
	
	    	// Сравнение расстояний и вывод результата
	    	if (N - smaller <= larger - N)
	        	cout << "Разность: " << N - smaller << endl;
	    	else
	        	cout << "Разность: " << larger - N << endl;
	}
	cout << N - 2
    	return 0;
}
