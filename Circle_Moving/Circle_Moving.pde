Circle[] Circles;
int[] Connections;
int AmountOfCircles = 10;

void setup() {
  size(800, 800);
  Circles = new Circle[AmountOfCircles];
  Connections = new int[AmountOfCircles];
  for (int i = 0; i < AmountOfCircles; i++) {
    Circles[i] =  new Circle(random(width), random(height), random(10, 30));
    Connections[i] = floor(random(AmountOfCircles));
  }
}


void draw() {
  background(0);
  for (int i = 0; i < Connections.length; i++) {
    strokeWeight(3);
    stroke(127);
    line(Circles[i].Position.x, Circles[i].Position.y, Circles[Connections[i]].Position.x, Circles[Connections[i]].Position.y);
  }

  for (int i = 0; i < AmountOfCircles; i++) {
    Circles[i].Show();
    Circles[i].Update();
  }
  
  if (random(0,100) < 3) {
    int i = floor(random(0,AmountOfCircles));
    Connections[i] = floor(random(10));
  }
}
