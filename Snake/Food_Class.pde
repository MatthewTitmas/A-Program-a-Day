class Food {
  float XPos;
  float YPos;
  float Width;
  
  Food(float Rows, float Spacing) {
    XPos = int(random(0,Rows))*Spacing;
    YPos = int(random(0,Rows))*Spacing;
    Width = Spacing;
  }
  
  void Show() {
    fill(255,0,0);
    rect(XPos,YPos,Width,Width);
  }
  
  void CheckCollision(PlayerSnake Player) {
    PVector Part = Player.Positions.get(0);
    if (XPos == Part.x && YPos == Part.y) {
      XPos = int(random(0,Rows))*Spacing;
      YPos = int(random(0,Rows))*Spacing;
      Player.IncreaseSize();
    }
  }
}
