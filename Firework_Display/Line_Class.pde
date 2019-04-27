class Line {
  float YPos = height+random(10,500);
  float YPosChange = random(10,15);
  float FinalY = random(100,400);
  float XPos = random(200,width-200);
  float YVel = random(10);
  ArrayList<Dot> Particles = new ArrayList<Dot>();
  
  void Draw() {
    fill(255,255,255);
    for (int i = 0; i < Particles.size(); i++) {
      Dot part = Particles.get(i);
      if (part.TimeAlive == 0) {
        Particles.remove(i);
      }
      part.Draw();
    }
    circle(XPos,YPos,5);
    YPos -= YPosChange;
    YPosChange -= 0.1;
    if ((YPos < FinalY) || (YPosChange < 1)) {
      Explode();
      YPos = height+random(10,500);
      XPos = random(50,width-50);
      YPosChange = random(10,15);
      FinalY = random(50,450);
    }
  }
  
  void Explode() {
    String Direction = "";
    color Colour = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    for (int i = 0; i < 100; i++) {
      if (i <= 50) {
        Direction = "Left";
      } else {
        Direction = "Right";
      }
      Particles.add(new Dot(XPos,YPos, Direction,Colour));
      
    }  
  }
 
}
