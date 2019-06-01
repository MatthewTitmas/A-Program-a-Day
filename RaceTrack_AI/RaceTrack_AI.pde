PShape OuterTrack;
PShape InnerTrack;
PImage CarImage;
ArrayList<Checkpoint> Checkpoints;
ArrayList<Wall> Walls;
Player StoredCar;
Player[] Cars;


void setup() {
  PVector OuterTempStart = null;
  PVector OuterTempEnd = null;
  PVector OuterFinal = null;
  PVector InnerTempStart = null;
  PVector InnerTempEnd = null;
  PVector InnerFinal = null;
  CarImage = loadImage("Car.png");
  Cars = new Player[25];
  for (int i = 0; i < Cars.length; i++) {
    Cars[i] = new Player(325, 10, 40, 80);
  }
  Checkpoints = new ArrayList<Checkpoint>();
  Walls = new ArrayList<Wall>();
  size(900, 900);
  OuterTrack = createShape();
  InnerTrack = createShape();
  OuterTrack.beginShape();
  InnerTrack.beginShape();
  OuterTrack.fill(#966C40);
  InnerTrack.fill(#21E758);
  OuterTrack.noStroke();
  InnerTrack.noStroke();
  int ID = 0;
  for (float x = 0; x < TWO_PI; x += 0.5) {
    float XRandom = random(-50, 50);
    float YRandom = random(-50, 50);
    float OuterX = (400+XRandom)*cos(x);
    float OuterY = (400+YRandom)*sin(x);
    float InnerX = (250+XRandom)*cos(x);
    float InnerY = (250+YRandom)*sin(x);
    OuterTrack.vertex(OuterX, OuterY);
    if (OuterTempStart != null) {
      OuterTempEnd = OuterTempStart.copy();
      InnerTempEnd = InnerTempStart.copy();
    }
    OuterTempStart = new PVector(OuterX, OuterY);
    InnerTempStart = new PVector(InnerX, InnerY);
    InnerTrack.vertex(InnerX, InnerY);
    Checkpoints.add(new Checkpoint(OuterX, OuterY, InnerX, InnerY, ID));
    if (OuterTempEnd != null) {
      Walls.add(new Wall(OuterTempStart.x, OuterTempStart.y, OuterTempEnd.x, OuterTempEnd.y));
      Walls.add(new Wall(InnerTempStart.x, InnerTempStart.y, InnerTempEnd.x, InnerTempEnd.y));
    } else {
      OuterFinal = new PVector(OuterX, OuterY);
      InnerFinal = new PVector(InnerX, InnerY);
    }
    ID += 1;
  }
  Walls.add(new Wall(OuterTempStart.x, OuterTempStart.y, OuterFinal.x, OuterFinal.y));
  Walls.add(new Wall(InnerTempStart.x, InnerTempStart.y, InnerFinal.x, InnerFinal.y));
  OuterTrack.endShape();
  InnerTrack.endShape();
  println("Track Made");
}





void draw() {
  translate(width/2, height/2);
  background(#21E758);
  shape(OuterTrack, 0, 0);
  shape(InnerTrack, 0, 0);
  //for (Checkpoint Current : Checkpoints) {
  //  Current.Show();
  //}
  for (int i = 0; i < Cars.length; i++) {
    if (Cars[i].Dead != true) {
      Cars[i].Update();
    }
    Cars[i].Show();
  }
}


void mouseClicked() {
  for (int i = 0; i < Cars.length; i++) {
    boolean Temp = Cars[i].Selected;
    Cars[i].CheckClicked(mouseX-width/2, mouseY-height/2);
    if (Cars[i].Selected != Temp) {
      break;
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    int CarsSelected = 0;
    int Index = -1;
    for (int i = 0; i < Cars.length; i++) {
      if (Cars[i].Selected) {
        Index = i;
        CarsSelected +=1;
      }
    }
    if (CarsSelected != 0 && CarsSelected < 2) {
      NextGeneration(Cars[Index]);
    }
  } else if (keyCode == BACKSPACE) {
    BackWards();
  }
}

void NextGeneration(Player Parent) {
  StoredCar = Parent;
  for (int i = 0; i < Cars.length; i++) {
    Cars[i].Brain.Weights1 = Matrix.Mutate(Parent.Brain.Weights1);
    Cars[i].Brain.Weights2 = Matrix.Mutate(Parent.Brain.Weights2);
    Cars[i].Brain.Weights3 = Matrix.Mutate(Parent.Brain.Weights3);

    Cars[i].Brain.HiddenOneBias = Matrix.Mutate(Parent.Brain.HiddenOneBias);
    Cars[i].Brain.HiddenTwoBias = Matrix.Mutate( Parent.Brain.HiddenTwoBias);
    Cars[i].Brain.OutputBias =  Matrix.Mutate(Parent.Brain.OutputBias);

    Cars[i].Reset();
  }
}

void BackWards() {
  for (int i = 0; i < Cars.length; i++) {
    Cars[i].Brain.Weights1 = Matrix.Mutate(StoredCar.Brain.Weights1);
    Cars[i].Brain.Weights2 = Matrix.Mutate(StoredCar.Brain.Weights2);
    Cars[i].Brain.Weights3 = Matrix.Mutate(StoredCar.Brain.Weights3);

    Cars[i].Brain.HiddenOneBias = Matrix.Mutate(StoredCar.Brain.HiddenOneBias);
    Cars[i].Brain.HiddenTwoBias = Matrix.Mutate(StoredCar.Brain.HiddenTwoBias);
    Cars[i].Brain.OutputBias =  Matrix.Mutate(StoredCar.Brain.OutputBias);

    Cars[i].Reset();
  }
}
