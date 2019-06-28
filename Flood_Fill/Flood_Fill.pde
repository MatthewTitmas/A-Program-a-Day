color[] PossibleColours = {#FF0000, #00FF00, #0000FF, #FF00FF, #FFFF00, #00FFFF};
Cell[][] Cells;
int Rows = 40;
float Spacing;
color SelectedColour;


void setup() {
  size(800, 950);
  Spacing = width/Rows;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j] = new Cell(i*Spacing, j*Spacing, i, j);
    }
  }
  SelectedColour = #FF0000;
}

void draw() {
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      strokeWeight(1);
      Cells[i][j].Show();
    }
  }
  for (int i = 0; i < PossibleColours.length; i++) {
    rectMode(CENTER);
    fill(PossibleColours[i]);
    if (PossibleColours[i] == SelectedColour) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    rect((i+1)*width/(PossibleColours.length+1), 875, 50, 50);
  }
}

void mousePressed() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (XPos < Rows && YPos < Rows) {
    if (mouseButton == LEFT) {
      Cells[XPos][YPos].Colour = SelectedColour;
    } else {
      Cells[XPos][YPos].FloodFill(SelectedColour);
    }
  } else {
    if (mouseY > 850 && mouseY < 900) {
      for (int i = 0; i < PossibleColours.length; i++) {
        if (mouseX > (i+1)*width/(PossibleColours.length+1)-25 && mouseX < (i+1)*width/(PossibleColours.length+1) + 25) {
          SelectedColour = PossibleColours[i];
        }
      }
    }
  }
}

void mouseDragged() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (mouseButton == LEFT && XPos > -1 && XPos < Rows && YPos > -1 && YPos < Rows) {
    Cells[XPos][YPos].Colour = SelectedColour;
  }
}
