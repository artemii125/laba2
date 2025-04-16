<?php
// Функция для проверки, является ли число простым
function smpl($n) {
    if ($n < 2) return false;
    for ($i = 2; $i <= sqrt($n); $i++) {
        if ($n % $i == 0) return false;
    }
    return true;
}
echo "Введите число для определения разности между ним и ближайшим простым: ";
$N = intval(trim(fgets(STDIN)));

// Поиск ближайшего простого числа <= N
$smaller = $N;
while (!smpl($smaller)) $smaller--;

// Поиск ближайшего простого числа >= N
$larger = $N;
while (!smpl($larger)) $larger++;

// Сравнение расстояний и вывод результата
echo "Разность: " . min($N - $smaller, $larger - $N) . PHP_EOL;
?>
