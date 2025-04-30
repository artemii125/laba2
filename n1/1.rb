# Проверка простого числа
def smpl(n)
  return false if n < 2
  (2..Math.sqrt(n)).each { |i| return false if n % i == 0 }
  true
end
print "Введите число для определения разности между ним и ближайшим простым: "
N = gets.to_i
if N > 2
  # Поиск ближайшего простого числа <= N
  smaller = N
  smaller -= 1 until smpl(smaller)
  
  # Поиск ближайшего простого числа >= N
  larger = N
  larger += 1 until smpl(larger)
  
  # Вывод разности
  puts "Разность: #{[(N - smaller), (larger - N)].min}"
else
  puts "Разность: #{N - 2}"
end
