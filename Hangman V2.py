'''
A program a day - Day 2
Final program
19/04/2019
MTitmas
'''

import random

class NewBoard(object):
    def Stage0(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |        ")
        print(" |         ")
        print(" |         ")
        print(" |         ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage1(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |         ")
        print(" |         ")
        print(" |         ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage2(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |      |  ")
        print(" |      |  ")
        print(" |         ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage3(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |      |\ ")
        print(" |      |  ")
        print(" |         ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage4(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |     /|\ ")
        print(" |      |  ")
        print(" |         ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage5(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |     /|\ ")
        print(" |      |  ")
        print(" |       \ ")
        print(" |         ")
        print(" |_________ \n")
        
    def Stage6(Self):
        print("\nCurrent board:")
        print(" _________ ")
        print(" |      | ")
        print(" |      O ")
        print(" |     /|\ ")
        print(" |      |  ")
        print(" |     / \ ")
        print(" |         ")
        print(" |_________ \n")


class NewGame(object):
    def __init__(Self):
        Self.PossibleWords = ("extent","discreet","wrong","aloof","polite","marathon","carriage","wound","trail","communication","violation","wife","dead","remember","few","acquit","youth","lie","microphone","general","product","roof","pin","enjoy","want","rock","coincidence","pilot","investment","agent")
        Self.Word = Self.PossibleWords[random.randint(0,len(Self.PossibleWords)-1)]
        Self.Stage = 0
        Self.Guesses = 0
        Self.GuessedLetters = []
        Self.CurrentGuess = ""
        for x in range(len(Self.Word)): Self.CurrentGuess += "_ "
        
    def MakeMove(Self,Board):
        CurrentLetter = input("What letter would you like to guess?\n").lower()
        if CurrentLetter in Self.GuessedLetters:
            print("You have already guessed this letter")
        elif len(CurrentLetter) > 1 or CurrentLetter.isdigit():
            print("You cannot guess this!")
        else:
            Self.GuessedLetters.append(CurrentLetter)
            if CurrentLetter in Self.Word:
                CorrectLocations = []
                for i, j in enumerate(Self.Word):
                    if CurrentLetter == j:
                        CorrectLocations.append(i)
                Self.CurrentGuess = Self.CurrentGuess.split(" ")
                for i in CorrectLocations:
                    Self.CurrentGuess[i] = CurrentLetter
                Self.CurrentGuess = " ".join(Self.CurrentGuess)
            else:
                Self.Stage += 1
        print(Self.CurrentGuess)
        if Self.Stage == 0:
            Board.Stage0()
        elif Self.Stage == 1:
            Board.Stage1()
        elif Self.Stage == 2:
            Board.Stage2()
        elif Self.Stage == 3:
            Board.Stage3()
        elif Self.Stage == 4:
            Board.Stage4()
        elif Self.Stage == 5:
            Board.Stage5()
        else:
            Board.Stage6()
            print("You did not guess the word in time.")
            Self.CurrentGuess = " "
        print("\n")

            
Board = NewBoard()
Game = NewGame()
while True:
    print(Game.CurrentGuess, "\n")
    while "_" in Game.CurrentGuess:
        Game.MakeMove(Board)
    if Game.CurrentGuess != " ":
        print("Well done, you guessed the word!")
    Answer = input("Would you like to guess another word?\n").lower()
    if Answer != "yes":
        break
    Game.__init__()


