class HorizontalSlider {
  PVector StartPos;
  PVector EndPos;
  PVector[] Locations;
  PVector CurrentLocation;
  float Value;
  float Gap;
  float Length;
  int Sections;

  HorizontalSlider(float XPos, float YPos, float Size, int sections) {
    StartPos = new PVector(XPos, YPos);
    EndPos = new PVector(XPos+Size, YPos);
    Length = Size;
    Sections = sections;
    Gap = Length/(Sections-1);
    Locations = new PVector[Sections];
    for (int i = 0; i < Sections; i++) {
      Locations[i] = new PVector(XPos + i*Gap, YPos);
    }
    CurrentLocation = Locations[0].copy();
  }


  void Show() {
    line(StartPos.x, StartPos.y-10, StartPos.x, StartPos.y+10);
    line(StartPos.x, StartPos.y, EndPos.x, EndPos.y);
    line(EndPos.x, StartPos.y-10, EndPos.x, StartPos.y+10);
    rectMode(CENTER);
    fill(230);
    for (int i = 0; i < Locations.length; i++) {
      rect(CurrentLocation.x, CurrentLocation.y, 30, 30);
    }
  }

  void Move(int XPos) {
    CurrentLocation = Locations[1].copy();
    for (int i = 0; i < Locations.length; i++) {
      if (abs(XPos - Locations[i].x) < abs(XPos - CurrentLocation.x)) {
        CurrentLocation = Locations[i].copy();
      }
    }
    Value = (CurrentLocation.x)/Gap - (Sections-1);
  }

  void Reset() {
    CurrentLocation = Locations[0].copy();
  }
}
