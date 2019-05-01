class Bar {
  float X;
  float Height;
  float Width;
  float Colour;
  
  Bar(float x, float tall, float size) {
    X = x;
    Height = -tall;
    Width = size;
    Colour = map(Height,-height,0,100,200);
  }
  
  void Show() {
    fill(255-Colour,Colour/1.5,Colour);
    rect(X,height,Width,Height);
  }
}
