class Circle {
  PVector Position;
  float Angle = 0;
  float AngleChange = 0;
  int Velocity = 0;
  ArrayList<Ray> Rays;
  
  Circle(float X, float Y) {
    Position = new PVector(X,Y);
    Rays = new ArrayList<Ray>();
    for (int x = -45; x < 45; x++) {
      Rays.add(new Ray(Position.x,Position.y,radians(x)));
    }
  }
  
  void Show() {
    fill(255,0,0);
    ellipse(Position.x,Position.y,20,20);
    stroke(0,0,255);
    line(Position.x,Position.y,Position.x+100*cos(Angle),Position.y+100*sin(Angle));
    ArrayList<Float> Distances = new ArrayList();
    for (Ray CurrentRay : Rays) {
      CurrentRay.Angle += AngleChange;
      CurrentRay.Position.x += Velocity*cos(Angle);
      CurrentRay.Position.y += Velocity*sin(Angle);
      float Distance = 100000;
      PVector SavedPoint = new PVector(0,0);
      for (Wall CurrentBoundary : Walls) {
        PVector Intersect = CurrentRay.Cast(CurrentBoundary);
        if (Intersect != null) {
          float NewDistance = dist(Intersect.x,Intersect.y,Position.x,Position.y);
          if (NewDistance < Distance) {
            SavedPoint = Intersect;
            Distance = NewDistance;
          }
        }
      }
      Distance *= cos(CurrentRay.Position.heading());
      Distances.add(Distance);
      stroke(255);
      //vertex(SavedPoint.x,SavedPoint.y);
      line(SavedPoint.x,SavedPoint.y,Position.x,Position.y);
    }
    float ThreeDimensionalSpacing = float(width/2) / float(Distances.size());
    translate(width/2,0);
    float Current;
    rectMode(CENTER);
    for (int x = 0; x < Distances.size(); x++) {
      Current = Distances.get(x);
      stroke(map(Current,0,250,255,0));
      fill(map(Current,0,250,255,0));
      float Height = map(Current,0,300,height,0);
      rect(x*ThreeDimensionalSpacing + ThreeDimensionalSpacing/2,height/2,ThreeDimensionalSpacing,Height);
    }
    
  }
  
  void Update() {
    Angle += AngleChange;
    Position.x += Velocity*cos(Angle);
    Position.y += Velocity*sin(Angle);
  }
}
