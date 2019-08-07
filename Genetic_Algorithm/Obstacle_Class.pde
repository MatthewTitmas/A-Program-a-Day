class Obstacle {
  PVector Position;
  float Width;
  float Height;
  Line[] Lines;
  
  Obstacle(float X, float Y, float W, float H) {
    Position = new PVector(X,Y);
    Lines = new Line[4];
    Width = W;
    Height = H;
    Lines[0] = new Line(X,Y,X+W,Y);
    Lines[1] = new Line(X+W,Y,X+W,Y+H);
    Lines[2] = new Line(X+W,Y+H,X,Y+H);
    Lines[3] = new Line(X,Y+H,X,Y);
  }
  
  void Show() {
    noStroke();
    fill(#4BE848);
    beginShape();
    vertex(Lines[0].Start.x,Lines[0].Start.y);
    vertex(Lines[1].Start.x,Lines[1].Start.y);
    vertex(Lines[2].Start.x,Lines[2].Start.y);
    vertex(Lines[3].Start.x,Lines[3].Start.y);
    endShape(CLOSE);
  }
}

class Line {
  PVector Start;
  PVector End;
  Line(float X1, float Y1, float X2, float Y2) {
    Start = new PVector(X1,Y1);
    End = new PVector(X2,Y2);
  }
}
