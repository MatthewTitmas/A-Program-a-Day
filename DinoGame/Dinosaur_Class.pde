class Dinosaur {
  float YPos = 450;
  float YVel = 0;
  float YAcc = 0;
  float Gravity = 0.5;
  boolean Duck = false;
  
  void Move() {
    YPos -= YVel;
    YVel -= Gravity;
    if (YPos > 450) {
      YPos = 450;
      YVel = 0;
    }
  }
  
  void Show() {
    fill(0);
    if (Duck == false) {
      rect(100,YPos,75,100);    
    } else {
      rect(100,YPos+50,100,50);
    }
  }
}
