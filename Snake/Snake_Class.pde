class PlayerSnake {
  ArrayList<PVector> Positions;
  float Width;
  int Length = 2;
  float YDirection = 0;
  float XDirection = 1;
  boolean GameOver = false;
  
  PlayerSnake(float Rows, float Spacing) {
    Positions = new ArrayList<PVector>();
    Positions.add(new PVector(Rows/2*Spacing,Rows/2*Spacing));
    Positions.add(new PVector(-100,-100));
    Width = Spacing;
  }
  
  void Show() {
    fill(0,255,0);
    for (PVector Current : Positions) {
      rect(Current.x,Current.y,Width,Width);
    }
  }
  
  void Update() { 
    for (int i = Positions.size()-1; i > 0; i = i - 1) {
      PVector Current = Positions.get(i);
      PVector Next = Positions.get(i-1);
      Current.x = Next.x;
      Current.y = Next.y;
    }
    PVector Current = Positions.get(0);
    Current.x += XDirection*Width;
    Current.y += YDirection*Width;
  }
  
  void IncreaseSize() {
    Positions.add(new PVector(-100,-100));
  }
  
  void CheckCollisionWithSelf(PlayerSnake Self) {
    PVector Position = Positions.get(0); 
    if (Position.x < 0 || Position.x >= width || Position.y < 0 || Position.y >= height) {
      GameOver = true;
    }
    for (int i = 1; i < Self.Positions.size(); i++) {
      PVector CheckPosition = Positions.get(i);
      if (Position.x == CheckPosition.x && Position.y == CheckPosition.y) {
        GameOver = true;
      }
    }
  }
}
