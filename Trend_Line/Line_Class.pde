class Line {
  float Gradient;
  float Intercept;

  Line(float gradient, float intercept) {
    Gradient = gradient;
    Intercept = map(-intercept, -Scale*8, Scale*8, 20, Height+20);
    //End = new PVector((20-NewIntercept)/-Gradient,20);
    //Start = new PVector((820-NewIntercept)/-Gradient,820);
    //Start = new PVector(Width/2+20,NewIntercept);
    //End = new PVector(Width/2+30,NewIntercept);
  }


  void Show() {
    stroke(0, 0, 255);
    strokeWeight(3);
    float MaxY;
    float MinY;
    for (int x = -800; x <= 800; x++) {
      float y = x*-Gradient+Intercept; 
      if (y < 820 && y > 20) {
        point(map(x, -800, 800, 20, 820), y);
      }
    }
  }
}
