boolean[][] Cells;
boolean[][] CopiedCells;
int Spacing = 10;
float Cols;
float Rows;

void setup() {
  size(800, 600);
  Cols = width/Spacing;
  Rows = height/Spacing;
  Cells = new boolean[int(Cols)][int(Rows)];
  CopiedCells = new boolean[int(Cols)][int(Rows)];
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j] = false;
      CopiedCells[i][j] = false;
      if (random(0, 1) < 0.3) {
        Cells[i][j] = true;
        CopiedCells[i][j] = true;
      }
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      int AliveNeighbours = 0;
      for (int x = max(0, i-1); x < min(Cols-1, i+1)+1; x++ ) {
        for (int y = max(0, j-1); y < min(Rows-1, j+1)+1; y++) {
          if (x != i || y != j) {
            if (CopiedCells[x][y] == true) {
              AliveNeighbours++;
            }
          }
        }
      }
      if (AliveNeighbours > 4) { println(AliveNeighbours); }
      if (Cells[i][j] == true) {
        if (AliveNeighbours < 2) {
          Cells[i][j] = false;
        } else if (AliveNeighbours < 4) {
          Cells[i][j] = true;
        } else {
          Cells[i][j] = false;
        }
      } else {
        if (AliveNeighbours == 3) {
          Cells[i][j] = true;
        }
      }
    }
  }


  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      CopiedCells[i][j] = Cells[i][j];
      fill(255);
      if (Cells[i][j] == true) {
        fill(0);
      }
      rect(i*Spacing, j*Spacing, Spacing, Spacing);
    }
  }
 
 
}

void mouseClicked() {
  Cells[int(mouseX/Spacing)][int(mouseY/Spacing)] = !Cells[int(mouseX/Spacing)][int(mouseY/Spacing)];
}
