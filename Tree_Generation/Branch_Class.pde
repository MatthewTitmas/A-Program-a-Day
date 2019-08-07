class Branch {
  PVector Start;
  boolean Spread;
  ArrayList<PVector> Positions;
  ArrayList<PVector> Leaves;
  float Angle;
  int Amount;

  Branch(float X, float Y, float angle, boolean Possible) {
    Start = new PVector(X, Y);
    Spread = Possible;
    Angle = angle;
    Amount = floor(map(Start.y,height,0,25,3));
    Positions = new ArrayList<PVector>();
  }

  void Grow() {
    int Count = 0;
    float YPos = Start.y;
    float XPos = Start.x;
    while (Count < Amount) {
      Angle += random(-PI/15, PI/15);
      XPos += cos(Angle)*20;
      YPos += sin(Angle)*20;
      Positions.add(new PVector(XPos, YPos));
      Count++;
    }
  }

  void Show() {
    for (int i = 0; i < Positions.size()-1; i++) {
      PVector One = Positions.get(i);
      PVector Two = Positions.get(i+1);
      strokeWeight(floor(map(One.y, height, 0, 45, 3)));
      stroke(#9D7940);
      line(One.x, One.y, Two.x, Two.y);
    }
    PVector One = Positions.get(Positions.size()-2);
    PVector Two = Positions.get(Positions.size()-1);
    strokeWeight(floor(map(One.y, height, 0, 45, 3)));
    stroke(#9D7940);
    line(One.x, One.y, Two.x, Two.y);
  }
}
