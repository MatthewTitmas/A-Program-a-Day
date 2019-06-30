class Textbox {
  String Text;
  float Width;
  float Height;
  PVector Position;
  boolean Chosen;
  String NullText;
  boolean Star;

  Textbox(float XPos, float YPos, float W, float H, String Text, boolean star) {
    Position = new PVector(XPos, YPos);
    Width = W;
    Height = H;
    Chosen = false;
    NullText = Text;
    Text = "";
    Star = star;
  }

  void Show() {
    textSize(40);
    textAlign(LEFT, TOP);
    if (Text == null) {
      fill(255, 127);
      text(NullText, Position.x, Position.y+10);
    } else {
      fill(255);
      if (Star) {
        String StarText = "";
        for (int i = 0; i < Text.length(); i++) {
          StarText += "*";
        }
        text(StarText, Position.x, Position.y+10);
      } else {
        text(Text, Position.x, Position.y+10);
      }
    }
  }

  void AddText(char CharToAdd) {
    if (Text == null) {
      Text = str(CharToAdd);
    } else {
      Text += CharToAdd;
    }
  }

  void RemoveText() {
    if (Text.length() != 0) {
      Text = Text.substring(0, Text.length()-1);
    }
    if (Text.length() == 0) {
      Text = null;
    }
  }
}
