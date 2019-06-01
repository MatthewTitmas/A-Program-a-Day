class Pipe {
  float XPos;
  float StoredXPos;
  float Width = 50;
  float Height = random(150, 450);
  float GapSize = 200;
  PVector Rect1;
  PVector Rect1Width;
  PVector Rect2;
  PVector Rect2Width;
  boolean BirdsPassed;

  Pipe(float X) {
    XPos = X;
    StoredXPos = X;
  }

  void Show() {
    imageMode(CORNER);
    Rect1 = new PVector(XPos, 0);
    Rect1Width = new PVector(Width, Height);
    Rect2 = new PVector(XPos, Height+GapSize);
    Rect2Width = new PVector(Width, height-Height-GapSize-62);
    image(PipeTop, Rect1.x, Height- PipeTop.height);
    image(PipeBottom, Rect2.x, Rect2.y);
  }

  void Update(Player[] Birds) {
    XPos -= RateOfChange;
    if (XPos + 50 < 50 && BirdsPassed == false) {
      BirdsPassed = true;
      for (int i = 0; i < Birds.length; i++) {
        if (Birds[i].Dead != true) {
          Birds[i].PipesPassed++;
        }
      }
    }
    if (XPos + 50 < 0) {
      XPos = 650;
      Height = random(150, 450);
      BirdsPassed = false;
    }
  }

  void Reset() {
    XPos = StoredXPos;
    Height = random(150, 450);
    BirdsPassed = false;
  }
}
