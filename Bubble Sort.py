import time

def BubbleSort(List):
    Visible = input("Would you like to see each stage of the sort? (Y/N)\n").lower()
    Start = time.time()
    Step = 0
    for x in range(len(List)):
        for i in range(len(List)-1):
            if List[i] > List[i+1]:
                Step += 1
                Temp = List[i+1]
                List[i+1] = List[i]
                List[i] = Temp
                if Visible == "y":
                    print("Step ",Step,": ",','.join(str(x) for x in List), sep = "")

    End = time.time()
    return ','.join(str(x) for x in List), End-Start

while True:
    ToBeSorted = input("Please enter a list of numbers you would like to be sorted. (Comma seperated)\n")
    try:
        List = [int(n) for n in ToBeSorted.split(",")]
    except:
        pass
    else:
        break



SortedList, TimeTaken = BubbleSort(List)
print("The sorted list is:\n",SortedList, sep = "")
print("This sort took",round(TimeTaken,2),"Seconds")
