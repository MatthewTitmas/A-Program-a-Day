int AmountOfPoints = 300;
int Rate = 5;
int CurrentNumber;
Point[] Points;
Arrow RateChange;
Arrow AmountOfPointsChange;


void setup() {
  size(1200, 800);
  RateChange = new Arrow(875, 75, 50, 100);
  AmountOfPointsChange = new Arrow(875, 200, 50, 100);
  Reset();
}

void draw() {
  int Connection = (CurrentNumber*Rate % AmountOfPoints);
  line(Points[CurrentNumber].Position.x, Points[CurrentNumber].Position.y, Points[int(Connection)].Position.x, Points[Connection].Position.y);
  if (CurrentNumber < AmountOfPoints-1) {
    CurrentNumber++;
  }
  fill(255);
  rect(800, -1, 400, height+1);
  RateChange.Show();
  textSize(16);
  textAlign(LEFT);
  fill(0);
  text("Rate: "+Rate, 950, 133);
  AmountOfPointsChange.Show();
  fill(0);
  text("Amount Of Points: "+AmountOfPoints, 950, 258);
}

void mouseClicked() {
  if (mouseX < 800) {
    Reset();
  }
  if (RateChange.Intersects(mouseX, mouseY)) {
    Rate += RateChange.TopBottom(mouseX, mouseY);
    Reset();
  }
  if (Rate < 1) {
    Rate = 1;
  }
  if (AmountOfPointsChange.Intersects(mouseX, mouseY)) {
    AmountOfPoints += AmountOfPointsChange.TopBottom(mouseX, mouseY)*10;
    Reset();
  }
  if (AmountOfPoints < 10) {
    AmountOfPoints = 10;
  }
}

void Reset() {
  fill(200);
  noStroke();
  rect(0, 0, 800, height);
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(400, height/2, 600, 600);
  fill(0);
  Points = new Point[AmountOfPoints];
  float Spacing = 360/float(AmountOfPoints);
  for (int i = 0; i < AmountOfPoints; i++) {
    Points[i] = new Point(400+300*cos(radians(i*Spacing)), height/2+300*sin(radians(i*Spacing)));
  }
  CurrentNumber = 1;
  for (int i = 0; i < AmountOfPoints; i++) {
    Points[i].Show();
  }
}
