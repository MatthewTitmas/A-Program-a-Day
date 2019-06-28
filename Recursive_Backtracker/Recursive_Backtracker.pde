boolean Finished = false;
float Spacing;
int Rows = 20;
Cell[][] Cells;
PVector CurrentCell = new PVector(0, 0);

void setup() {
  size(800, 800);
  Spacing = width/Rows;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j] = new Cell(i*Spacing, j*Spacing, i, j);
    }
  }
  Cells[int(CurrentCell.x)][int(CurrentCell.y)].Visited = true;
}

void draw() {
  background(255);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(width, 0, width, height);
  line(0, height, width, height);
  if (!Finished) {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j].Show();
      }
    }
    Cells[int(CurrentCell.x)][int(CurrentCell.y)].Visited = true;
    Cells[int(CurrentCell.x)][int(CurrentCell.y)].PickNewCurrent();
  } else {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j].Show();
      }
    }
  }
}
