class LightningStrike {
  ArrayList<PVector> Lines;
  float BeginningWeight;
  float BeginningY;
  ArrayList<LightningStrike> Children;

  LightningStrike(float x, float y, float Weight, boolean Child) {
    Lines = new ArrayList<PVector>();
    BeginningY = y;
    BeginningWeight = Weight;
    Children = new ArrayList<LightningStrike>();

    float X = x;
    float Y = y;
    float Theta = HALF_PI;
    Lines.add(new PVector(X, Y));
    while (Y < height && X > 0 && X < width) {
      Theta += random(-PI/10, PI/10);
      if (Theta < 0) {
        Theta = 0;
      } else if (Theta > PI) {
        Theta = PI;
      }
      float Distance = random(5, 15);
      X = X+Distance*cos(Theta);
      Y = Y+Distance*sin(Theta);
      Lines.add(new PVector(X, Y));
      if (random(1) < 0.01 && !Child) {
        Children.add(new LightningStrike(X,  Y, map(Y, BeginningY, height, BeginningWeight, 1), true));
      }
    }
  }

  void Show() {
    stroke(255);
    for (int i = 0; i < Lines.size()-1; i++) {
      PVector First = Lines.get(i);
      PVector Second = Lines.get(i+1);
      strokeWeight(map(First.y, BeginningY, height, BeginningWeight, 1));
      line(First.x, First.y, Second.x, Second.y);
    }
    for (LightningStrike Child : Children) {
      Child.Show();
    }
  }
}
