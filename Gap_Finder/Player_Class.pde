class Snake {
  PVector Position;
  float Angle = PI/2;
  float AngleChange;
  float Velocity = 2;
  float Radius = 5;
  boolean Dead = false;


  Snake(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
  }

  void Show() {
    noStroke();
    ellipse(Position.x, Position.y, 2*Radius, 2*Radius);
  }

  void Update() {
    if (Position.x - Radius < 0 || Position.y - Radius < 0 || Position.x + Radius > width || Position.y + Radius > height) {
      Dead = true;
    }
    Angle += AngleChange;
    Position.x += Velocity*cos(Angle);
    Position.y += Velocity*sin(Angle);
    if (Dead) {
      frameCount = 20;
      Position.x = 50;
      Position.y = 50;
      Velocity = 2;
      Angle = PI/2;
      background(0);
      Dead = false;
      for (int i= 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
          Pixels[i][j] = new Pixel();
        }
      }
    }
  }

  void UpdatePixels() {
    for (int i = max(0, floor(Position.x-20)); i < min(width-1, floor(Position.x+20)); i++) {
      for (int j = max(0, floor(Position.y-20)); j < min(height-1, floor(Position.y+20)); j++) {
        if ((i-Position.x) * (i-Position.x) + (j-Position.y)*(j-Position.y) < Radius * Radius) {
          noStroke();
          if (frameCount % 90 > 20) {
            if (Pixels[i][j].Checked == true && Pixels[i][j].Hovered == false) {
              Dead = true;
            } else {
              Pixels[i][j].Checked = true;
              Pixels[i][j].Hovered = true;
              fill(#FFF454);
              ellipse(i, j, 1, 1);
            }
          }
        } else {
          Pixels[i][j].Hovered = false;
        }
      }
    }
  }
}
