class Cell {
  int ID;
  boolean Wall = false;
  PVector Position;
  int HeuristicCost = 0;
  int WalkingCost = 0;
  int TotalCost;
  int Score;
  Cell Parent;
  color Colour;

  Cell(int XPos, int YPos, int id) {
    ID = id;
    Colour = 255;
    Position = new PVector(XPos, YPos);
    if (random(0, 1) < 0.2) {
      Wall = true;
      Colour = 0;
    }
    if (!Wall) {
      HeuristicCost = ((Rows-1)-XPos) + ((Rows-1)-YPos);
    }
    Score = HeuristicCost;
    TotalCost = HeuristicCost + WalkingCost;
    Parent = null;
  }

  void Show() {
    fill(0, 0, 255);
    rect(Position.x*Spacing,Position.y*Spacing,Spacing,Spacing);
    //if (Parent != null) {
     // Parent.Show();
    //}
  }
}
