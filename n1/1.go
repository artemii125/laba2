package main

import (
    "fmt"
    "math"
)

// Функция для проверки простого числа
func smpl(n int) bool {
	if n < 2 {
        	return false
    	}
    	for i := 2; i <= int(math.Sqrt(float64(n))); i++ {
        	if n%i == 0 {
            	return false
        	}
    	}
    	return true
}

func main() {
    	var N int
    	fmt.Print("Введите число для определения разности между ним и ближайшим простым: ")
    	fmt.Scan(&N)
	if (N > 2){
	    	// Поиск ближайшего простого числа, меньшего или равного N
	    	smaller := N
	    	for !smpl(smaller) {
	        	smaller--
	    	}
	
	    	// Поиск ближайшего простого числа, большего или равного N
	    	larger := N
	    	for !smpl(larger) {
	        	larger++
	    	}
	
	    	// Сравнение расстояний и вывод результата
	    	if N-smaller <= larger-N {
	        	fmt.Println("Разность:", N-smaller)
	    	} else {
	        	fmt.Println("Разность:", larger-N)
	    	}
	}
	fmt.Println(N - 2)
}
