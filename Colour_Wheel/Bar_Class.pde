class Bar {
  PVector Vertex1 = new PVector(0,0);
  PVector Vertex2 = new PVector(0,0);
  PVector Vertex3 = new PVector(0,0);
  float Position;
  float Colour;
  
  Bar(float Pos, float I) {
    Colour = I;
    Position = Pos;
  }
  
  void Show() {
    fill(Colour,255,255);
    noStroke();
    beginShape();
    vertex(Vertex1.x,Vertex1.y);
    vertex(Vertex2.x,Vertex2.y);    
    vertex(Vertex3.x,Vertex3.y);   
    endShape();
  }
  
  void Update() {
    float X1 = 300*sin(radians(Position));
    float Y1 = 300*cos(radians(Position));
    float X2 = 300*sin(radians(Position+2));
    float Y2 = 300*cos(radians(Position+2));   
    Vertex2.x = X1;
    Vertex2.y = Y1;
    Vertex3.x = X2;
    Vertex3.y = Y2;
  }
}
