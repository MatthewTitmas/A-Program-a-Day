float Spacing;
int Rows = 3;
Cell[][] Board;
boolean Turn = true;
String Winner = null;

void setup() {
  size(1100, 800);
  Board = new Cell[Rows][Rows];
  Spacing = (width-300)/Rows;
  ResetBoard();
}


void draw() {
  noStroke();
  fill(#B36534);
  rect(width-300, 0, 300, height);
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Board[i][j].Show();
    }
  }
  textAlign(CENTER, CENTER);
  textSize(160);
  if (Turn) { 
    text("X", 950, height/2);
  } else {
    text("O", 950, height/2);
  }
  CheckWin();
}


void mouseClicked() {
  if (Winner == null) {
    int X = floor(mouseX/Spacing);
    int Y = floor(mouseY/Spacing);
    if (X < 3) {
      if (Turn && Board[X][Y].Value == null) {
        Board[X][Y].Value = "X";
        Turn = !Turn;
      } else if (!Turn && Board[X][Y].Value == null) {
        Board[X][Y].Value = "O";
        Turn = !Turn;
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' && Winner != null) {
    ResetBoard();
  }
}


void CheckWin() {
  String OldValue;
  Boolean Win = true;
  for (int i = 0; i < 3; i++) {
    OldValue = Board[i][0].Value;
    Win = true;
    for (int j = 0; j < 3; j++) {
      if (Board[i][j].Value == null) {
        Win = false;
      } else if (OldValue == null) {
        Win = false;
      } else if (!OldValue.equals(Board[i][j].Value)) {
        Win = false;
      }
    }
    if (Win) {
      Winner = Board[i][0].Value;
      stroke(#936F52);
      strokeWeight(15);
      line(i*Spacing+Spacing/2, Spacing/2-20, i*Spacing+Spacing/2, height-Spacing/2+20);
    }
  }

  for (int i = 0; i < 3; i++) {
    OldValue = Board[0][i].Value;
    Win = true;
    for (int j = 0; j < 3; j++) {
      if (Board[j][i].Value == null) {
        Win = false;
      } else if (OldValue == null) {
        Win = false;
      } else if (!OldValue.equals(Board[j][i].Value)) {
        Win = false;
      }
    }
    if (Win) {
      Winner = Board[0][i].Value;
      stroke(#936F52);
      strokeWeight(15);
      line(Spacing/2-20, i*Spacing+Spacing/2, height-Spacing/2+20, i*Spacing+Spacing/2);
    }
  }

  if (Board[0][0].Value != null && Board[1][1].Value != null && Board[2][2].Value != null) {
    if (Board[0][0].Value == Board[1][1].Value && Board[0][0].Value == Board[2][2].Value) {
      stroke(#936F52);
      strokeWeight(15);
      line(Spacing/2, Spacing/2, 800-Spacing/2, height-Spacing/2);
    }
  }

  if (Board[2][0].Value != null && Board[1][1].Value != null && Board[0][2].Value != null) {
    if (Board[2][0].Value == Board[1][1].Value && Board[2][0].Value == Board[0][2].Value) {
      stroke(#936F52);
      strokeWeight(15);
      line(800-Spacing/2, Spacing/2, Spacing/2, height-Spacing/2);
      Winner = Board[1][1].Value;
    }
  }
  if (Winner != null) {
    textSize(64);
    text(Winner+ " wins!", 950, 100);
    textSize(32);
    text("Press 'r' to restart", 950, 150);
  }
}


void ResetBoard() {
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Board[i][j] = new Cell(i*Spacing, j*Spacing);
    }
  }
  Turn = true;
  Winner = null;
}
