class Ball {
  PVector Position;
  PVector Velocity;
  float Gravity = 0.1;
  float Radius;
  float Bouncyness = 1.5;
  color Colour;

  Ball(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
    Velocity = new PVector(0, 0);
    Radius = 15;
    int RandomNumber = floor(random(0, 256));
    Colour = color(RandomNumber, 255, 255);
  }

  void Show() {
    fill(Colour);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    Velocity.y += Gravity;
    Position.add(Velocity);
    if (Position.y-Radius > height) {
      Position.y = -Radius;
      Position.x = 400+random(-1,1);
      Velocity = new PVector(0,0);
      int RandomNumber = floor(random(0, 256));
      Colour = color(RandomNumber, 255, 255);
    }
  }

  void CheckCollisionWithPin(Pin CurrentPin) {
    if ((Position.x+Velocity.x - CurrentPin.Position.x)*(Position.x+Velocity.x - CurrentPin.Position.x) + (Position.y+Velocity.y - CurrentPin.Position.y)*(Position.y+Velocity.y - CurrentPin.Position.y) < (Radius+CurrentPin.Radius)*(Radius+CurrentPin.Radius)) {
      Colliding(CurrentPin);
    }
  }

  void Colliding(Pin CurrentPin) {
    float Distance = sqrt((CurrentPin.Position.x - Position.x)*(CurrentPin.Position.x - Position.x) + (CurrentPin.Position.y - Position.y)*(CurrentPin.Position.y - Position.y));
    float Speed = sqrt((Velocity.x*Velocity.x) + ((Velocity.y + Gravity)*(Velocity.y + Gravity)));
    float Angle = acos((Velocity.x*(CurrentPin.Position.x-Position.x) + (Velocity.y+Gravity)*(CurrentPin.Position.y-Position.y))/(Speed*Distance));
    float PerpendicularSpeed = Speed*cos(Angle);

    float XChange = Bouncyness * ((PerpendicularSpeed*(CurrentPin.Position.x-Position.x))/Distance);
    float YChange = Bouncyness * ((PerpendicularSpeed*(CurrentPin.Position.y-Position.y))/Distance);
    Velocity.x -= XChange;
    Velocity.y -= YChange;
  }
}
