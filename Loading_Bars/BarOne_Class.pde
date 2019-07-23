class BarOne {
  PVector Position;
  float Width;
  float Percentage;
  float Height;
  
  BarOne(float XPos, float YPos, float w, float h) {
    Position = new PVector(XPos,YPos);
    Width = w;
    Height = h;
  }
  
  void Show() {
    strokeWeight(1);
    rectMode(CORNER);
    noFill();
    stroke(255);
    rect(Position.x,Position.y,Width,Height);
    fill(255);
    rect(Position.x,Position.y,Percentage,Height);
    if (Percentage >= Width) {
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(32);
      text("Complete",Position.x+Width/2,Position.y+Height/2-Height/16);
    }
  }
  
  void Update() {
    Percentage = map(Percent,0,100,0,Width);
    if (Percentage > Width) {
      Percentage = Width;
    }
  }
  
}
