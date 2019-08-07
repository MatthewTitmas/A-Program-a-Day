class Block {
  PVector Position;
  float Width;
  color Colour;

  Block(float X, float Y, color Col) {
    Position = new PVector(X, Y);
    Width = BlockWidth;
    Colour = Col;
  }

  void Show(int XChange, int YChange) {
    noStroke();
    fill(Colour);
    rect(Position.x-XChange, Position.y-YChange, Width, Width);
  }
}

class Dirt extends Block {
  Dirt(float X, float Y) {
    super(X, Y, #8F614A);
  }
}

class Air extends Block {
  Air(float X, float Y) {
    super(X, Y, color(255, 0, 0, 0));
  }
}

class Grass extends Block {
  Grass(float X, float Y) {
    super(X, Y, color(#51CB6B));
  }
}

class Trunk extends Block {
  Trunk(float X, float Y) {
    super(X, Y, color(#7C3D00));
  }
}

class Leaves extends Block {
  Leaves(float X, float Y) {
    super(X, Y, color(#897E3D));
  }
}
