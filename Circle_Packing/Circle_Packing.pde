ArrayList<Circle> Circles;
boolean CarryOn = true;

void setup() {
  size(800,800);
  background(255);
  Circles = new ArrayList<Circle>();
}

void draw() {
  background(255);
  if (CarryOn) {
    AddCircle();
    for (Circle Current : Circles) {
      Current.Show();
      Current.Update();
      Current.CheckGrowth(Circles);
    }
  } else {
    for (Circle Current : Circles) {
      Current.Show();
    }
  }
}

void AddCircle() {
  int Count = 0;
  for (int FoundSpots = 0; FoundSpots < 20;) {
    Count += 1;
    boolean Possible = true;
    float XPos = random(0,width);
    float YPos = random(0,height);
    for (Circle Current : Circles) {
      if (((XPos - Current.Position.x) * (XPos - Current.Position.x)) + ((YPos - Current.Position.y) * (YPos - Current.Position.y)) < (Current.Diameter/2) * (Current.Diameter/2)) {
        Possible = false;
      }
    } if (Possible == true) {  
      FoundSpots += 1;
      Circles.add(new Circle(XPos,YPos));
    }
    if (Count > 1000) {
      CarryOn = false;
      println("No more spots found");
      break;
    }
  }
}
