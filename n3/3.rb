print "Введите количество чисел и желаемые числа: "
input = gets.split.map(&:to_i)

amount = input[0] # количество чисел
numbers = input[1..] # список чисел

odd = [] # список нечётных цифр
count = 0 # счётчик нечётных цифр

# перебор чисел
numbers.each do |num|
  num.to_s.each_char do |digit|
    if digit.to_i % 2 == 1 # проверка на нечётность
      count += 1
    end
  end
  odd << count # добавляем в список
  count = 0 # сброс счётчика
end

puts "Количество нечётных цифр в числах: #{odd.join(' ')}"
#
