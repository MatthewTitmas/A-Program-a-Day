class Star {
  PVector Position = new PVector(random(-width/2,width/2),random(-height/2,height/2));
  float Diameter = random(1,3);
  
  void Show() {
    noStroke();
    ellipse(Position.x,Position.y,Diameter,Diameter);
  }
  
}
