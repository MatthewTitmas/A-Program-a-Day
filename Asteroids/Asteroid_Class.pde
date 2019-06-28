class Asteroid {
  PVector Position;
  PVector Velocity;
  float Radius;
  PVector[] RandomShapes;
  boolean Parent;

  Asteroid(boolean parent, float radius, float XPos, float YPos) {   
    Parent = parent;
    if (Parent) {
      Position = new PVector(random(0, width), random(0, height));
      Velocity = new PVector(random(-5, 5), random(-5, 5));
      Radius = random(40, 60);
      Parent = true;
    } else {
      Position = new PVector(XPos, YPos);
      Velocity = new PVector(random(-5, 5), random(-5, 5));
      Radius = 2*(radius/3);
      Parent = false;
    }
  }

  void Show() {
    stroke(255);
    strokeWeight(1);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    boolean Teleport = false;
    Position.add(Velocity);
    if (Position.x < -Radius-10) {
      Teleport = true;
      Position.x = width+Radius+10;
    } else if (Position.x > width+Radius+10) {
      Position.x = -Radius-10;
      Teleport = true;
    } else if (Position.y < -Radius-10) {
      Position.y = height+Radius+10;
      Teleport = true;
    } else if (Position.y > height+Radius+10) {
      Position.y = (-Radius)-10;
      Teleport = true;
    }
    if (Teleport) {
      Velocity = new PVector(random(-5, 5), random(-5, 5));
    }
  }

  boolean IntersectsPlayer(Ship Player) {
    float DeltaX = Position.x - max(Player.Position.x-20, min(Position.x, Player.Position.x-20 + 40));
    float DeltaY = Position.y - max(Player.Position.y, min(Position.y, Player.Position.y-20 + 50));
    return (DeltaX * DeltaX + DeltaY * DeltaY) < (Radius * Radius);
  }
}
