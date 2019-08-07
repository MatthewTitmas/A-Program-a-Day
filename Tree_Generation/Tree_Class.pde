class Tree {
  ArrayList<PVector> Positions;
  ArrayList<Branch> Branches;
  PVector Start;

  Tree(float X, float Y) {
    Start = new PVector(X, Y);
  }

  void GenerateTree() {
    Reset();
    boolean CarryOn = true;
    float YPos = Positions.get(0).y;
    float XPos = Positions.get(0).x;
    int Count = 0;
    float Angle = 3*HALF_PI;
    while (YPos > 100) {
      Angle += random(-PI/10, PI/10);
      XPos += cos(Angle)*50;
      YPos += sin(Angle)*50;
      Positions.add(new PVector(XPos, YPos));
      if (random(1) < map(YPos, 100, height, 0, 0.8)) {
        Branches.add(new Branch(XPos, YPos, Angle, true));
        Branches.get(Branches.size()-1).Grow();
      }
      Count++;
    }
  }

  void DrawTree() {
    noStroke();
    fill(#9D7940);
    rect(Start.x-floor(map(Start.y, height, 0, 45, 0))/2, Start.y, floor(map(Start.y, height, 0, 45, 0)), 20);
    for (int i = 0; i < Positions.size()-1; i++) {
      PVector One = Positions.get(i);
      PVector Two = Positions.get(i+1);
      strokeWeight(floor(map(One.y, height, 0, 45, 0)));
      stroke(#9D7940);
      line(One.x, One.y, Two.x, Two.y);
    }
    PVector One = Positions.get(Positions.size()-2);
    PVector Two = Positions.get(Positions.size()-1);
    strokeWeight(floor(map(One.y, height, 0, 45, 0)));
    stroke(#9D7940);
    line(One.x, One.y, Two.x, Two.y);
    for (Branch Current : Branches) {
      Current.Show();
    }
  }

  void Reset() {
    Positions = new ArrayList<PVector>();
    Branches = new ArrayList<Branch>();
    Positions.add(new PVector(Start.x, Start.y));
  }
}
