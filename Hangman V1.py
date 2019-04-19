'''
A program a day - Day 2
Initial program
19/04/2019
MTitmas
'''

def Stage0():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |        ")
    print(" |         ")
    print(" |         ")
    print(" |         ")
    print(" |         ")
    print(" |_________ \n")
def Stage1():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |         ")
    print(" |         ")
    print(" |         ")
    print(" |         ")
    print(" |_________ \n")
    pass

def Stage2():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |      |  ")
    print(" |      |  ")
    print(" |         ")
    print(" |         ")
    print(" |_________ \n")

def Stage3():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |      |\ ")
    print(" |      |  ")
    print(" |         ")
    print(" |         ")
    print(" |_________ \n")

def Stage4():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |     /|\ ")
    print(" |      |  ")
    print(" |         ")
    print(" |         ")
    print(" |_________ \n")

def Stage5():
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |     /|\ ")
    print(" |      |  ")
    print(" |       \ ")
    print(" |         ")
    print(" |_________ \n")

def Stage6(CurrentGuess, Word):
    print("\nCurrent board:")
    print(" _________ ")
    print(" |      | ")
    print(" |      O ")
    print(" |     /|\ ")
    print(" |      |  ")
    print(" |     / \ ")
    print(" |         ")
    print(" |_________ \n")
    print("You did not guess the word:", Word)
    CurrentGuess = " "
    return CurrentGuess





import random
while True:
    Stage = 0
    PossibleWords = ("extent","discreet","wrong","aloof","polite","marathon","carriage","wound","trail","communication","violation","wife","dead","remember","few","acquit","youth","lie","microphone","general","product","roof","pin","enjoy","want","rock","coincidence","pilot","investment","agent")
    Word = PossibleWords[random.randint(0,len(PossibleWords)-1)]
    CurrentGuess = ""
    GuessedLetters = []
    for x in range(len(Word)): CurrentGuess += "_ "
    print(CurrentGuess, "\n")
    while "_" in CurrentGuess:
        print("What letter would you like to guess?")
        CurrentLetter = input("").lower()
        if CurrentLetter in GuessedLetters: print("You have already guessed this letter.")
        else:
            GuessedLetters.append(CurrentLetter)
            if CurrentLetter in Word:
                CorrectLocations = []
                for i, j in enumerate(Word):
                    if CurrentLetter == j:
                        CorrectLocations.append(i)
                CurrentGuess = CurrentGuess.split(" ")
                for i in CorrectLocations:
                    CurrentGuess[i] = CurrentLetter
                CurrentGuess = " ".join(CurrentGuess)
                
            else:
                Stage += 1
        print(CurrentGuess)
        if Stage == 0:
            Stage0()
        elif Stage == 1:
            Stage1()
        elif Stage == 2:
            Stage2()
        elif Stage == 3:
            Stage3()
        elif Stage == 4:
            Stage4()
        elif Stage == 5:
            Stage5()
        else:
            CurrentGuess = Stage6(CurrentGuess, Word)
    if CurrentGuess != " ": print("You guessed the correct word!")
    print("Would you like another game?")
    Answer = input("").lower()
    if Answer != "yes":
        break
    print("\n")
