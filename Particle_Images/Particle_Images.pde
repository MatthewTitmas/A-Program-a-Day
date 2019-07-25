PImage Image;
int Cols = 50;
ArrayList<Particle> Particles;
color BackGroundColour;
boolean Selecting;

PImage Batman;
PImage Superman;

void setup() {
  frameRate(30);
  size(800, 800);
  Selecting = true;
  Batman = loadImage("Batman.png");
  Superman = loadImage("Superman.png");
}

void draw() {
  if (Selecting) {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(0);
    text("Select an image", 400, 50);
    image(Batman, 0, 200);
    image(Superman, 400, 200);
  } else {
    background(BackGroundColour);
    //image(Image,0,0);

    for (Particle Current : Particles) {
      Current.Show();
      Current.Update();
    }
  }
}

void mouseClicked() {
  if (Selecting) {
    if (mouseX > 0 && mouseX < 400 && mouseY > 200 && mouseY < 600) {
      SetPic(loadImage("Batman.png"));
    } else if (mouseX > 400 && mouseX < 800 && mouseY > 200 && mouseY < 600) {
      SetPic(loadImage("Superman.png"));
    }
  } else {
    Selecting = true;
  }
}

void SetPic(PImage image) {
  Image = image;
  Particles = new ArrayList<Particle>();
  float Spacing = 400/Cols;
  BackGroundColour = Image.pixels[0];
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      if (Image.get(int(i*Spacing), int(j*Spacing)) != BackGroundColour) {
        Particles.add(new Particle(random(0, width), random(0, height), 200+(i*Spacing), 200+(j*Spacing), 5, Image.get(int(i*Spacing), int(j*Spacing))));
      }
    }
  }
  Selecting = false;
}
