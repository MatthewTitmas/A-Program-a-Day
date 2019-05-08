class Dot {
  PVector Position;
  color Colour;
  
  Dot() {
    Position = new PVector(random(width),random(height));
    if (((Position.x - width/2) * (Position.x - width/2)) + ((Position.y - height/2) * (Position.y - height/2)) < ((width/2)*(width/2))) {
      Colour = color(#0000FF);
    } else {
      Colour = color(#FF0000);
    }
  }
  
  void Show() {
    stroke(Colour);
    fill(Colour);
    ellipse(Position.x,Position.y,1,1);
  }
}
