class Cell {
  PVector Position;
  float Width;
  float Height;
  color Colour;
  
  Cell(float XPos, float YPos, float W, float H) {
    Position = new PVector(XPos,YPos);
    Width = W-5;
    Height = H-5;
    Colour = #FFFAF4;
  }
  
  void Show() {
    strokeWeight(1);
    fill(Colour);
    rect(Position.x*Width+5,Position.y*Width+5,Width,Height,10);
  }
  
  boolean CheckIntersection(float MouseX,float MouseY) {
    if (MouseX > Position.x*Width+5 && MouseX < Position.x*Width+Width+5 && MouseY > Position.y*Width+5 && MouseY < Position.y*Height+Height+5) {
      return true;
    }
    return false;
  }
}
