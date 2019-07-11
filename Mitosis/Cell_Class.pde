class Cell {
  PVector Position;
  float Angle;
  float Radius;
  boolean Growing;
  float GrowthStage = 0;
  boolean Finished = false;

  Cell(float XPos, float YPos, float radius, float angle) {
    Position = new PVector(XPos, YPos);
    Angle = angle;
    Radius = radius;
  }

  void Show() {
    ellipse(Position.x, Position.y, Radius*2 + GrowthStage, Radius*2 + GrowthStage);
  }

  void Update() {
    if (Position.x - Radius > width || Position.x + Radius < 0 || Position.y - Radius > height || Position.y + Radius < 0) {
      Finished = true;
    }
    if (random(1) > 0.99) {
      Growing = true;
    }
    Angle += random(-0.3, 0.3);
    Position.x += 3*cos(Angle);
    Position.y += 3*sin(Angle);
    if (GrowthStage > Radius) {
      Split();
    }
    if (Growing) {
      GrowthStage += 0.5;
    }
  }
  
  void Split() {
    Finished = true;
    Cells.add(new Cell(Position.x, Position.y, 25, Angle+(PI/2)));
    Cells.add(new Cell(Position.x, Position.y, 25, Angle+3*(PI/2)));
  }
}
