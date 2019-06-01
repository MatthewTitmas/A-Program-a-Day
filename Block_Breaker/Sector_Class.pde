class Sector {
  PVector Position;
  float Width;
  float Height;
  boolean BlockInSector;
  int BlockType = int(random(0, 2));
  PVector[] SpritePositions = new PVector[4];

  // 0 - 4 Horizontal
  // 1 - 4 Vertical
  // 2 - L Shape
  // 3 - Backwards L Shape
  // 4 - Square
  // 5 - T Shape

  Sector (float XPos, float YPos, float W, float H) {
    Position = new PVector(XPos, YPos);
    Width = W;
    Height = H;
    BlockInSector = false;
  }

  void Show() {
    fill(255, 0, 255);
    rect(Position.x, Position.y, Width, Height);
    if (BlockInSector) {
      pushMatrix();
      fill(255,0,0);
      translate(Position.x+Width/2,Position.y+Height/2);
      for (int i = 0; i < SpritePositions.length; i++)
        rect(SpritePositions[i].x,SpritePositions[i].y,50,50,10);
      popMatrix();
    }
  }

  void GiveBlock() {
    int OldType = BlockType;
    while (OldType == BlockType) {
      BlockType = int(random(0, 2));
    }
    BlockInSector = true;
    switch (BlockType) {
      case 0:
        SpritePositions[0] = new PVector(-100, -30);
        SpritePositions[1] = new PVector(-50, -30);
        SpritePositions[2] = new PVector(0, -30);
        SpritePositions[3] = new PVector(50, -30);
        break;
      case 1:
        SpritePositions[0] = new PVector(-30, -100);
        SpritePositions[1] = new PVector(-30, -50);
        SpritePositions[2] = new PVector(-30, 0);
        SpritePositions[3] = new PVector(-30, 50);
        break;
      case 2:
        SpritePositions[0] = new PVector(-25, -65);
        SpritePositions[1] = new PVector(-75, -15);
        SpritePositions[2] = new PVector(-25, -15);
        SpritePositions[3] = new PVector(25, -15);
        break;
      case 3:
        SpritePositions[0] = new PVector(-50, -75);
        SpritePositions[1] = new PVector(-50, -25);
        SpritePositions[2] = new PVector(-50, 25);
        SpritePositions[3] = new PVector(0, 25);
        break;
    }
  }
}
