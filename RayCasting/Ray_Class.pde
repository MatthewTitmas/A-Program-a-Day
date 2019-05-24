class Ray {
  PVector Position;
  float Angle;
  
  Ray(float X, float Y, float angle) {
    Position = new PVector(X,Y);
    Angle = angle;
  }

  
  PVector Cast(Wall Wall) {
    float x1 = Wall.StartPos.x;
    float y1 = Wall.StartPos.y;
    float x2 = Wall.EndPos.x;
    float y2 = Wall.EndPos.y;
    
    float x3 = Position.x;
    float y3 = Position.y;
    float x4 = Position.x + 10*cos(Angle);
    float y4 = Position.y + 10*sin(Angle);
    
    float Denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (Denominator == 0) {
      return null;
    }
    
    float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / Denominator;
    float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / Denominator;
    
    if (t > 0 && t < 1 && u > 0) {
      PVector Point;
      Point = new PVector((x1 + t * (x2 - x1)),(y1 + t * (y2 - y1)));

      return Point;
    } else {
      return null;
    }
  }
  
  
}
