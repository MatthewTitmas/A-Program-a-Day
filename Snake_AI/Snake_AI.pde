int Players = 16;
float SpaceBetweenPlayers;
float Spacing;
int Rows = 10;
Board[] SnakeGames;

void setup() {
  size(800, 800);
  SpaceBetweenPlayers = width/sqrt(Players);
  Spacing = SpaceBetweenPlayers/Rows;
  SnakeGames = new Board[16];
  for (int k = 0; k < sqrt(Players); k++) {
    line(k*SpaceBetweenPlayers, 0, k*SpaceBetweenPlayers, width);
    line(0, k*SpaceBetweenPlayers, height, k*SpaceBetweenPlayers);
    for (int j = 0; j < sqrt(Players); j++) {
      SnakeGames[int(k*sqrt(Players)+j)] = new Board(k*SpaceBetweenPlayers, j*SpaceBetweenPlayers);
    }
  }
}


void draw() {
  int Dead = 0;
  frameRate(5);
  background(0);
  stroke(255);

  for (int x = 0; x < SnakeGames.length; x++) {
    if (SnakeGames[x].Dead != true) {
      SnakeGames[x].Update();
      SnakeGames[x].Show();
    } else {
      Dead += 1;
    }
  }
  if (Dead == 16) {
    for (int x = 0; x < SnakeGames.length; x++) {
      SnakeGames[x].Reset();
    }
    FindFittest();
  }
}


void keyPressed() {
  int Direction = -1;
  if (key == 'a') {
    Direction = 3;
  } else if (key == 'd') {
    Direction = 1;
  } else if (key == 'w') {
    Direction = 0;
  } else if (key == 's') {
    Direction = 2;
  }

  if (Direction != -1) {
    for (int x = 0; x < SnakeGames.length; x++) {
      SnakeGames[x].Direction = Direction;
    }
  }
}


void FindFittest() {
  float Fitness = 0;
  int Fittest = 0;
  for (int x = 0; x < SnakeGames.length; x++) {
    if (SnakeGames[x].Fitness > Fitness) {
      Fitness = SnakeGames[x].Fitness;
      Fittest = x;
    }
  }
  Mutate(SnakeGames[Fittest]);
}

void Mutate(Board Fittest) {
  for (int x = 0; x < SnakeGames.length; x++) {
    SnakeGames[x].Brain.Weights1 = Matrix.Mutate(Fittest.Brain.Weights1);
    SnakeGames[x].Brain.Weights2 = Matrix.Mutate(Fittest.Brain.Weights2);
    SnakeGames[x].Brain.Weights3 = Matrix.Mutate(Fittest.Brain.Weights3);
    
    SnakeGames[x].Brain.HiddenOneBias = Matrix.Mutate(Fittest.Brain.HiddenOneBias);
    SnakeGames[x].Brain.HiddenTwoBias = Matrix.Mutate(Fittest.Brain.HiddenTwoBias);
    SnakeGames[x].Brain.OutputBias = Matrix.Mutate(Fittest.Brain.OutputBias);
  }
}
