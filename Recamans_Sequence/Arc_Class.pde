class Arc {
  float Start;
  float End;
  float OriginalX;
  float Width;
  boolean Orientation;
  Arc(float X1, float X2, boolean Bool) {
    Start = X1;
    End = X2;
    OriginalX = ((X1+X2)/2);
    Width = abs(X1-X2);
    Orientation = Bool;
  }

  void Show() {
    noFill();
    stroke(50);
    float NewX = map(OriginalX,0,Numbers.length,0,width);
    float Rate = OriginalX/NewX;
    float NewWidth = Width/Rate;
    if (Orientation) {
      arc(NewX, height/2, NewWidth, NewWidth, PI, TWO_PI);
    } else {
      arc(NewX, height/2, NewWidth, NewWidth, 0, PI);
    }
  }
}
