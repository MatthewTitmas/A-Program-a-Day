PImage Dog;
ArrayList<Circle> Circles;

void setup() {
  size(800, 800);
  Dog = loadImage("Dog.jpg");
  Circles = new ArrayList<Circle>();
  Circles.add(new Circle(width/4, height/4, width/4, Dog.get(width/4, height/4)));
  Circles.add(new Circle(3*width/4, height/4, width/4, Dog.get(3*width/4, height/4)));
  Circles.add(new Circle(3*width/4, 3*height/4, width/4, Dog.get(3*width/4, 3*height/4)));
  Circles.add(new Circle(width/4, 3*height/4, width/4, Dog.get(width/4, 3*height/4)));
}

void draw() {
  background(255);
  for (Circle Current : Circles) {
    Current.Show();
  }
  for (int i = Circles.size() - 1; i >= 0; i--) {
    Circle Current = Circles.get(i);
    if (Current.Intersects(mouseX, mouseY) && Current.Radius > 1) {
      Current.Split();
      Circles.remove(i);
    }
  }
  if (mousePressed) {
    image(Dog, 0, 0);
  }
}
