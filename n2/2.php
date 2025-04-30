<?php
echo "Введите кол-во полных банок и эквивалент обмена: ";
$cups = array_map('intval', explode(" ", trim(fgets(STDIN))));

$drunk = $cups[0]; // изначально выпито
$i = 0;            // счётчик шагов
$full = 0;         // количество банок после обмена
if ($cups[0] > 1){
    // пока можно менять
    while ($cups[0] >= $cups[1]) {
        $i += 1; // шаг: опустошили
        $full = intdiv($cups[0], $cups[1]); // обмен
        $i += 1;
        $empty = $cups[0] % $cups[1]; // остаток
        $drunk += $full;
        $cups[0] = $full + $empty; // обновляем запас
    }
    
    $i += 1; // допиваем всё
    echo "Выпито банок и кол-во итераций: $drunk $i\n";
}
?>
