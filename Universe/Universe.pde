PShape Sun;
float RotX = 0;
float RotY = 0;
float Zoom = 0.2;
ArrayList<Planet> Planets;

void setup() {
  frameRate(60);
  size(1000,1000,P3D);
  background(0);
  PImage SunTexture = loadImage("Sun.jpg");
  Sun = createShape(SPHERE,500);
  Sun.setStroke(false);
  Sun.setTexture(SunTexture);
  Planets = new ArrayList<Planet>();
  Planets.add(new Planet(700,20,loadImage("Mercury.jpg"),0.0005,0.12,1)); // Mercury
  Planets.add(new Planet(1200,40,loadImage("Venus.jpg"),0.00012,0.05,1)); // Venus
  Planets.add(new Planet(1700,50,loadImage("Earth.jpg"),0.03,0.03,1));    // Earth
  Planets.add(new Planet(2450,25,loadImage("Mars.jpg"),0.03,0.015,2));    // Mars
  Planets.add(new Planet(7700,300,loadImage("Jupiter.jpg"),0.09,0.0025,1));
}

void draw() {
  lights();
  background(0);
  translate(width/2,height/2);
  scale(Zoom);
  rotateY(RotX);
  rotateX(RotY);
  shape(Sun);
  translate(-(width/2),-(height/2));
  for (Planet CurrentPlanet : Planets) {
    CurrentPlanet.Draw();
    CurrentPlanet.Update();
  }
  
}

void mouseDragged() {
  float rate = 0.01;
  RotY += (pmouseY-mouseY) * rate;
  RotX += (mouseX-pmouseX) * rate;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  Zoom += e/50;
  
}
  
