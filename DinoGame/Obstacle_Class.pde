class Obstacle {
  float Type = random(1);
  float XPos;
  float Speed = 10;
  
  Obstacle(int xpos) {
    XPos = xpos;
  }
  
  void Draw() {
    if (Type < 0.45) {
      rect(XPos,475,75,75); //Small cacti
    } else if (Type < 0.85) {
      rect(XPos,475,100,75); //Large cacti
    } else if (Type < 0.9) {
      rect(XPos,425,50,50); //Low bird
    } else if (Type < 0.95) {
      rect(XPos,400,50,50);//Medium bird
    } else if (Type < 1) {
      rect(XPos,375,50,50);//High bird
    }     
  }
  
  void Move() {
    XPos -= Speed;
  }
  
  void Reset() {
    if (XPos < -100) {
      XPos = 2600;
      Type = random(1);
    }
    
  }


}
