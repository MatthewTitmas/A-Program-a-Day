ArrayList<Cell> Cells;

void setup() {
  size(800, 800);
  Cells = new ArrayList<Cell>();
  Cells.add(new Cell(400, 400, 25,PI));
}

void draw() {
  background(255);
  for (int i = Cells.size() - 1; i >= 0; i--) {
    Cell Current = Cells.get(i);
    Current.Show();
    Current.Update();
    if (Current.Finished) {
      Cells.remove(i);
    }
  }
}

void mouseClicked() {
   Cells.add(new Cell(mouseX,mouseY,25,random(0,TWO_PI)));
}
