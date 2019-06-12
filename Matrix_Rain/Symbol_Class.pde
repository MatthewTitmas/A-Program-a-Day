class Symbol {
  char Char;
  float XPos;
  float YPos;
  int Colour;
  Symbol(float xpos, float ypos, int colour) {
    Char = (char)(int(random(33,127)));
    XPos = xpos;
    YPos = ypos;
    Colour = colour;
  }
  
  void NewChar() {
    Char = (char)floor(random(33,127));
  }
  
  void Show() {
    fill(Colour);
    text(Char,XPos,YPos);
  }
  
  void Update() {
    YPos += TextSize;
  }
  
  boolean CheckGone() {
    if (YPos + 32 > height) {
      return true;
    }
    return false;
  }
}
