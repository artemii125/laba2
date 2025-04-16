cups = list(map(int, input().split())) # [полные, обмен]
drunk = cups[0] 
i = 0
full = 0
while cups[0] >= cups[1]:
	i += 1 # шаг опустошения
        full = cups[0] // cups[1] # обмен на полную банку
        i += 1 # шаг обмена
        empty = cups[0] % cups[1] # кол-во пустых банок
        drunk += full # кол-во выпитых
        cups[0] = full + empty
i += 1 # выпиваем оставшиеся     
print(drunk, i)
