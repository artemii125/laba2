<?php
echo "Введите количество чисел и желаемые числа: ";
$input = explode(" ", trim(fgets(STDIN)));
$amount = $input[0]; // количество чисел
$numbers = array_slice($input, 1); // список чисел

$odd = []; // список нечётных цифр
$count = 0; // счётчик нечётных цифр

// перебор чисел
foreach ($numbers as $num) {
    foreach (str_split($num) as $digit) {
        if ((int)$digit % 2 === 1) { // проверка на нечётность
            $count++;
        }
    }
    $odd[] = $count; // добавление в список
    $count = 0; // сброс счётчика
}

echo "Количество нечётных цифр в числах: " . implode(" ", $odd) . "\n";
?>
