ArrayList<Circle> Circles;

void setup() {
  size(800,800);
  colorMode(RGB);
  Circles = new ArrayList<Circle>();
  for (int i = 0; i < 10; i++) {
    Circles.add(new Circle(random(100,width-100),random(100,height-100),random(0,3),random(0,3),random(10,20)));
  }
}

void draw() {
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float Dist = 0;
      for (Circle Current : Circles) {
        Dist += 100 * Current.GetDist(i,j);
      }
      pixels[i*width+j] = color(Dist);
    }
  }
  updatePixels();
  
  for (Circle Current : Circles) {
    Current.Update();
  }
}
