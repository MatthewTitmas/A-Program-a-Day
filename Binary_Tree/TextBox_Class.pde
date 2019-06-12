class TextBox {
  PVector Position;
  float Length;
  float Height;
  boolean Selected = false;
  String Text ="";


  TextBox(float XPos, float YPos, float size, float top) {
    Position = new PVector(XPos, YPos);
    Length = size;
    Height = top;
  }

  void Show() {
    fill(255);
    noStroke();
    if (Selected) {
      strokeWeight(3);
      stroke(0);
    }
    rect(Position.x, Position.y, Length, Height);
    fill(0);
    textSize(32);
    textAlign(LEFT, CENTER);
    text(Text,Position.x + 20,Position.y+Height/2);
  }
}
