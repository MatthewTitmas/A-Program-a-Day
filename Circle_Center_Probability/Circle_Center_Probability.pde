int Inside;
int Total;
PVector Point1;
PVector Point2;
PVector Point3;

void setup() {
  //frameRate(5);
  size(400, 400);
}


void draw() {
  background(0);
  fill(255);
  ellipse(width/2, height/2, 300, 300);
  ellipse(width/2, height/2, 10, 10);
  for (int i = 0; i < 100; i++) {
    float Random1 = random(0, TWO_PI);
    float Random2 = random(0, TWO_PI);
    float Random3 = random(0, TWO_PI);

    Point1 = new PVector(width/2 + 150*cos(Random1), height/2 + 150*sin(Random1));
    Point2 = new PVector(width/2 + 150*cos(Random2), height/2 + 150*sin(Random2));
    Point3 = new PVector(width/2 + 150*cos(Random3), height/2 + 150*sin(Random3));


    boolean Intersect = FindIfPointInTriangle(Point1, Point2, Point3);
    if (Intersect) {
      Inside++;
      fill(0, 0, 255, 100);
    } else {
      fill(255, 0, 0, 100);
    }
    Total += 1;
  }
  beginShape();
  vertex(Point1.x, Point1.y);
  vertex(Point2.x, Point2.y);
  vertex(Point3.x, Point3.y);
  endShape(CLOSE);

  fill(255);
  float Percent = float(Inside)/float(Total);
  textSize(40);
  text(Percent, 10, 40);
}

boolean FindIfPointInTriangle(PVector Vertex1, PVector Vertex2, PVector Vertex3) {
  PVector Center = new PVector(width/2, height/2);
  float TotalArea = Area(Vertex1, Vertex2, Vertex3);
  float Area1 = Area(Vertex1, Vertex2, Center);
  float Area2 = Area(Vertex1, Center, Vertex3);
  float Area3 = Area(Center, Vertex2, Vertex3);
  if (TotalArea >= Area1+Area2+Area3-5 && TotalArea <= Area1+Area2+Area3+5) {
    return true;
  }
  return false;
}

float Area(PVector Vertex1, PVector Vertex2, PVector Vertex3) {
  float Area = abs(Vertex1.x * (Vertex2.y - Vertex3.y) + Vertex2.x * (Vertex3.y - Vertex1.y) + Vertex3.x * (Vertex1.y-Vertex2.y))/2;
  return Area;
}
