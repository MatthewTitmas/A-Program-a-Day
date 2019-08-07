Reacher[] CurrentReach;
Reacher BestReach;
PVector FoodPosition;
int Count;
int Rate;

void setup() {
  size(800, 800);
  CurrentReach = new Reacher[10];
  Rate = 1;
  for (int i = 0; i < CurrentReach.length; i++) {
    CurrentReach[i] = new Reacher(180);
  }
  BestReach = new Reacher(180);
  BestReach.Fitness = 0;
  float t = 2*PI*random(1);
  float u = random(1)+random(1);
  float r = u;
  if (u > 1) {
    r = 2-u;
  }
  FoodPosition = new PVector(200*r*cos(t), 200*r*sin(t));
  Count = 0;
}

void draw() {
  for (int i = 0; i < Rate; i++) {
    background(#632A00);
    Border(20, color(0));
    if (!CurrentReach[Count].Dead) {
      CurrentReach[Count].Update();
      CurrentReach[Count].Show();
      fill(255, 0, 0);
      noStroke();
      ellipse(400+FoodPosition.x, 400+FoodPosition.y, 20, 20);
      if (CurrentReach[Count].Intersect(400+FoodPosition.x, 400+FoodPosition.y)) {
        float t = 2*PI*random(1);
        float u = random(1)+random(1);
        float r = u;
        if (u > 1) {
          r = 2-u;
        }
        FoodPosition = new PVector(300*r*cos(t), 300*r*sin(t));
      }
    } else {
      Count += 1;
      if (Count == 10) {
        Mutate();
      } else {
        CurrentReach[Count].Reset();
        float t = 2*PI*random(1);
        float u = random(1)+random(1);
        float r = u;
        if (u > 1) {
          r = 2-u;
        }
        FoodPosition = new PVector(200*r*cos(t), 200*r*sin(t));
      }
    }
  }
}

void Border(int Width, color Col) {
  noStroke();
  fill(Col);
  rect(0, 0, Width, height);
  rect(0, 0, width, Width);
  rect(width, 0, -Width, height);
  rect(0, height, width, -Width);
}

void Mutate() {
  println("Mutating");
  int Fittest = 0;
  float Fitness = 0;
  for (int x = 0; x < CurrentReach.length; x++) {
    if (Fitness < CurrentReach[x].Fitness) {
      Fitness = CurrentReach[x].Fitness;
      Fittest = x;
    }
  }
  int SameCheck = CurrentReach[0].FitnessRemoval;
  boolean Random = true;
  for (int x = 1; x < CurrentReach.length; x++) {
    if (CurrentReach[x].FitnessRemoval != SameCheck) {
      Random = false;
    }
  }
  if (!Random) {
    if (CurrentReach[Fittest].Fitness > BestReach.Fitness) {
      BestReach.Brain.Weights1 = CurrentReach[Fittest].Brain.Weights1;
      BestReach.Brain.Weights2 = CurrentReach[Fittest].Brain.Weights2;
      BestReach.Brain.Weights3 = CurrentReach[Fittest].Brain.Weights3;

      BestReach.Brain.HiddenOneBias = CurrentReach[Fittest].Brain.HiddenOneBias;
      BestReach.Brain.HiddenTwoBias = CurrentReach[Fittest].Brain.HiddenTwoBias;
      BestReach.Brain.OutputBias = CurrentReach[Fittest].Brain.OutputBias;

      BestReach.Fitness = CurrentReach[Fittest].Fitness;



      for (int i = 0; i < CurrentReach.length; i++) {
        CurrentReach[i].Brain.Weights1 = Matrix.Mutate(CurrentReach[Fittest].Brain.Weights1);
        CurrentReach[i].Brain.Weights2 = Matrix.Mutate(CurrentReach[Fittest].Brain.Weights2);
        CurrentReach[i].Brain.Weights3 = Matrix.Mutate(CurrentReach[Fittest].Brain.Weights3);

        CurrentReach[i].Brain.HiddenOneBias = Matrix.Mutate(CurrentReach[Fittest].Brain.HiddenOneBias);
        CurrentReach[i].Brain.HiddenTwoBias = Matrix.Mutate(CurrentReach[Fittest].Brain.HiddenTwoBias);
        CurrentReach[i].Brain.OutputBias = Matrix.Mutate(CurrentReach[Fittest].Brain.OutputBias);
        CurrentReach[i].Reset();
      }
    } else {
      for (int i = 0; i < CurrentReach.length; i++) {
        CurrentReach[i].Brain.Weights1 = Matrix.Mutate(BestReach.Brain.Weights1);
        CurrentReach[i].Brain.Weights2 = Matrix.Mutate(BestReach.Brain.Weights2);
        CurrentReach[i].Brain.Weights3 = Matrix.Mutate(BestReach.Brain.Weights3);

        CurrentReach[i].Brain.HiddenOneBias = Matrix.Mutate(BestReach.Brain.HiddenOneBias);
        CurrentReach[i].Brain.HiddenTwoBias = Matrix.Mutate(BestReach.Brain.HiddenTwoBias);
        CurrentReach[i].Brain.OutputBias = Matrix.Mutate(BestReach.Brain.OutputBias);
        CurrentReach[i].Reset();
      }
    }
  } else {
    println("Recreating");
    for (int i = 0; i < CurrentReach.length; i++) {
      CurrentReach[i] = new Reacher(180);
    }
  }
  Count = 0;
}

void mouseWheel(MouseEvent e) {
  Rate += e.getCount();
  if (Rate < 1) {
    Rate = 1;
  }
}
