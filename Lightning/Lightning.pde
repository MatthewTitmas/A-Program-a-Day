LightningStrike Strike;
PVector RainVelocity;
ArrayList<Rain> RainDrops;
PImage Background;

void setup() {
  size(800, 800);
  RainDrops = new ArrayList<Rain>();
  RainVelocity = new PVector(0.7, 5);
  for (int i = 0; i < 250; i++) {
    RainDrops.add(new Rain(random(-width/2, width), random(-height)));
  }
  Background = loadImage("Background.png");
  image(Background,0,0);
}

void draw() {
  rectMode(CORNER);
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  if (random(1) < 0.01) {
    LightningStrike Strike = new LightningStrike(random(width), 0, 10, false);
    image(Background, 0, 0);
    Strike.Show();
  }
  for (Rain Drop : RainDrops) {
    Drop.Show();
  }
  fill(#845747);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, 30);
  rect(0,0,30,height);
  rect(width-30,0,30,height);
  rect(0,height-30,width,30);
  rectMode(CENTER);
  rect(width/2,height/2,20,height);
  rect(width/2,height/2,width,20);
}
