class Pebble {
  float XPos = random(0,width);
  float YPos = random(570,height);
  float Speed = 10;
  
  void Draw() {
    fill(0);
    circle(XPos,YPos,4);
  }
  
  void Move() {
    XPos -= Speed;
    if (XPos < -10) {
      XPos = width+random(0,width);
    }
  }
}
