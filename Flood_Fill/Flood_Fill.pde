color[] PossibleColours = {#FF0000, #00FF00, #0000FF, #FF00FF, #FFFF00, #00FFFF};
int Rows = 10;
float Spacing;
Cell[][] Cells;
ArrayList<Cell> StolenCells;
ArrayList<Cell> ToAdd;

void setup() {
  size(700, 850);
  Cells = new Cell[Rows][Rows];
  Spacing = width/Rows;
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      int Random = floor(random(0, PossibleColours.length));
      Cells[i][j] = new Cell(i*Spacing, j*Spacing, i, j, PossibleColours[Random]);
    }
  }
  Cells[0][0].Stolen = true;
  StolenCells = new ArrayList<Cell>();
  ToAdd = new ArrayList<Cell>();
  StolenCells.add(Cells[0][0]);
}

void draw() {
  for (int i = 0; i < PossibleColours.length; i++) {
    rectMode(CENTER);
    fill(PossibleColours[i]);
    rect((i+1)*width/(PossibleColours.length+1), 775, 50, 50);
  }
  noStroke();
  rectMode(CORNER);
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j].Show();
    }
  }
}

void mouseClicked() {
  if (mouseY > 750 && mouseY < 800) {
    for (int i = 0; i < PossibleColours.length; i++) {
      if (mouseX > (i+1)*width/(PossibleColours.length+1)-25 && mouseX < (i+1)*width/(PossibleColours.length+1) + 25) {
        SwitchColours(PossibleColours[i]);
      }
    }
  }
}

void SwitchColours(color Colour) {
  for (Cell Current : StolenCells) {
    Current.CheckSorrounding(Colour, Cells);
  }

  for (int i = ToAdd.size() - 1; i >= 0; i--) {
    Cell Adding = ToAdd.get(i);
    StolenCells.add(Adding);
    ToAdd.remove(i);
  }
}
