class Circle {
  float Radius;
  PVector Position;
  color Colour;

  Circle(float X, float Y, float radius, color Col) {
    Position = new PVector(X, Y);
    Radius = radius;
    Colour = Col;
  }

  void Show() {
    ellipseMode(CENTER);
    noStroke();
    fill(Colour);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  boolean Intersects(float X, float Y) {
    if (sq(X-Position.x) + sq(Y-Position.y) <= Radius*Radius) {
      return true;
    }
    return false;
  }

  void Split() {
    Circles.add(new Circle(Position.x+Radius/2, Position.y+Radius/2, Radius/2, Dog.get(int(Position.x+Radius/2), int(Position.y+Radius/2))));
    Circles.add(new Circle(Position.x-Radius/2, Position.y+Radius/2, Radius/2, Dog.get(int(Position.x-Radius/2), int(Position.y+Radius/2))));
    Circles.add(new Circle(Position.x-Radius/2, Position.y-Radius/2, Radius/2, Dog.get(int(Position.x-Radius/2), int(Position.y-Radius/2))));
    Circles.add(new Circle(Position.x+Radius/2, Position.y-Radius/2, Radius/2, Dog.get(int(Position.x+Radius/2), int(Position.y-Radius/2))));
  }
}
