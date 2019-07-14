class Creature {
  PVector Position;
  float Angle;
  color Colour;
  Creature() {
    Position = new PVector(random(width),random(height),0);
    Angle = random(TWO_PI);
    Colour = color(floor(random(128,256)),0,0);
  }
  
  void Show() {
    pushMatrix();
    fill(Colour);
    noStroke();
    translate(Position.x,Position.y,Position.z);
    sphere(30);
    translate(0,0,-30);
    sphere(15);
    popMatrix();
  }
  
  void Update() {
    Angle += random(-0.3,0.3);
    Position.x += 3*cos(Angle);
    Position.y += 3*sin(Angle);
  }
}
