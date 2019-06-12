Cell[][] Board;
int Cols = 8;
int BlackPieces = 12;
int WhitePieces = 12;
float Spacing;
Cell SelectedPiece;
PVector StoredPos;
boolean Turn = true;
ArrayList<PVector> PossibleMoves;
ArrayList<PVector> PossibleJumps;

PImage WhitePawn;
PImage BlackPawn;
PImage WhiteKing;
PImage BlackKing;

PImage Background;

void setup() {
  size(1000, 800);
  Spacing = 800/Cols;
  Board = new Cell[Cols][Cols];

  //Loading Images
  WhitePawn = loadImage("White Pawn.png");
  BlackPawn = loadImage("Black Pawn.png");
  WhiteKing = loadImage("White King.png");
  BlackKing = loadImage("Black King.png");

  //Resizing Images
  WhitePawn.resize(80, 80);
  BlackPawn.resize(80, 80);
  WhiteKing.resize(80, 80);
  BlackKing.resize(80, 80);

  Background = loadImage("Wood.jpg");
  Background.resize(400,1600);

  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      Board[i][j] = new Cell(i, j);
    }
  }

  SetBoard();
} 


void draw() {
  rectMode(CORNER);
  fill(255,0,0);
  image(Background, 800, 0);
  textSize(50);
  fill(255, 0, 0);
  textAlign(CENTER);
  text(WhitePieces, 900, 50);
  text(BlackPieces, 900, 750);
  if (Turn) {
    text("Whites turn", 800, 400, 200, 200);
  } else {
    text("Blacks turn", 800, 400, 200, 200);
  }
  noStroke();
  int Count = 0;
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      fill(#E8C491);
      if (Count % 2 == 0) {
        fill(#62150D);
      }
      rect(i*Spacing, j*Spacing, Spacing, Spacing);
      Count++;
    }
    Count++;
  }

  DrawBoard();

  rectMode(CENTER);
  fill(0, 0, 255, 100);
  if (SelectedPiece != null) {
    rect(SelectedPiece.Position.x, SelectedPiece.Position.y, Spacing, Spacing);
  }
  if (PossibleMoves != null) {
    for (PVector Current : PossibleMoves) {
      rectMode(CORNER);
      rect(Current.x*Spacing, Current.y*Spacing, Spacing, Spacing);
    }
  }
  if (PossibleJumps != null) {
    for (PVector Current : PossibleJumps) {
      rectMode(CORNER);
      fill(255, 100, 0, 100);
      rect(Current.x*Spacing, Current.y*Spacing, Spacing, Spacing);
    }
  }
}


void mouseClicked() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (Board[XPos][YPos].Occupied != "False"  && Board[XPos][YPos].Colour == Turn) {
    SelectedPiece = Board[XPos][YPos];
    StoredPos = new PVector(XPos, YPos);
    PossibleMoves = Board[XPos][YPos].GetMoves(Board);
    PossibleJumps = Board[XPos][YPos].GetJumps(Board);
  } else if (SelectedPiece != null && PossibleMoves.contains(new PVector(XPos, YPos))) {
    Board[XPos][YPos].Image = SelectedPiece.Image;
    Board[XPos][YPos].King = SelectedPiece.King;
    SelectedPiece = null;
    PossibleMoves = null;
    PossibleJumps = null;
    Board[int(StoredPos.x)][int(StoredPos.y)].Image = null;
    Turn = !Turn;
  } else if (SelectedPiece != null && PossibleJumps.contains(new PVector(XPos, YPos))) {
    int OldX = int(SelectedPiece.CellPos.x);
    int OldY = int(SelectedPiece.CellPos.y);
    int RemovedX = (OldX+XPos)/2;
    int RemovedY = (OldY+YPos)/2;
    Board[RemovedX][RemovedY].Image = null;
    Board[XPos][YPos].Image = SelectedPiece.Image;
    Board[XPos][YPos].King = SelectedPiece.King;
    SelectedPiece = null;
    PossibleMoves = null;
    PossibleJumps = null;
    Board[int(StoredPos.x)][int(StoredPos.y)].Image = null;
    Turn = !Turn;
    if (Turn) {
      WhitePieces--;
    } else {
      BlackPieces--;
    }
  }
}



void DrawBoard() {
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      Board[i][j].Show();
      Board[i][j].Update();
    }
  }
}

void SetBoard() {
  Board[1][0].Image = WhitePawn;
  Board[3][0].Image = WhitePawn;
  Board[5][0].Image = WhitePawn;
  Board[7][0].Image = WhitePawn;
  Board[0][1].Image = WhitePawn;
  Board[2][1].Image = WhitePawn;
  Board[4][1].Image = WhitePawn;
  Board[6][1].Image = WhitePawn;
  Board[1][2].Image = WhitePawn;
  Board[3][2].Image = WhitePawn;
  Board[5][2].Image = WhitePawn;
  Board[7][2].Image = WhitePawn;

  Board[0][7].Image = BlackPawn;
  Board[2][7].Image = BlackPawn;
  Board[4][7].Image = BlackPawn;
  Board[6][7].Image = BlackPawn;
  Board[1][6].Image = BlackPawn;
  Board[3][6].Image = BlackPawn;
  Board[5][6].Image = BlackPawn;
  Board[7][6].Image = BlackPawn;
  Board[0][5].Image = BlackPawn;
  Board[2][5].Image = BlackPawn;
  Board[4][5].Image = BlackPawn;
  Board[6][5].Image = BlackPawn;
}
