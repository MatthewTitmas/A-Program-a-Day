class Circle {
  PVector Position;
  float Diameter = 0;
  float Growth;
  boolean Growing = true;
  
  Circle(float XPos, float YPos) {
    Position = new PVector(XPos,YPos);
    Growth = 1;
  }
  
  void Show() {
    ellipse(Position.x,Position.y,Diameter,Diameter);
  }
  
  void Update() {
    if (Growing == true) {
      Diameter += Growth;
    }
  }
  
  void CheckGrowth(ArrayList<Circle> ToCheck) {
    if (Position.x + Diameter/2 > width || Position.x - Diameter/2 < 0 || Position.y + Diameter/2 > height || Position.y - Diameter/2 < 0) {
      Growing = false;
    }
    for (Circle Current : ToCheck) {
      if (Current.Position != Position) {
        if (((Current.Position.x - Position.x)*(Current.Position.x - Position.x))+((Current.Position.y - Position.y)*(Current.Position.y - Position.y)) < (Current.Diameter/2 + Diameter/2) * (Current.Diameter/2 + Diameter/2)) {
          Growing = false;
        }
      }
    }
  }
}
