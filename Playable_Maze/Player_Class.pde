class Player { 
  PVector Position;
  float XVel;
  float YVel;
  float Radius;
  boolean Colliding;
  Player(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
    Radius = Spacing/3;
  }

  void Show() {
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    if (!Colliding) {
      Position.x += XVel;
      Position.y += YVel;
    } else {
      Position.x = Spacing/2;
      Position.y = Spacing/2;
    }
    Colliding = false;
  }

  void CheckCollisions(Cell[][] Cells) {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        boolean Collision = Cells[i][j].CheckCollision(Position.x, Position.y, Radius);
        if (Collision == true) {
          Colliding = true;
        }
      }
    }
  }
}
