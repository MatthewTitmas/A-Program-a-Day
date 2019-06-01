int Spacing = 80;
float XMoved;
float YMoved;
Cell[][] Cells;
int Rows = 200;
int CurrentNumber = 2;
int GreatestNumber;

void setup() {
  size(800, 800);
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 1; j < Rows+1; j++) {
      GreatestNumber = i+(j)*Rows-(Rows-1);
      Cells[i][j-1] = new Cell(i*Spacing, (j-1)*Spacing, i+(j)*Rows-(Rows-1), Spacing);
    }
  }
  Cells[0][0].Prime = false;
}


void draw() {
  background(255);

  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      if (Cells[i][j].Value > CurrentNumber) {
        if (Cells[i][j].Value % CurrentNumber == 0) {
          Cells[i][j].Prime = false;
        }
      }
    }
  }

  for (int i = 0; i < Rows; i++) {
    for (int j = 1; j < Rows+1; j++) {
      Cells[i][j-1].Show(XMoved, YMoved);
    }
  }
  boolean Found = false;
  while (!(Found)) {
    if (CurrentNumber > GreatestNumber) {
      break;
    }
    CurrentNumber += 1;
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        if (Cells[i][j].Value == CurrentNumber && Cells[i][j].Prime == true) {
          Found = true;
        }
      }
    }
  }
}

void mouseDragged() {
  XMoved += (mouseX-pmouseX);
  YMoved += (mouseY-pmouseY);
  if (XMoved > 0) {
    XMoved = 0;
  } else if (XMoved < -(Rows-10)*Spacing) {
    XMoved = -(Rows-10)*Spacing;
  }
  if (YMoved > 0) {
    YMoved = 0;
  } else if (YMoved < -(Rows-10)*Spacing) {
    YMoved = -(Rows-10)*Spacing;
  }
}
