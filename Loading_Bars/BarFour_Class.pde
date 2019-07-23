class BarFour {
  PVector Position;
  float Radius;
  float Percentage;
  
  BarFour(float XPos, float YPos, float w) {
    Position = new PVector(XPos,YPos);
    Radius = w;
  }
  
  void Show() {
    noFill();
    ellipse(Position.x,Position.y,Radius*2,Radius*2);
    ellipse(Position.x,Position.y,Radius*8/5,Radius*8/5);
    strokeWeight(15);
    arc(Position.x,Position.y,Radius*9/5,Radius*9/5,-HALF_PI,radians(Percentage)-HALF_PI);
    fill(255);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(floor(map(Percentage,0,360,0,100))+"%",Position.x,Position.y);
  }
  
  void Update() {
    Percentage = map(Percent,0,100,0,360);
    if (Percentage > 360) {
      Percentage = 360;
    }
  }
  
}
