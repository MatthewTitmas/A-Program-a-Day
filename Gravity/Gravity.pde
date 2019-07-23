Planet Planets[];
Star Sun;
float G = 100;

void setup() {
  background(0);
  size(800, 800);
  Planets = new Planet[30];
  for (int i = 0; i < Planets.length; i++) {
    Planets[i] = new Planet(random(width), random(height), random(-2, 2), random(-2, 2), random(0.1, 5));
  }
  Sun = new Star(width/2, height/2, 40);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  Sun.Show();
  for (int i = 0; i < Planets.length; i++) {
    Planets[i].Show();
    Planets[i].Update();
    Planets[i].CalculateForces(Sun);
  }
}
