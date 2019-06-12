BinaryTree Tree;
String Expression = "( ( ( 10 + 3 ) * ( 3 - 4 ) ) / ( 16 + 9 ) )";
String[] EquationArray;
ArrayList<Boolean> CurrentNode;


void setup() {
  CurrentNode = new ArrayList<Boolean>();
  Tree = new BinaryTree();
  size(800, 800);
  EquationArray = split(Expression, " ");
  for (int x = 0; x < EquationArray.length; x++) {
    Tree.AddNode(EquationArray[x]);
  }
}


void draw() {
  background(0);
  if (Tree != null) {
    Tree.Show();
  } else {
    fill(255);
    noStroke();
    ellipse(width/2, 50, 50, 50);
  }
  noLoop();
}
