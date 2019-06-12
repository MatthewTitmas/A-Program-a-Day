class Streak {
  Symbol[] Symbols;
  boolean Gone;

  Streak() {
    int x = floor(random(10, 25));
    float XPos = random(0, width);
    float YPos = random(-700, 0);
    Symbols = new Symbol[x];
    int Colour = 255;
    for (int i = 0; i < x; i++) {
      YPos -= TextSize;
      Symbols[i] = new Symbol(XPos, YPos, Colour);
      Colour = #1FF81F;
    }
    Gone = false;
  }

  void NewChar() {
    for (int i = 0; i < Symbols.length; i++) {
      Symbols[i].NewChar();
    }
  }

  void Update() {
    for (int i = 0; i < Symbols.length; i++) {
      Symbols[i].Update();
    }
  }

  void Show() {
    for (int i = 0; i < Symbols.length; i++) {
      Symbols[i].Show();
    }
  }

  void CheckGone() {
    boolean GoneCheck = true;
    for (int i = 0; i < Symbols.length; i++) {
      if (!Symbols[i].CheckGone()) {
         GoneCheck = false;
      }
    }
    Gone = GoneCheck;
  }
}
