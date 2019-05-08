Dot CurrentDot;
float Approximation;
float Inside = 0;
float Outside = 0;

void setup() {
  size(400,400);
  background(255);
  ellipse(width/2,height/2,width,height);
}

void draw() {
  for(int i = 0; i < 1000; i++) {
    CurrentDot = new Dot();
    CurrentDot.Show();
    if (CurrentDot.Colour ==  color(#0000FF)) {
      Inside += 1;
      Outside += 1;
    } else {
      Outside += 1;
    }
  }
}

void mousePressed() {
  Approximation = (Inside/Outside) * 4;
  println(Approximation);
}
