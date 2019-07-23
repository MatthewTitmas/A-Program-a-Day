class BarFive {
  PVector Position;
  float Radius;
  float Percentage;

  BarFive(float XPos, float YPos, float w) {
    Position = new PVector(XPos, YPos);
    Radius = w;
  }

  void Show() {
    noFill();
    strokeWeight(3);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
    fill(255);
    noStroke();
    for (int i = 0; i < 360; i += 20) {
      if (i > Percentage) {
        fill(255, 50);
      } else {
        fill(255);
      }
      ellipse(Position.x+Radius*(float(20)/float(16))*cos(radians(i-90)), Position.y+Radius*(float(20)/float(16))*sin(radians(i-90)), 10, 10);
    }
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(floor(map(Percentage, 0, 360, 0, 100))+"%", Position.x, Position.y);
  }

  void Update() {
    Percentage = map(Percent, 0, 100, 0, 360);
    if (Percentage > 360) {
      Percentage = 360;
    }
  }
}
