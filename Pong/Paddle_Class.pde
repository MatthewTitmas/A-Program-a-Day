class Paddle {
  float XPos;
  float YPos;
  float Width;
  float Height;
  float YChange = 0;
  
  Paddle(float X, float Y, float W, float H) {
    XPos = X;
    YPos = Y;
    Width = W;
    Height = H;
  }
  
  void Show() {
    fill(255);
    rect(XPos,YPos,Width,Height); 
    if (YPos < 0 && YChange == -4) {
      YChange = 0;
    } else if (YPos + Height > height && YChange == 4) {
      YChange = 0;
    }
    YPos += YChange;
  }
}
