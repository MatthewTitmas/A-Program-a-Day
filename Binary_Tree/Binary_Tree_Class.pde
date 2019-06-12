class BinaryTree {
  Node Root;
  int Layer = 2;

  BinaryTree(int Value) {
    Root = new Node(Value, width/2, 50, 1);
  }

  void Show() {
    Root.Show(Root.Pos.x,Root.Pos.y);
  }

  void AddNode(int ValueToAdd) {
    if (ValueToAdd > Root.Value) {
      if (Root.Right != null) {
        Root.Right.AddNode(ValueToAdd);
      } else {
        Root.Right = new Node(ValueToAdd, Root.Pos.x+width/pow(2,Layer), Root.Pos.y+200, Layer+1);
      }
    } else if (ValueToAdd < Root.Value) {
      if (Root.Left != null) {
        Root.Left.AddNode(ValueToAdd);
      } else {
        Root.Left = new Node(ValueToAdd, Root.Pos.x-width/pow(2,Layer), Root.Pos.y+200, Layer+1);
      }
    }
  }
}
