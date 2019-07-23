class BarThree {
  PVector Position;
  float Width;
  float Percentage;
  float Height;
  
  BarThree(float XPos, float YPos, float w, float h) {
    Position = new PVector(XPos,YPos);
    Width = w;
    Height = h;
  }
  
  void Show() {
    strokeWeight(1);
    fill(255);
    rectMode(CENTER);
    rect(Position.x+Width/2,Position.y+Height/2,Percentage,Height);
  }
  
  void Update() {
    Percentage = map(Percent,0,100,0,Width);
    if (Percentage > Width) {
      Percentage = Width;
    }
  }
  
}
