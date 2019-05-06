class Logo {
  PImage StarWars = loadImage("StarWarsLogo.png");
  float Size = 1.5;
  float Opacity = 255;
  
  void Show() {
    tint(255, Opacity);
    imageMode(CENTER);
    image(StarWars,0,0,1280*Size,773*Size);
    if (Size < 0.05) {
      Size -= 0.003;
      Opacity -= 10;
    } else {
      Size -= 0.003;
    }
  }
}
