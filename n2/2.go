package main
import (
  "fmt"
)
func main() {
  var cups [2]int
  fmt.Print("Введите кол-во полных банок и эквивалент обмена: ")
  fmt.Scan(&cups[0], &cups[1])

  drunk := cups[0]
  i := 0
  full := 0
  if cups[0] < 1 {
      // Пока можно обменивать
      for cups[0] >= cups[1] {
        i += 1 // шаг опустошения
        full = cups[0] / cups[1] // сколько новых банок получаем
        i += 1 // шаг обмена
        empty := cups[0] % cups[1] // остаток пустых
        drunk += full // пьем новые банки
        cups[0] = full + empty // снова перерабатываем
      }
      i += 1 // последняя итерация (выпиваем остатки)
      fmt.Printf("Выпито банок и кол-во итераций: %d %d\n", drunk, i)
  }
      
}
