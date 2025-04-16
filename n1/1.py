#Функция для нахождения простого числа
def smpl(n):
    if n < 2:
        return 0
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return 0
    return 1

N = int(input())

#Поиск ближайшего простого числа, меньшего или равного N
smaller = N
while not smpl(smaller):
    smaller -= 1

#Поиск ближайшего простого числа большего N
larger = N
while not smpl(larger):
    larger += 1

#Сравнивнение расстояния
if (N - smaller) <= (larger - N):
    print(N - smaller)
else:
    print(larger - N)
python code
