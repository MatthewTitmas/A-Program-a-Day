class Board {
  float Fitness;
  int DistanceToApple;
  NeuralNetwork Brain;
  int TurnsWithoutFood;
  int Length = 1;
  PVector Position;
  int Direction;
  Cell[][] Cells;
  int HeadCellX;
  int HeadCellY;
  ArrayList<PVector> Body;
  boolean Dead = false;
  PVector FoodPos;
  int FoodY;
  int FoodX;

  Board(float x, float y) {
    Direction = 1;
    Position = new PVector(x, y);
    Cells = new Cell[Rows][Rows];
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j] = new Cell(Position.x + i*Spacing, Position.y + j*Spacing);
      }
    }
    FoodX = int(random(0, Rows));
    FoodY = int(random(0, Rows));
    Cells[FoodX][FoodY].Food = true;
    HeadCellX = 3;
    HeadCellY = 5;
    Body = new ArrayList<PVector>();
    Body.add(new PVector(3, 5));
    Cells[3][5].Occupied = true;
    Body.add(new PVector(2, 5));
    Cells[2][5].Occupied = true;
    Brain = new NeuralNetwork();
  }


  void Show() {
    fill(0);
    stroke(255);
    strokeWeight(1);
    rect(Position.x, Position.y, SpaceBetweenPlayers, SpaceBetweenPlayers);

    for (int i = 0; i < Body.size(); i++) {
      PVector Current = Body.get(i);
      Cells[int(Current.x)][int(Current.y)].Show();
    }
    fill(255, 0, 0);
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        if (Cells[i][j].Food) {
          Cells[i][j].Show();
        }
      }
    }
  }

  void Update() {
    if (dist(HeadCellX,HeadCellY,FoodX,FoodY) > DistanceToApple) {
      Fitness -= 10;
    }
    TurnsWithoutFood += 1;
    PVector ToRemove = Body.get(Body.size()-1);
    Body.remove(Body.size()-1);
    Cells[int(ToRemove.x)][int(ToRemove.y)].Occupied = false;

    float[] Inputs;
    Inputs = new float[5];
    if (HeadCellY > 0) {
      if (Cells[HeadCellX][HeadCellY-1].Occupied == true) {
        Inputs[0] = 1;
      }
    } else {
      Inputs[0] = 1;
    }
    if (HeadCellY < 7) {
      if (Cells[HeadCellX][HeadCellY+1].Occupied == true) {
        Inputs[1] = 1;
      } else {
        Inputs[1] = 1;
      }
    }
    if (HeadCellX > 0) {
      if (Cells[HeadCellX-1][HeadCellY].Occupied == true) {
        Inputs[2] = 1;
      } else {
        Inputs[2] = 1;
      }
    }
    if (HeadCellX < 7) {
      if (Cells[HeadCellX+1][HeadCellY].Occupied == true) {
        Inputs[3] = 1;
      } else {
        Inputs[3] = 1;
      }
    }
    float Angle = (atan((FoodX-HeadCellX))/(FoodY-HeadCellY));
    Inputs[4] = Angle/PI;
    Matrix Output = Brain.ForwardPropogation(Matrix.Array(Inputs));
    int OldDirection = Direction;
    int Direction = Output.ShowMax();
    println(Direction);


    switch (Direction) {
    case 0:
      if (OldDirection != 2) {
        HeadCellY -= 1;
      } else {
        HeadCellY += 1;
      }
      break;
    case 1:
      if (OldDirection != 3) {
        HeadCellX += 1;
      } else {
        HeadCellX += -1;
      }
      break;
    case 2:
      if (OldDirection != 0) {
        HeadCellY += 1;
      } else {
        HeadCellY += -1;
      }
      break;
    case 3:
      if (OldDirection != 1) {
        HeadCellX -= 1;
      } else {
        HeadCellX += 1;
      }
      break;
    }
    if (HeadCellX < 0 || HeadCellY < 0 || HeadCellX >= Rows || HeadCellY >= Rows || TurnsWithoutFood >= 50) {
      Dead = true;
    }

    if (!Dead) {
      Body.add(0, new PVector(HeadCellX, HeadCellY));
      if (Cells[HeadCellX][HeadCellY].Occupied && Cells[HeadCellX][HeadCellY].Food == false) {
        Dead = true;
      }
      Cells[HeadCellX][HeadCellY].Occupied = true;

      if (HeadCellX == FoodX && HeadCellY == FoodY) {
        Length += 1;
        PVector NewPos = new PVector(Body.get(1).x, Body.get(1).y);
        Body.add(NewPos);
        Cells[FoodX][FoodY].Food = false;
        Cells[FoodX][FoodY].Occupied = false;
        FoodX = int(random(0, Rows));
        FoodY = int(random(0, Rows));
        Cells[FoodX][FoodY].Food = true;
        Cells[FoodX][FoodY].Occupied = true;
        TurnsWithoutFood = 0;
        Fitness += 100;
      }
    }
  }

  void Reset() { 
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j] = new Cell(Position.x + i*Spacing, Position.y + j*Spacing);
      }
    }
    TurnsWithoutFood = 0;
    Direction = 1;
    Length = 2;
    Body = new ArrayList<PVector>();
    Body.add(new PVector(3, 5));
    Body.add(new PVector(2, 5));
    HeadCellX = 3;
    HeadCellY = 5;
    Cells[FoodX][FoodY].Food = false;
    Cells[FoodX][FoodY].Occupied = false;
    FoodX = int(random(0, Rows));
    FoodY = int(random(0, Rows));
    Cells[FoodX][FoodY].Food = true;
    Cells[FoodX][FoodY].Occupied = true;
    Dead = false;
  }
}
