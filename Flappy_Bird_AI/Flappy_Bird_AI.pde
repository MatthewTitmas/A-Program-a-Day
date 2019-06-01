float RateOfChange = 2;
PImage Background;

int HighScore;

PImage ScrollBackground;
PImage Bird;
PImage PipeTop;
PImage PipeBottom;

float XPos = 0;
int AmountOfBirds = 25;
float StoredFitness = -100000;
Player StoredBird;
Pipe[] Pipes;
Player[] Birds;

void setup() {
  size(600, 900);

  // Loading Images
  Background = loadImage("BG.png");
  ScrollBackground = loadImage("Scrolling BG.png");
  Bird = loadImage("Bird.png");
  PipeTop = loadImage("PipeTop.png");
  PipeBottom = loadImage("PipeBottom.png");

  //Creating Objects
  Pipes = new Pipe[2];
  int Count = 0;
  for (int i = 0; i < Pipes.length; i++) {
    Pipes[i] = new Pipe((i+2)*(width/2)+Count);
    Count= 50;
  }
  Birds = new Player[AmountOfBirds];
  for (int i = 0; i < Birds.length; i++) {
    Birds[i] = new Player();
  }
  StoredBird = new Player();
}

void draw() {
  imageMode(CORNER);
  XPos = (XPos % 950) - RateOfChange;
  image(Background, 0, -62);
  for (int i = 0; i < Pipes.length; i++) {
    Pipes[i].Show();
    Pipes[i].Update(Birds);
  }
  image(ScrollBackground, XPos, height-62);
  image(ScrollBackground, XPos+950, height-62);
  boolean AllDead = true;
  for (int i = 0; i < Birds.length; i++) {
    if (Birds[i].Dead != true) {
      AllDead = false;
      Birds[i].Show();
      Birds[i].Update(Pipes);
      Birds[i].CheckDeath(Pipes);
    }
  }
  if (AllDead) {
    FindFittest();
  }
  int Pipes = 0;
  for (int i = 0; i < Birds.length; i++) {
    if (Birds[i].PipesPassed > Pipes) {
      Pipes = Birds[i].PipesPassed;
    }
  }
  textSize(64);
  stroke(0);
  fill(255);
  strokeWeight(3);
  if (Pipes > HighScore) {
    HighScore = Pipes;
  }
  text(Pipes, 50, 75);
  text(HighScore,500,75);
  RateOfChange += 0.001;
}

void FindFittest() {
  float Fitness = -10000;
  int FittestBirdIndex = 0;
  for (int i = 0; i < Birds.length; i++) {
    float BirdFitness = Birds[i].DistanceTraveled - Birds[i].DistanceFromGap;
    if (Fitness < BirdFitness) {
      FittestBirdIndex = i;
      Fitness = Birds[i].DistanceTraveled - Birds[i].DistanceFromGap;
    }
  }
  //if (StoredFitness < Fitness) {
    //StoredBird = Birds[FittestBirdIndex];
    //StoredFitness = Fitness;
  NextGeneration(Birds[FittestBirdIndex]);
  //} else {
  // println("Using stored bird");
  //  NextGeneration(StoredBird);
  //}
}

void NextGeneration(Player Parent) {
  for (int i = 0; i < Pipes.length; i++) {
    Pipes[i].Reset();
  }
  for (int i = 0; i < Birds.length; i++) {
    Birds[i].Brain.Weights1 = Matrix.Mutate(Parent.Brain.Weights1);
    Birds[i].Brain.Weights2 = Matrix.Mutate(Parent.Brain.Weights2);
    Birds[i].Brain.Weights3 = Matrix.Mutate(Parent.Brain.Weights3);

    Birds[i].Brain.HiddenOneBias = Matrix.Mutate(Parent.Brain.HiddenOneBias);
    Birds[i].Brain.HiddenTwoBias = Matrix.Mutate(Parent.Brain.HiddenTwoBias);
    Birds[i].Brain.OutputBias =  Matrix.Mutate(Parent.Brain.OutputBias);
    Birds[i].Reset();
  }
  Birds[0].Brain = Parent.Brain;
  RateOfChange = 2;
}
