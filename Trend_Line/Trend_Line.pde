int Width = 800;
int Height = 800;
int Scale = 100;

ArrayList<PVector> Points;
Line ToDraw;

void setup() {
  size(840, 840);
  Points = new ArrayList<PVector>();
}

void draw() {
  background(255);
  textSize(16);
  fill(0);
  stroke(0);
  textAlign(CENTER, CENTER);
  for (int i = 0; i <= Width; i+= 100) {
    int Text = floor(map(i, 0, Width, -Scale*8, Scale*8));
    strokeWeight(1);
    if (i == Width/2) {
      strokeWeight(2);
      textAlign(CENTER, CENTER);
      textSize(32);
      text("0", Width/2+20, Height/2+17);
    } else {
      textSize(16);
      textAlign(CENTER, TOP);
      text(Text, i+20, Height/2+20);
      textAlign(RIGHT, CENTER);
      text(-Text, Width/2+20, i+20);
    }
    line(i+20, 20, i+20, Height+20);
    line(20, i+20, Width+20, i+20);
  }
  fill(255, 0, 0);
  noStroke();
  for (PVector Current : Points) {
    ellipse(Current.x, Current.y, 10, 10);
  }
  fill(0, 255, 0); 
  if (ToDraw != null) {
    if (Points.size() > 2) {      
      ToDraw.Show();
    }
  }
}

void mouseClicked() {
  if (mouseX > 20 && mouseY > 20 && mouseX < Width+20 && mouseY < Height+20) {
    Points.add(new PVector(mouseX, mouseY));
    CalculateLine();
  }
}

void CalculateLine() {
  float SumX = 0;
  float SumY = 0;
  for (PVector Current : Points) {
    float XPos = map(Current.x, 20, Width+20, -Scale*8, Scale*8);
    float YPos = -map(Current.y, 20, Height+20, -Scale*8, Scale*8);
    SumX += XPos;
    SumY += YPos;
  }
  SumX /= Points.size();
  SumY /= Points.size();


  float SumNum = 0;
  float SumDen = 0;
  for (PVector Current : Points) {
    float XPos = map(Current.x, 20, Width+20, -Scale*8, Scale*8);
    float YPos = -map(Current.y, 20, Height+20, -Scale*8, Scale*8);
    SumNum += (XPos-SumX)*(YPos-SumY);
    SumDen += sq(XPos-SumX);
  }
  float Gradient = SumNum/SumDen;
  float Intercept = SumY - (SumX*(SumNum/SumDen));
  if (Points.size() > 1) {
    ToDraw = new Line(Gradient, Intercept);
  }
}
