class BinaryTree {
  Node Root;
  int Layer = 2;

  BinaryTree() {
    Root = new Node(null, width/2, 50, 1);
  }

  void Show() {
    Root.Show(Root.Pos.x, Root.Pos.y);
  }

  void AddNode(String ToAdd) {
    int Count = 0;
    if (Root.Left != null) {
      if (CurrentNode.size() != 0) {
        if (CurrentNode.get(Count) == false) {
          Root.Left.AddNode(ToAdd, Count+1);
        } else {
          Root.Right.AddNode(ToAdd, Count+1);
        }
      } else {
        if (ToAdd.equals(")")) {
        } else {
          Root.Right = new Node(null, Root.Pos.x+width/pow(2, Layer), Root.Pos.y+200, Layer+1);
          CurrentNode.add(true);
          if (ToAdd.equals(")")) {
          } else {
            Root.Value = ToAdd;
          }
        }
      }
    } else {
      if (ToAdd.equals("(")) {
        CurrentNode.add(false);
        Root.Left = new Node(null, Root.Pos.x-width/pow(2, Layer), Root.Pos.y+200, Layer+1);
      }
    }
  }




  void Move(float XChange, float YChange) {
    Root.Pos.x += XChange;
    Root.Pos.y += YChange;
    if (Root.Right != null) {
      Root.Right.Move(XChange, YChange);
    }
    if (Root.Left != null) {
      Root.Left.Move(XChange, YChange);
    }
  }
}
