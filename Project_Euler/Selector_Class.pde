class Selector {
  PVector Position;
  float Width;
  float Height;
  float TotalHeight;
  int AmountOfBars;
  float Percent;

  ArrayList<Bar> Bars;
  Slider Slide;

  Selector(float XPos, float YPos, float W, float H) {
    Position = new PVector(XPos, YPos);
    Height = H;
    Width = W-30;
    AmountOfBars = 0;
    TotalHeight = 0;
    Bars = new ArrayList<Bar>();
    Slide = new Slider(Position.x+Width, Position.y, 30, height);
  }


  void Show() {
    Percent = -Slide.RectPosition.y/(height-Slide.RectHeight);
    float Change = Percent * (TotalHeight-height);
    for (Bar Current : Bars) {
      Current.Show(Change);
    }
    Slide.Show();
  }

  void AddBar(String Text) {
    Bars.add(new Bar(Position.x, Position.y+Height*AmountOfBars, Width, Height, AmountOfBars+1, Text));
    AmountOfBars++;
    TotalHeight += Height;
  }

  boolean Intersects(int X, int Y) {
    if (X > Position.x && X < Position.x + Width && Y > Position.y && Y < Position.y + height) {
      for (Bar Current : Bars) {
        Current.Selected = false;
      }
      for (Bar Current : Bars) {
        if (Current.Intersects(X,Y)) {
          Current.Selected = true;
        }
      }
      return true;
    }
    return false;
  }
}

class Slider {
  boolean Selected;
  PVector Position;
  float Width;
  float Height;


  PVector RectPosition;
  float RectWidth;
  float RectHeight;

  Slider(float XPos, float YPos, float W, float H) {
    Position = new PVector(XPos, YPos);
    Width = W;
    Height = H;
    RectPosition = new PVector(XPos, YPos);
    RectWidth = W;
    RectHeight = 50;
    Selected = false;
  }

  void Show() {
    fill(50);
    rect(Position.x, Position.y, Width, Height);
    fill(200);
    if (Selected) {
      fill(150);
    }
    rect(RectPosition.x, RectPosition.y, RectWidth, RectHeight);
  }

  boolean Intersects(float X, float Y) {
    if (X > RectPosition.x && X < RectPosition.x+RectWidth && Y > RectPosition.y && Y < RectPosition.y + Height) {
      Selected = true;
      return true;
    }
    Selected = false;
    return false;
  }
}



class Bar {
  boolean Selected;
  PVector Position;
  float Width;
  float Height;
  float Change;
  int ID;
  String Text;

  Bar(float XPos, float YPos, float W, float H, int Id, String text) {
    Position = new PVector(XPos, YPos);
    Width = W;
    Height = H;
    ID = Id;
    Text = text;
  }

  void Show(float change) {
    Change = change;
    if (Selected) {
      fill(200);
    } else {
      fill(255);
    }
    rect(Position.x, Position.y + Change, Width, Height);
    fill(0);
    textAlign(LEFT);
    textSize(48);
    text(ID, Position.x+10, Position.y+3*Height/4 + Change);
    textSize(20);
    text(Text, Position.x + 90, Position.y+5*Height/8 + Change);
  }
  
  boolean Intersects(int X, int Y) {
    if (X > Position.x && X < Position.x + Width && Y > Position.y + Change && Y < Position.y + Change + Height) {
      return true;
    }
    return false;
  }
}
