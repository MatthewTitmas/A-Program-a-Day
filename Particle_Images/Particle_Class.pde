class Particle {
  PVector Pos;
  PVector Vel;
  PVector Acc;
  PVector WantedPos;
  float Radius;
  color Colour;
  float MaxSpeed;

  Particle(float X1, float Y1, float X2, float Y2, float radius, color colour) {
    Pos = new PVector(X1, Y1);
    WantedPos = new PVector(X2, Y2);
    Vel = new PVector(0, 0);
    Acc = new PVector(0, 0);
    Radius = radius;
    Colour = colour;
    MaxSpeed = random(0.5, 4);
  }

  void Show() {
    fill(Colour);
    noStroke();
    ellipse(Pos.x, Pos.y, Radius*2, Radius*2);
  }

  void Update() {
    float Distance = dist(Pos.x, Pos.y, WantedPos.x, WantedPos.y);
    float Proximity = 1;
    if (Distance > 50) {
      Proximity = Distance/50;
      Vel.mult(0.9);
    } else {
      Proximity = 1;
      Vel.mult(0.95);
    }
    
    if (Distance > 1) {
      PVector Direction = new PVector(WantedPos.x, WantedPos.y);
      Direction.sub(Pos);
      Direction.normalize();
      Direction.mult(MaxSpeed*Proximity);
      Acc.add(Direction);
    }
    
    if (dist(Pos.x,Pos.y,mouseX,mouseY) < 50) {
      PVector Force = new PVector(Pos.x,Pos.y);
      Force.sub(new PVector(mouseX,mouseY));
      Force.normalize();
      Force.mult((200-dist(Pos.x,Pos.y,mouseX,mouseY))*0.2);
      Acc.add(Force);
    }
    
    Vel.add(Acc);
    Vel.limit(15);
    Pos.add(Vel);
    Acc.mult(0);
  }
}
