class Shot {
  PVector Position;
  PVector Velocity;
  float Angle;
  boolean Finished;
  
  Shot(float XPos, float YPos, float angle) {
    Finished = false;
    Angle = angle+PI/2;
    Position = new PVector(XPos,YPos);
    Velocity = new PVector(10*cos(Angle), 10*sin(Angle));
  }
  
  void Show() {
    float Heading = Position.heading();
    PVector EndPos = new PVector(Position.x + 15*cos(Angle), Position.y + 15*sin(Angle));
    line(Position.x,Position.y, EndPos.x, EndPos.y);
  }
  
  void Update() {
    Position.add(Velocity);
    if (Position.x < 0 || Position.x > width || Position.y < 0 || Position.y > height) {
      Finished = true;
    }
  }
  
  boolean Intersects(Asteroid Meteor) {
    if ((Position.x - Meteor.Position.x) * (Position.x - Meteor.Position.x) + (Position.y - Meteor.Position.y) * (Position.y - Meteor.Position.y) < Meteor.Radius*Meteor.Radius) {
      return true;
    }
    return false;
  }
}
