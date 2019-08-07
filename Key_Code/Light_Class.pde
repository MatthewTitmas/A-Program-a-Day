class Light {
  PVector Position;
  float Radius;
  String Correct;
  
  Light(float X, float Y, float R) {
    Position = new PVector(X,Y);
    Radius = R;
    Correct = null;
  }
  
  void Show() {
    if (Correct == null) {
      fill(50);
    } else if (Correct == "False") {
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    ellipse(Position.x,Position.y,Radius*2,Radius*2);
  }
}
