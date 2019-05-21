Arm First;
Arm Second;
int Length = 200;

void setup() {
  size(800,800);
  background(0);
  First = new Arm(Length);
  Second = new Arm(Length);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  float Distance = dist(0,0,mouseX-width/2,mouseY-height/2);
  if (Distance < Length*2) {
    PVector MouseLocation = new PVector(mouseX,mouseY);
    float SeperateDistances = Distance/2;
    First.ExtraAngle(SeperateDistances);
    if (mouseX-400 < 0) {
      //First.ExtraAngle = -First.ExtraAngle;
    }
    First.Update(MouseLocation);
    Second.EndPos.x = mouseX-width/2;
    Second.EndPos.y = mouseY-height/2;
    Second.Follow(First);
    Second.Show();
    First.Show();
    
  } else {
    First.ExtraAngle = 0;
    Second.ExtraAngle = 0;
    PVector MouseLocation = new PVector(mouseX,mouseY);
    First.Show();
    First.Update(MouseLocation);
    MouseLocation = new PVector(mouseX,mouseY);
    Second.Show();
    Second.Follow(First);
    Second.Update(MouseLocation);
  }
}
