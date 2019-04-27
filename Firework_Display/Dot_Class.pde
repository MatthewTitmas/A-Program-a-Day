class Dot {
  float XPos;
  float YPos;
  String Direction;
  color Colour;
  int TimeAlive = 25 + int(random(-5,10));
  float YPosChange = random(-2,-10);
  float YPosChangeSquared = random(0,0.2);
  float XPosChange = random(0,1.3);
  int Amount = int(random(20,50));
  Dot(float Xpos, float Ypos, String direction, color colour) {
    XPos = Xpos;
    YPos = Ypos + random(-10,10);
    Colour = colour;
    Direction = direction;

  }
 void Draw() {
   fill(Colour);
   if (Direction == "Left") {
     XPos -= XPosChange;
   } else {
     XPos += XPosChange;
   }
   YPos += YPosChange;
   YPosChange += YPosChangeSquared;
   YPosChange += 0.1;
   TimeAlive -= 1;
   circle(XPos,YPos,4);
 }
}
