class Node {
  PVector Pos;
  Node Left;
  Node Right;
  String Value;
  int Layer;

  Node(String NewValue, float XPos, float YPos, int layer) {
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
    if (Value != null) {
      text(Value, Pos.x, Pos.y);
    }
  }

  void AddNode(String ToAdd, int Count) {
    if (Count == CurrentNode.size()) {
      if (ToAdd.equals("(")) {
        Left = new Node(null, Pos.x-width/pow(2, Layer), Pos.y+200, Layer+1);
        CurrentNode.add(false);
      } else if (ToAdd.equals("+") || ToAdd.equals("-") || ToAdd.equals("/") || ToAdd.equals("*")) {
        Value = ToAdd;
        Right = new Node(ToAdd, Pos.x+width/pow(2, Layer), Pos.y+200, Layer+1);
        CurrentNode.add(true);
      } else if (ToAdd.equals(")")) {
        CurrentNode.remove(CurrentNode.size()-1);
      } else {
        Value = ToAdd;
        CurrentNode.remove(CurrentNode.size()-1);
      }
    } else {      
      if (CurrentNode.get(Count) == false) {
        Left.AddNode(ToAdd, Count+1);
      } else {
        Right.AddNode(ToAdd, Count+1);
      }
    }
  }


  void Move(float XChange, float YChange) {
    Pos.x += XChange;
    Pos.y += YChange;
    if (Right != null) {
      Right.Move(XChange, YChange);
    }
    if (Left != null) {
      Left.Move(XChange, YChange);
    }
  }
}
