class Wall {
  PVector Start;
  PVector End;
  boolean Enabled;
  Wall(float StartX, float StartY, float EndX, float EndY) {
    Start = new PVector(StartX, StartY);
    End = new PVector(EndX, EndY);
    Enabled = true;
  }

  void Show() {
    stroke(0);
    strokeWeight(1);
    line(Start.x, Start.y, End.x, End.y);
  }


  boolean CheckCollision(float XPos, float YPos, float Radius) {
    boolean Colliding = false;
    if (Start.x == End.x) {
      if (Start.x >= XPos - Radius && Start.x <= XPos+Radius && floor(Start.y/Spacing) == floor(YPos/Spacing)) {
        Colliding = true;
      }
    } else {
      if (Start.y >= YPos-Radius && Start.y <= YPos+Radius && floor(Start.x/Spacing) == floor(XPos/Spacing)) {
        Colliding = true;
      }
    }
    return Colliding;
  }
}
