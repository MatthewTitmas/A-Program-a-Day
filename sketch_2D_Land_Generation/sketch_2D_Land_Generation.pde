int Rows;
int Cols;
int Spacing;
HorizontalSlider Smoothness;
color[][] IslandsMap;
color[][] OriginalMap;



void setup() {
  Smoothness = new HorizontalSlider(400, 525, 400, 10);
  Spacing = 10;
  size(900, 600);
  Cols = width/Spacing;
  Rows = 500/Spacing;
  OriginalMap = new color[Cols][Rows];
  IslandsMap = new color[Cols][Rows];
  NewMap();
}


void draw() {
  background(50);
  noStroke();
  rectMode(CORNER);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      fill(IslandsMap[i][j]);
      rect(i*Spacing, j*Spacing, Spacing, Spacing);
    }
  }
  strokeWeight(3);
  stroke(200);
  fill(50);
  rect(0, 500, 300, 100);
  textSize(48);
  fill(220);
  textAlign(CENTER, CENTER);
  text("New Map", 150, 540);
  textSize(32);
  text("Smoothness", 600, 560);
  Smoothness.Show();
}

void mouseClicked() {
  if (mouseX < 300 && mouseY > 500) {
    NewMap();
    Smoothness.Reset();
  }
}

void mouseDragged() {
  if (mouseX > 300 && mouseY > 500) {
    Smoothness.Move(mouseX);
    for (int i = 0; i < Cols; i++) {
      for (int j = 0; j < Rows; j++) {  
        IslandsMap[i][j] = OriginalMap[i][j];
      }
    }
    Smooth(int(Smoothness.Value));
  }
}


void NewMap() {
  float x = 0.47;
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      OriginalMap[i][j] = color(75, floor(random(170, 180)), 10);
      if (random(0, 1) < x || i == 0 || i == Cols-1 || j == 0 || j == Rows-1) {
        OriginalMap[i][j] = color(75, 10, floor(random(170, 180)));
      }
    }
  }
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {  
      IslandsMap[i][j] = OriginalMap[i][j];
    }
  }
}


void Smooth(int Times) {
  for (int x = 0; x < Times; x++) {
    for (int i = 0; i < Cols; i++) {
      for (int j = 0; j < Rows; j++) {
        int NeighbourTiles = GetWallCount(i, j);
        if (NeighbourTiles == 8 && green(IslandsMap[i][j]) == 10) {
          IslandsMap[i][j] = color(red(IslandsMap[i][j]), green(IslandsMap[i][j]), constrain(blue(IslandsMap[i][j])-floor(random(10, 50)), 160, 180));
        } else if (NeighbourTiles < 4) {
          IslandsMap[i][j] = color(75, floor(random(170, 180)), 10);
        } else if (NeighbourTiles > 4) {
          IslandsMap[i][j] = color(75, 10, floor(random(170, 180)));
        }
      }
    }
  }
}

int GetWallCount(int x, int y) {
  int Neighbours = 0;
  for (int i = x-1; i <= x+1; i++) {
    for (int j = y-1; j <= y+1; j++) {
      if (i > -1 && i < Cols && j > -1 && j < Rows) {
        if (i != x || j != y) {
          if (green(IslandsMap[i][j]) == 10) {
            Neighbours += 1;
          }
        }
      } else {
        Neighbours += 1;
      }
    }
  }

  return Neighbours;
}
