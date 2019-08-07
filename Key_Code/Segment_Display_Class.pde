class SevenSegment {
  PVector Position;
  float Width;
  float Height;
  Box[] Boxes;
  int[] HexNumbers = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};

  SevenSegment(float X, float Y, float W, float H) {
    Position = new PVector(X, Y);
    Width = W;
    Height = H;
    Boxes = new Box[7];
    float He = 0.6*W;
    float Wi = 0.2*W;
    Boxes[0] = new Box("Horizontal", Wi, He, 0.2*W, 0);
    Boxes[1] = new Box("Vertical", Wi, He, 0.8*W, 0.2*W);
    Boxes[2] = new Box("Vertical", Wi, He, 0.8*W, W);
    Boxes[3] = new Box("Horizontal", Wi, He, 0.2*W, 1.6*W);
    Boxes[4] = new Box("Vertical", Wi, He, 0, W);
    Boxes[5] = new Box("Vertical", Wi, He, 0, 0.2*W);
    Boxes[6] = new Box("Horizontal", Wi, He, 0.2*W, 0.8*W);
  }

  void Show(String N) {
    pushMatrix();
    translate(Position.x, Position.y);
    if (N.equals("Nope")) {
      for (Box Current : Boxes) {
        Current.Show(false);
      }
    } else {
      int Binary = HexNumbers[int(N)];
      for (Box Current : Boxes) {
        if (binary(Binary, 7).charAt(0) == '1') {
          Current.Show(true);
        } else {
          Current.Show(false);
        }
        Binary = Binary << 1;
      }
    }
    popMatrix();
  }
}






class Box {
  boolean Orientation;
  float Width;
  float Height;
  PVector Position;
  // True = Vertical, False = Horizontal
  Box(String Orient, float Value1, float Value2, float X, float Y) {
    Position = new PVector(X, Y);
    if (Orient == "Vertical") {
      Orientation = true;
    } else {
      Orientation = false;
    }
    Height = Value2;
    Width = Value1;
    if (Orientation == false) {
      Height = Value1;
      Width = Value2;
    }
  }

  void Show(boolean Result) {
    fill(255, 0, 0, 50);
    if (Result == true) {
      fill(255, 0, 0);
    }
    noStroke();
    rect(Position.x, Position.y, Width, Height);
  }
}
