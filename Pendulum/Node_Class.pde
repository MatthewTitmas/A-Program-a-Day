class Node {
  float Acc = 0;
  float Vel = 0;
  float Angle = 181;
  float Length;
  float Mass;
  float Gravity = 9.81;
  float Dampening = 0.99;
  boolean Clicked = false;
  PVector Position;
  boolean Main;

  Node(float l, float m, boolean TF) {
    Length = l;
    Mass = m*8;
    Position = new PVector(0,0);
  }
  
  void Show() {
    Position.x = Length*3 * sin(radians(Angle));
    Position.y = Length*3 * cos(radians(Angle));
    if (Clicked) {
      fill(255,0,0);
    } else {
      fill(0);
    }
    line(0,0,Position.x,Position.y);
    ellipse(Position.x,Position.y,Mass,Mass);
  }
  
  void Update() {
    Acc = -Gravity/Length * sin(radians(Angle));
    Vel += Acc;
    Vel *= Dampening;
    Angle += Vel;
  }
  
  void Move(float X,float Y) {
    Y -= height/2;
    X -= width/2;
    if (X < 0) {
      Angle = -degrees(atan(Y/X)+PI/2);
    } else {
      Angle = 180 - degrees(atan(Y/X)+PI/2);
    }
  }
}
