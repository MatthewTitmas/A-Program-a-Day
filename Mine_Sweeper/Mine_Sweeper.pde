int GridSize = 40;
int SquaresToSelect;
float Spacing;

PImage Unpressed;
PImage BombButton;
PImage Flag;

boolean Lost;
boolean Done;

Cell[][] Cells;

void setup() {
  size(800, 800);

  Reset();

  Unpressed = loadImage("UnpressedButton.png");
  Unpressed.resize((int)Spacing, (int)Spacing);

  BombButton = loadImage("BombButton.png");
  BombButton.resize((int)Spacing, (int)Spacing);

  Flag = loadImage("FlagButton.png");
  Flag.resize((int)Spacing, (int)Spacing);
}

void draw() {
  if (SquaresToSelect == 0 || Lost) {
    if (SquaresToSelect == 0) {
      fill(255,0,0);
      textSize(64);
      text("You win!", width/2, height/2);
      textSize(32);
      text("Press 'R' to restart", width/2, height/2+100);
    } else {
      fill(255,0,0);
      textSize(64);
      text("You lose!", width/2, height/2);
      textSize(32);
      text("Press 'R' to restart", width/2, height/2+100);
    }
    Done = true;
  } else {
    for (int i = 0; i < GridSize; i++) {
      for (int j = 0; j < GridSize; j++) {
        Cells[i][j].Show();
      }
    }
  }
}

void mousePressed() {
  if (!Done) {
    if (mouseButton == LEFT) {
      Cells[floor(mouseX/Spacing)][floor(mouseY/Spacing)].Pressed(Cells);
    } else {
      Cells[floor(mouseX/Spacing)][floor(mouseY/Spacing)].Flag();
    }
  }
}

void keyPressed() {
  if (key == 'r' && Done) {
    Reset();
  }
}

void Reset() {
  SquaresToSelect = (int)sq(GridSize);

  Spacing = width/GridSize;

  Cells = new Cell[GridSize][GridSize];
  for (int i = 0; i < GridSize; i++) {
    for (int j = 0; j < GridSize; j++) {
      Cells[i][j] = new Cell(i, j);
    }
  }

  for (int i = 0; i < GridSize; i++) {
    for (int j = 0; j < GridSize; j++) {
      if (!Cells[i][j].Bomb) {
        Cells[i][j].FindBombs(Cells);
      }
    }
  }

  Lost = false;
  Done = false;
  
}
