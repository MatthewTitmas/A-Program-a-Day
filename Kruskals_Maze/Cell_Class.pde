class Cell {
  ArrayList<Edge> Edges;
  PVector Position;
  float Spacing;
  int ID;
  
  Cell(float X, float Y, float Space, float Unique) {
    Position = new PVector(X,Y);
    Spacing = Space;
    ID = int(Unique);
    Edges = new ArrayList<Edge>(4);
    // North
    Edges.add(new Edge(Position.x,Position.y,Position.x+Spacing,Position.y, "North"));
    // East
    Edges.add(new Edge(Position.x+Spacing,Position.y,Position.x+Spacing,Position.y+Spacing, "East"));
    // South
    Edges.add(new Edge(Position.x,Position.y+Spacing,Position.x+Spacing,Position.y+Spacing, "South"));
    // West
    Edges.add(new Edge(Position.x,Position.y,Position.x,Position.y+Spacing, "West"));
  }
  
  void Show() {
    for (Edge CurrentEdge : Edges) {
      CurrentEdge.Show();
    }
    textSize(32);
    fill(0,255,0);
    text(ID,Position.x+20,Position.y+50);
  }
  
  void GetRandomEdge(Cell Above, Cell CellBelow, Cell Left, Cell Right) {
    if (Edges.size() != 0) {
      int Random = int(random(0,Edges.size()));
      Edge EdgeToCheck = Edges.get(Random);
      if (EdgeToCheck.Orientation == "South") {
        if (CellBelow != null) {
          if (CellBelow.ID != ID) {
            MergeBelow(CellBelow);
          }
        }
      } else if (EdgeToCheck.Orientation == "North") {
        //println("North");
      } else if (EdgeToCheck.Orientation == "East") {
        //println("West");
      } else {
        //println("East");
      }
    }
  
  }
  
  void MergeBelow(Cell MergingCell) {
    MergingCell.ID = ID;
  }
  
  void MergeAbove(Cell MergingCell) {
     MergingCell.ID = ID;
  }
}
