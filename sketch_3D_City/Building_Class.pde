class Cell {
  PVector Position;
  float Height;
  float Width;
  color Colour;

  Cell(float XPos, float ZPos, float H, float W) {
    Height = random(W, W*3);
    Width = W;
    if (this instanceof Building) {
      Colour = floor(random(64, 192));
    } else {
      Height = Width + random(0, Width/2);
      Colour = color(floor(random(128, 256)), floor(random(0, 15)), 0);
    }
    Position = new PVector(XPos, -Height/2, ZPos);
  }

  void Render() {
    fill(Colour);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    box(Width, Height, Width);

    if (this instanceof House) {
      beginShape(QUADS);
      fill(#673E0F);
      vertex(Width/2, -Height/2, -Width/2);
      vertex(-Width/2, -Height/2, -Width/2);
      vertex(-Width/2, -Height+Height/3, 0); 
      vertex(Width/2, -Height+Height/3, 0);

      vertex(-Width/2, -Height+Height/3, 0);
      vertex(Width/2, -Height+Height/3, 0);
      vertex(Width/2, -Height/2, Width/2);
      vertex(-Width/2, -Height/2, Width/2);

      vertex(Width/2, -Height/2, -Width/2);
      vertex(Width/2, -Height+Height/3, 0);
      vertex(Width/2, -Height/2, Width/2);
      vertex(Width/2, -Height/2, -Width/2);
      
      vertex(-Width/2,-Height/2,-Width/2);
      vertex(-Width/2,-Height/2,Width/2);
      vertex(-Width/2,-Height+Height/3,0);  
      vertex(-Width/2,-Height+Height/3,0);       

      endShape();
    }
    popMatrix();
  }
}

class Building extends Cell {
  Building(float XPos, float ZPos, float H, float W) {
    super(XPos, ZPos, H, W);
  }
}

class House extends Cell {
  House(float XPos, float ZPos, float H, float W) {
    super(XPos, ZPos, H, W);
  }
}
