class Planet {
  ArrayList<Moon> Moons;
  float Distance;
  float Radius;
  PImage Image;
  PShape Globe;
  float XPos = 0;
  float YPos = 0;
  float Angle = 0;
  float RotationSpeed;
  float SpinSpeed;
  
  Planet(float distance, float radius, PImage image, float rotationspeed, float spinspeed, int MoonAmount) {
    Distance = distance;
    Radius = radius;
    Image = image;
    RotationSpeed = rotationspeed;
    SpinSpeed = spinspeed;
    Globe = createShape(SPHERE, Radius);
    Globe.setStroke(false);
    Globe.setTexture(Image);
    Moons = new ArrayList<Moon>(MoonAmount);
    for (int i = 0; i < MoonAmount; i++) {
      Moons.add(new Moon(Radius*1.5,Distance,Radius/5));
    }
  }
  
  
  void Draw() {
    translate(width/2+XPos,height/2,YPos);
    shape(Globe);
    Globe.rotateY(RotationSpeed);
    translate(-(width/2+XPos),-height/2,-(YPos));
    for (Moon CurrentMoon : Moons) {
      CurrentMoon.Draw();
    }
  }
  
  void Update() {
    Angle += SpinSpeed;
    XPos = Distance * cos(Angle);
    YPos = Distance * sin(Angle);
    for (Moon CurrentMoon : Moons) {
      CurrentMoon.Update(XPos,YPos);
    }
  }
}
