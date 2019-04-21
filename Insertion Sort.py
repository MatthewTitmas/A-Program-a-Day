import time

def InsertionSort(List):
    Visible = input("Would you like to see each stage of the sort? (Y/N)\n").lower()
    Start = time.time()
    Step = 1
    for i in range(1,len(List)):
        OldValue = List[i]
        Value = List[i]
        Pos = i
        while Pos > 0 and List[Pos-1] > Value:
            List[Pos] = List[Pos-1]
            Pos -= 1
        List[Pos] = Value
        if List[i] != OldValue:
            Step += 1
            if Visible == "y":
               print("Step ",Step,": ",','.join(str(x) for x in List), sep = "")
    End = time.time()

    
    return List, End-Start
while True:
    ToBeSorted = input("Please enter a list of numbers you would like to be sorted. (Comma seperated)\n")
    try:
        List = [int(n) for n in ToBeSorted.split(",")]
    except:
        pass
    else:
        break



SortedList, TimeTaken = InsertionSort(List)
print("The sorted list is:\n",SortedList, sep = "")
print("This sort took",round(TimeTaken,2),"Seconds")
