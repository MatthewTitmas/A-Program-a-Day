class Enemy {
  PVector Position;
  PVector Change = new PVector();
  PVector WantedPosition;
  float XDifference;
  float YDifference;
  float Angle;
  float Speed = random(3,5);
  int Current = 0;
  Health CurrentHealth;
  Path TrackToFollow = new Path();
  
    Enemy() {
      Position = TrackToFollow.Points.get(0);
      WantedPosition = TrackToFollow.Points.get(1);
      XDifference = WantedPosition.x - Position.x;
      YDifference = WantedPosition.y - Position.y;
      Angle = atan(YDifference/XDifference);
      Change.x = Speed*cos(Angle);
      Change.y = Speed*sin(Angle);
      Current += 1;
      CurrentHealth = new Health(100);
    }
  
  void Show() {
    stroke(1);
    fill(255);
    rectMode(CENTER);
    rect(Position.x,Position.y,30,60);
    CurrentHealth.Show(Position.x,Position.y);
    Position.x += Change.x;
    Position.y += Change.y;
  }
  
  void Update() {
    if (dist(Position.x,Position.y,WantedPosition.x,WantedPosition.y) < Speed + 1) {
      WantedPosition = TrackToFollow.Points.get(Current);
      XDifference = WantedPosition.x - Position.x;
      YDifference = WantedPosition.y - Position.y;
      Angle = atan(YDifference/XDifference);
      if (XDifference < 0) {
        Angle += PI;
      }
      Change.x = Speed*cos(Angle);
      Change.y = Speed*sin(Angle);
      Current += 1;
    }
  }
}
