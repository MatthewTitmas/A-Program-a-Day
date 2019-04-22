ListToSearch = [94,88,-83,-72,-66,-91,-97,88,-18,-95,27,70,-66,-90,86,-11,-85,-55,-71,-70,-28,8,60,-11,-36,-18,-71,-26,84,-80,-25,-20,-83,-43,-49,-88,49,81,30,-49,-23,-72,68,18,65,83,29,7,8,61,24,-90,-81,-77,100,-80,-71,11,-34,-91,-94,77,-71,-79,-51,-12,40,-38,47,-94,-28,-91,15,73,-3,-100,-32,38,88,75,-95,23,-68,63,33,98,-29,-8,-89,43,-41,89,45,-76,-64,82,37,-47,-69,7]

def LinearSearch(List,WantedNumber):
    Found = False
    for i,x in enumerate(List):
        if x == WantedNumber:
            print(WantedNumber,"found at position",i+1)
            Found = True
    if Found == False:
        print(WantedNumber,"is not in the list")
    
def BinarySearch(List,WantedNumber,Length,BottomPosition):
    if Length > BottomPosition:
        Mid = int(Length + (BottomPosition-1)/2)
        if WantedNumber == List[Mid]:
            print(WantedNumber,"found at position",Mid+1)
        else:
            if WantedNumber < List[Mid]:
                BinarySearch(List,WantedNumber,Mid-1,0)
            else:
                BinarySearch(List,WantedNumber,Length,Mid+1)
    else:
        print(WantedNumber,"is not in the list")
            


while True:
    try:
        WantedNumber = int(input("What number would you like to search for?\n"))
    except:
        pass
    else:
        break

while True:
    Answer = input("What searching algorithm would you like to use? (Linear or Binary)\n").lower()
    if Answer == "linear":
        LinearSearch(ListToSearch,WantedNumber)
        break
    elif Answer == "binary":
        ListToSearch.sort()
        BinarySearch(ListToSearch,WantedNumber,len(ListToSearch)-1,0)
        break
    
