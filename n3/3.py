lst = list(map(str,input().split()))
amount = lst[1] # кол-во чисел
numbers = lst[1:] # список перебираемых чисел
odd = [] # список нечетных цифр
count = 0 # счетчик чисел
for i in numbers: 
    for i1 in range(len(i)):
        if int(i[i1]) % 2 == 1: # проверка на нечетность
            count += 1
    odd.append(count) # добавление кол-ва нечетных цифр в числе в список 
    count = 0  # обнуление счетчика дл перехода к следующему числу
print(odd)
