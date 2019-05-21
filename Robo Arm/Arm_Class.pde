class Arm {
  PVector StartPos;
  PVector EndPos;
  float Length;
  float ExtraAngle = 0;
  float Angle = 0;
  
  Arm(float Len) {
    StartPos = new PVector(0,0);
    EndPos = new PVector(0,0);
    Length = Len;
  }
  
  
  void Show() {
    stroke(255);
    strokeWeight(13);
    line(StartPos.x,StartPos.y,EndPos.x,EndPos.y);
  }
  
  void Update(PVector Mouse) {
    Mouse.x -= width/2;
    Mouse.y -= height/2;
    Angle = Mouse.heading();
    EndPos.x = StartPos.x + cos(Angle+ExtraAngle)*Length;
    EndPos.y = StartPos.y + sin(Angle+ExtraAngle)*Length;
  }
  
  void Follow(Arm First) {
    StartPos.x = First.EndPos.x;
    StartPos.y = First.EndPos.y;
  }
  
  void ExtraAngle(float Distance) {
    ExtraAngle = acos(Distance/Length);
  }
}
