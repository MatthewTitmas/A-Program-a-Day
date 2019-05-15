ArrayList<Node> Nodes;


void setup() {
  size(800,800);
  background(255);
  Nodes = new ArrayList<Node>(2);
  Nodes.add(new Node(100,10,true));
  Nodes.add(new Node(75,10,false));
}

void draw() {
  translate(width/2,height/2);
  background(255);
  for (Node Current : Nodes) {
    Current.Show();
    if (!(Current.Clicked)) {
      Current.Update();
    } else {
      Current.Move(mouseX,mouseY);
    }
  }
}

void mouseReleased() {
  for (Node Current : Nodes) {
    Current.Clicked = false;
  }
}
void mousePressed() {
  float MouseX = mouseX-400;
  float MouseY = mouseY-400;
  for (Node Current : Nodes) {
    if ((MouseX-Current.Position.x) * (MouseX-Current.Position.x) + (MouseY-Current.Position.y) * (MouseY-Current.Position.y) < Current.Mass/2*Current.Mass/2) {
      Current.Clicked = true;
      for (Node NewCurrent : Nodes) {
        NewCurrent.Main = false;
      }
      Current.Main = true;
    }
  }
}
