package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	fmt.Print("Введите количество чисел и желаемые числа: ")

	scanner := bufio.NewScanner(os.Stdin) 
	scanner.Scan()
	input := scanner.Text() 

	parts := strings.Split(input, " ") // разбиваем строку на части

	numbers := parts[1:] // список перебираемых чисел (после первого элемента)
	oddCounts := []int{} // список количества нечётных цифр в каждом числе

	for _, numStr := range numbers { // перебор каждого числа
		count := 0 // счётчик нечётных цифр
		for _, ch := range numStr { // перебор каждой цифры числа
			digit, _ := strconv.Atoi(string(ch)) // преобразуем символ в число
			if digit%2 == 1 { // проверка на нечётность
				count++ // увеличиваем счётчик
			}
		}
		oddCounts = append(oddCounts, count)
	}

	fmt.Println("Количество нечётных цифр в числах:", oddCounts) 
}
