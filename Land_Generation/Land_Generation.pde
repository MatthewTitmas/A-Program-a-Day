int Rows = 50;
int Cols = 50;
float Spacing;
float XOff;
float YOff;
float[][] Heights;
float Width = 1600;
float Height = 3200;
float Flying;

void setup() {
  size(800, 800, P3D);
  Spacing = Width/Rows;
  Heights = new float[Cols][Rows];
}

void draw() {
  Flying -= 0.1;
  XOff = 0;
  YOff = Flying;
  for (int i = 0; i < Cols; i++) {
    XOff += 0.1;
    for (int j = 0; j < Rows; j++) {
      Heights[i][j] = map(noise(XOff,YOff),0,1,-100,100);
      YOff += 0.1;
    }
    YOff = Flying;
  }
  background(0);
  noFill();
  stroke(255);
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-Width/2, -Height/3);
  for (int i = 0; i < Cols-1; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < Rows-1; j++) {
      vertex(i*Spacing, j*Spacing, Heights[i][j]);
      vertex((i+1)*Spacing, (j+1)*Spacing, Heights[i+1][j+1]);
    }
    endShape();
  }
}
