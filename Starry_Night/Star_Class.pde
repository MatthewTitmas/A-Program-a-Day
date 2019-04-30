class Star {
  int LifeTime = int(random(50,100));
  int FadeTime = int(random(20,40));
  int XPos = int(random(width));
  int YPos = int(random(height));
  int Opacity = 255;
  int Size = int(random(3,7));
  int TimeAlive = 0;
  
  void Draw() {
    fill(255,Opacity);
    circle(XPos,YPos,Size);
    TimeAlive += 1;
    if (TimeAlive > LifeTime) {
      Opacity -= 255/FadeTime;
    }
  }
}
