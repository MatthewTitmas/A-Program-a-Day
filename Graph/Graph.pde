void setup() {
  size(800,800);
}

void draw() {
  background(255);
  DrawGrid();
  translate(400,400);
  stroke(255,0,0);
  beginShape();
  strokeWeight(1);
  noFill();
  for(float x = -10; x < 11; x += 0.05) {
    float X = map(x,-10,10,-400,400);
    float Y = map((x*x*x)+(2*x*x)-(10*x) + 10,-100,100,-400,400);
    vertex(X,-Y);
  }
  endShape();
}


void DrawGrid() {
  stroke(0,0,0,200);
  strokeWeight(1);
  float Spacing = width/20;
  for (int y = 0; y < width; y += Spacing) {
    line(0,y,height,y);
    line(y,0,y,width);
  }
  stroke(0);
  strokeWeight(3);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
}
