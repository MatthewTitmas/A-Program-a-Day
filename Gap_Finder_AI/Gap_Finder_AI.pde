Pixel[][] Pixels;
Snake[] Players;
int Count = 0;
Snake FittestPlayer;
Matrix FittestWeights1;
Matrix FittestWeights2;
Matrix FittestWeights3;

Matrix FittestHiddenOneBias;
Matrix FittestHiddenTwoBias;
Matrix FittestOutputBias;
int BestFitness = 0;
int AmountOfSnakes = 10;
boolean Changed = true;


void setup() {
  Players = new Snake[AmountOfSnakes];
  size(800, 800);
  Pixels = new Pixel[width][height];
  for (int i= 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      Pixels[i][j] = new Pixel();
    }
  }
  for (int x = 0; x < Players.length; x++) {
    Players[x] = new Snake(50, 50);
  }
  FittestPlayer = new Snake(50, 50);
  FittestWeights1 = Players[0].Brain.Weights1;
  FittestWeights2 = Players[0].Brain.Weights2;
  FittestWeights3 = Players[0].Brain.Weights3;
  FittestHiddenOneBias = Players[0].Brain.HiddenOneBias;
  FittestHiddenTwoBias = Players[0].Brain.HiddenTwoBias;
  FittestOutputBias = Players[0].Brain.OutputBias;
  background(0);
}

void draw() {
  if (FittestPlayer.Dead != true && Changed != false) {
    FittestPlayer.Update();
    FittestPlayer.UpdatePixels(10);
    if (FittestPlayer.Dead) {
      FittestPlayer.Dead();
      FittestPlayer.Dead = true;
    }
  } else {
    int Rate = 50;
    //Player.Show();
    for (int x = 0; x < Rate; x++) {
      Players[Count].Update();
      //Player.CheckDeath(Pixels);
      Players[Count].UpdatePixels(Count);
      if (Players[Count].Dead) {
        Players[Count].Dead();
        Count = (Count+1) % AmountOfSnakes;
        if (Count == 0) {
          FindFittest();
          break;
        }
      }
    }
  }
}

void FindFittest() {
  int Fittest = 0;
  int Fitness = 0;
  for (int x = 0; x < Players.length; x++) {
    if (Fitness < Players[x].Fitness) {
      Fitness = Players[x].Fitness;
      Fittest = x;
    }
    Players[x].Fitness = 0;
  }
  Changed = false;
  if (Fitness > BestFitness) {
    BestFitness = Fitness;
    Changed = true;
    FittestWeights1 = Players[Fittest].Brain.Weights1;
    FittestWeights2 = Players[Fittest].Brain.Weights2;
    FittestWeights3 = Players[Fittest].Brain.Weights3;
    FittestHiddenOneBias = Players[Fittest].Brain.HiddenOneBias;
    FittestHiddenTwoBias = Players[Fittest].Brain.HiddenTwoBias;
    FittestOutputBias = Players[Fittest].Brain.OutputBias;
  }

  for (int x = 0; x < Players.length; x++) {
    Players[x].Brain.Weights1 = Matrix.Mutate(FittestWeights1);
    Players[x].Brain.Weights2 = Matrix.Mutate(FittestWeights2);
    Players[x].Brain.Weights3 = Matrix.Mutate(FittestWeights3);

    Players[x].Brain.HiddenOneBias = Matrix.Mutate(FittestHiddenOneBias);
    Players[x].Brain.HiddenTwoBias = Matrix.Mutate(FittestHiddenTwoBias);
    Players[x].Brain.OutputBias = Matrix.Mutate(FittestOutputBias);
  }
  FittestPlayer.Brain.Weights1 = FittestWeights1;
  FittestPlayer.Brain.Weights2 = FittestWeights2;
  FittestPlayer.Brain.Weights3 = FittestWeights3;
  FittestPlayer.Brain.HiddenOneBias = FittestHiddenOneBias;
  FittestPlayer.Brain.HiddenTwoBias = FittestHiddenTwoBias;
  FittestPlayer.Brain.OutputBias = FittestOutputBias;
  FittestPlayer.Dead = false;
}

void mouseClicked() {
  background(0);
  FittestPlayer.Dead = false;
  Changed = true;
  FittestPlayer.Dead();
  for (int i= 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      Pixels[i][j] = new Pixel();
    }
  }
}
