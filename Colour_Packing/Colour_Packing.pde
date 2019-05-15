ArrayList<Circle> Circles;
PImage Image;
void setup() {
  size(1024,512);
  background(255);
  Circles = new ArrayList<Circle>();
  Image = loadImage("ToDraw.jpg");
  loadPixels();
  image(Image,width/2,0);
}

void draw() {
  AddCircle();
  for (Circle Current : Circles) {
    if (Current.Growing) {
      Current.CheckGrowth(Circles);
      Current.Show();
      Current.Update();
    }
  }
}

void AddCircle() {
  for (int FoundSpots = 0; FoundSpots < 100;) {
    boolean Possible = true;
    float XPos = random(0,width/2);
    float YPos = random(0,height);
    for (Circle Current : Circles) {
      if (((XPos - Current.Position.x) * (XPos - Current.Position.x)) + ((YPos - Current.Position.y) * (YPos - Current.Position.y)) < (Current.Diameter/2) * (Current.Diameter/2)) {
        Possible = false;
      }
    } if (Possible == true) {  
      FoundSpots += 1;
      color Colour = Image.pixels[int(XPos)+int(YPos)*Image.width];
      Circles.add(new Circle(XPos,YPos,Colour));
    }
  }
}
