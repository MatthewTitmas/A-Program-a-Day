class Node {
  PVector Pos;
  Node Left;
  Node Right;
  int Value;
  int Layer;

  Node(int NewValue, float XPos, float YPos, int layer) {
    Value = NewValue;
    Left = null;
    Right = null;
    Pos = new PVector(XPos, YPos);
    Layer = layer;
  }

  void Show(float XPos, float YPos) {
    if (Left != null) {
      Left.Show(Pos.x, Pos.y);
    }
    if (Right != null) {
      Right.Show(Pos.x, Pos.y);
    }
    textAlign(CENTER, CENTER);
    textSize(15);
    stroke(255);
    line(Pos.x, Pos.y, XPos, YPos);
    noStroke();
    fill(255);
    ellipse(Pos.x, Pos.y, 50, 50);
    fill(0);
    text(Value, Pos.x, Pos.y);
  }

  void AddNode(int ValueToAdd) {
    if (ValueToAdd > Value) {
      if (Right != null) {
        Right.AddNode(ValueToAdd);
      } else {
        Right = new Node(ValueToAdd, Pos.x+width/pow(2, Layer), Pos.y+200, Layer + 1);
      }
    } else if (ValueToAdd < Value) {
      if (Left != null) {
        Left.AddNode(ValueToAdd);
      } else {
        Left = new Node(ValueToAdd, Pos.x-width/pow(2, Layer), Pos.y+200, Layer + 1);
      }
    }
  }
}
