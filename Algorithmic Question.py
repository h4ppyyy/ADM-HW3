d, sumHours = map(int, input().split())
minHours = []
maxHours = []

for i in range(d):
    min_i, max_i = map(int, input().split())
    minHours.append(min_i)
    maxHours.append(max_i)

remHours = sumHours - sum(minHours)

if sum(minHours) > sumHours:
    print("NO")
else:
    i = 0
    while remHours > 0:
        if minHours[i] < maxHours[i]:
            minHours[i] += 1
            remHours -= 1 
        else:
            i += 1

    print("YES")
    print(*minHours)
