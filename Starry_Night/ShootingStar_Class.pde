class ShootingStar {
  int Opacity = 1;
  int XPos = int(random(width));
  int YPos = int(random(height));
  float XChange = random(-10,10);
  float YChange = random(-10,10);
  float OpacityChange = random(10,15);
  float OpacityChangeSquared = random(-0.5,-1);
  
  
  void Draw() {
    fill(255,Opacity);
    Opacity += OpacityChange;
    OpacityChange += OpacityChangeSquared;
    circle(XPos,YPos,6);
    XPos += XChange;
    YPos += YChange;
  }
}
