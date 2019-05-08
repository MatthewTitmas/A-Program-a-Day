ArrayList<Point> Points;
float Numerator = 1;
float Denominator = 1;
float Result = 0;
float MinY = 8/3;
float MaxY = 4;

void setup() {
  Points = new ArrayList<Point>();
  size(600,600);
  background(255);
}

void draw() {
  background(255);
  strokeWeight(1);
  noFill();
  Result += Numerator/Denominator;
  Numerator *= -1;
  Denominator += 2;
  float Map = map((Result*4), MaxY, MinY, 0, height);
  line(0,map(PI,4,8/3,0,height),width,map(PI,MaxY,MinY,0,height));
  Points.add(new Point(Map));
  float Seperation = width/float(Points.size());
  println(Result*4);
  beginShape();
  for (int i = 0; i < Points.size(); i ++) {
    Point Current = Points.get(i);
    vertex(i*Seperation,Current.Value);
  }
  endShape();
}
