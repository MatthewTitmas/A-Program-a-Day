'''
A program a day - Day 1
Initial program
18/04/2019
MTitmas
'''

import time
Start = time.time()

import random
for x in range(1000):
    LengthNumber = random.randint(1,100)
    if LengthNumber < 15:
        Length = 12
    elif LengthNumber < 45:
        Length = 16
    elif LengthNumber < 85:
        Length = 24
    else:
        Length = 32
    for i in range(Length):
        if random.randint(0,1) == 1:
            print("1", end = "")
        else:
            print("0", end = "")
    print(" ", end = "")

End = time.time()
print("This program took: ",round(End-Start,3),"s", sep = "")
