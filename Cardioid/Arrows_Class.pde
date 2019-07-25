class Arrow {
  PVector Position;
  float Width;
  float Height;

  Arrow(float XPos, float YPos, float W, float H) {
    Position = new PVector(XPos, YPos);
    Width = W;
    Height = H;
  }

  void Show() {
    fill(255);
    rect(Position.x, Position.y, Width, Height);
    beginShape();
    vertex(Position.x+Width/4, Position.y+3*Height/8);
    vertex(Position.x+Width/2, Position.y+Height/8);
    vertex(Position.x+3*Width/4, Position.y+3*Height/8);
    endShape();
    line(Position.x, Position.y+Height/2, Position.x+Width, Position.y+Height/2);
    beginShape();
    vertex(Position.x+Width/4, Position.y+5*Height/8);
    vertex(Position.x+Width/2, Position.y+7*Height/8);
    vertex(Position.x+3*Width/4, Position.y+5*Height/8);
    endShape();
  }

  boolean Intersects(int X, int Y) {
    if (mouseX > Position.x && mouseX < Position.x+Width && mouseY > Position.y && mouseY < Position.y+Height) {
      return true;
    }
    return false;
  }

  int TopBottom(int X, int Y) {
    if (mouseX > Position.x && mouseX < Position.x+Width && mouseY > Position.y && mouseY < Position.y+Height/2) {
      return 1;
    }
    return -1;
  }
}
