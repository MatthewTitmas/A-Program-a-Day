class Moon {
  float XPos = 0;
  float YPos = 0;
  float PlanetXPos = 0;
  float PlanetYPos = 0;
  float DistanceFromPlanet;
  float DistanceFromSunToPlanet;
  PShape Globe;
  float Angle = random(0,2*PI);
  
  Moon(float distance, float PlanetSun, float diameter) {
    DistanceFromPlanet = distance;
    DistanceFromSunToPlanet = PlanetSun;
    Globe = createShape(SPHERE,diameter + random(-10,10));
    Globe.setTexture(loadImage("Moon.jpg"));
    Globe.setStroke(false);
  }
  
  void Draw() {
    translate(width/2 + XPos + PlanetXPos, height/2, YPos + PlanetYPos);
    shape(Globe);
    Globe.rotateY(0.005);
    translate(-(width/2 + XPos + PlanetXPos), -(height/2), -(YPos + PlanetYPos));
  }
  
  void Update(float xpos, float ypos) {
    PlanetXPos = xpos;
    PlanetYPos = ypos;
    XPos = DistanceFromPlanet * cos(Angle);
    YPos = DistanceFromPlanet * sin(Angle);
    Angle += 0.1;
  }
}
