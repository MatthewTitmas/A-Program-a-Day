class Key {
  PVector Position;
  float Width;
  float Height;
  color Colour;
  AudioPlayer Sound;

  Key(float X, float Y, float W, float H, color Col, AudioPlayer sound) {
    Position = new PVector(X, Y);
    Width = W;
    Height = H;
    Colour = Col;
    Sound = sound;
  }

  void Show() {
    fill(Colour);
    rect(Position.x, Position.y, Width, Height);
  }

  boolean Intersects(float X, float Y) {
    if (X > Position.x && X < Position.x+Width && Y > Position.y && Y < Position.y+Height) {
      Sound.pause();
      Sound.rewind();
      Sound.play();
      return true;
    }
    return false;
  }
}


class WhiteKey extends Key {
  WhiteKey(float X, float Y, float W, float H, AudioPlayer Sound) {
    super(X, Y, W, H, color(255), Sound);
  }
}


class BlackKey extends Key {
  BlackKey(float X, float Y, float W, float H, AudioPlayer Sound) {
    super(X, Y, W, H, color(0), Sound);
  }
}
