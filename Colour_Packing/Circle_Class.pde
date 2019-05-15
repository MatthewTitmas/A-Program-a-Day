class Circle {
  PVector Position;
  float Diameter;
  float Growth;
  boolean Growing; 
  color Colour;
  
  Circle(float X, float Y, color Col) {
    Position = new PVector(X,Y);
    Diameter = 1;
    Growing = true;
    Colour = Col;
    Growth = 1;
  }
  
  void Show() {
    stroke(Colour);
    fill(Colour);
    ellipse(Position.x,Position.y,Diameter,Diameter);
  }
  
  void Update() {
    if (Growing) {
      Diameter += Growth;
    }
  }
  
  void CheckGrowth(ArrayList<Circle> ToCheck) {
    if (Position.x + Diameter/2 > width/2 || Position.x - Diameter/2 < 0 || Position.y + Diameter/2 > height || Position.y - Diameter/2 < 0) {
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
