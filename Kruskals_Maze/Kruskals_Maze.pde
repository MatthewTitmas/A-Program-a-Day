float Rows;
float Cols;
float Spacing;
ArrayList<Cell> Cells;


void setup() {
  Rows = 10;
  Cols = 10;
  size(800,800);
  Spacing = width/Cols;
  Cells = new ArrayList<Cell>();
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells.add(new Cell(i*Spacing,j*Spacing,Spacing,i*Cols+j));
    }
  }
  background(255);
}

void draw() {
  frameRate(60);
  background(255);
  strokeWeight(5);
  stroke(0);
  line(0,0,0,height);
  line(0,0,width,0);
  line(0,height,width,height);
  line(width,0,width,height);
  for (Cell CurrentCell : Cells) {
    CurrentCell.Show();
  }
  
  //Pick random Edge
  Cell CellLeft = null;
  Cell CellRight = null;
  Cell CellAbove = null;
  Cell CellBelow = null;
  int RandomX = int(random(0,11));
  int RandomY = int(random(0,Rows));
  int CurrentCell = int((RandomX*(Cols-1)+RandomY));
  Cell CellToCheck = Cells.get(CurrentCell);
  if (CurrentCell >= 10) {
    CellAbove = Cells.get(CurrentCell-int(Rows));
  } else if (CurrentCell <= 89) {
    CellBelow = Cells.get(CurrentCell+int(Rows));
  } else if (CurrentCell != 0) {
    CellLeft = Cells.get(CurrentCell-1);
  } else if (CurrentCell != 99) {
    CellRight = Cells.get(CurrentCell+1); 
  }
  CellToCheck.GetRandomEdge(CellAbove, CellBelow, CellLeft, CellRight);
}
