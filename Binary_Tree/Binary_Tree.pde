BinaryTree Tree;
int Value;
TextBox Numbers;
float XMoved = 0;
float YMoved = 0;

void setup() {
  Tree = null;
  size(800, 800);
  Numbers = new TextBox(20, 720, 300, 60);
}


void draw() {
  pushMatrix();
  translate(XMoved,YMoved);
  background(0);
  if (Tree != null) {
    Tree.Show();
  } else {
    fill(255);
    noStroke();
    ellipse(width/2, 50, 50, 50);
  }
  popMatrix();
  fill(127);
  stroke(127);
  rect(0, height-100, width, 100);
  Numbers.Show();
  Value = int(Numbers.Text);
}


void keyPressed() {
  if (keyCode == ENTER) {
    if (Tree == null) {
      Tree = new BinaryTree(Value);
    } else {
      Tree.AddNode(Value);
    }
    Numbers.Text = "";
    Value = 0;
  } else {
    int Variable = key-48; 
    if (Variable < 10 && Variable > -1) {
      if (Numbers.Selected) {
        Numbers.Text += Variable;
      }
    }
  }
  if (keyCode == BACKSPACE) {
    if (Numbers.Selected) {
      Numbers.Text = Numbers.Text = Numbers.Text.substring(0, Numbers.Text.length()-1);
    }
  }
}


void mousePressed() {
  Numbers.Selected = false;
  if (mouseX < 320 && mouseX > 20 && mouseY > 720 && mouseY < 780) {
    Numbers.Selected = true;
  }
}

void mouseDragged() {
  XMoved += (mouseX-pmouseX);
  YMoved += (mouseY-pmouseY);
}
