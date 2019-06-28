int Length = 7;
int LengthFactorial;
PVector[] Points;
PVector[][] PermutatedPoints;
int Left;
int Right;
int Count;

float ShortestDistance = 100000;
float Percent;
PVector[] ShortestMethod;
boolean Done = false;


void setup() {
  size(400, 400);
  GeneratePoints();
}

void draw() {
  background(0);
  float Distance = 0;
  if (!Done) {
    for (int i = 0; i < Length-1; i++) {
      fill(255);
      ellipse(PermutatedPoints[Count][i].x, PermutatedPoints[Count][i].y, 10, 10);
      stroke(255);
      Distance += dist(PermutatedPoints[Count][i].x, PermutatedPoints[Count][i].y, PermutatedPoints[Count][i+1].x, PermutatedPoints[Count][i+1].y);
      line(PermutatedPoints[Count][i].x, PermutatedPoints[Count][i].y, PermutatedPoints[Count][i+1].x, PermutatedPoints[Count][i+1].y);
    }
    ellipse(PermutatedPoints[Count][Length-1].x, PermutatedPoints[Count][Length-1].y, 10, 10);
    Count++;
    Percent = 100 * float(Count)/(float(LengthFactorial)-1);
    if (Count > LengthFactorial-1) {
      Count = LengthFactorial-1;
      Percent = 100;
      Done = true;
    }
    textSize(32);
    if (Distance < ShortestDistance) {
      ShortestDistance = Distance;
      ShortestMethod = new PVector[7];
      ShortestMethod = PermutatedPoints[Count-1];
    }
  } else {
    for (int i = 0; i < Length-1; i++) {
      ellipse(ShortestMethod[i].x,ShortestMethod[i].y,10,10);
      line(ShortestMethod[i].x,ShortestMethod[i].y,ShortestMethod[i+1].x,ShortestMethod[i+1].y);
    }
    ellipse(ShortestMethod[Length-1].x,ShortestMethod[Length-1].y,10,10);
  }
  text(Percent + "%", 20, 40);
  text(ShortestDistance, 250, 40);
}


void GeneratePoints() {
  Count = 0;
  Points = new PVector[Length];
  LengthFactorial = Factorial(Length);
  PermutatedPoints = new PVector[LengthFactorial][Length];
  for (int i = 0; i < Length; i++) {
    Points[i] = new PVector(random(0, width), random(0, height));
  }
  Left = 0;
  Right = Points.length-1;
  GeneratePermutations(Points, Left, Right);
  Count = 0;
}


void GeneratePermutations(PVector[] ToPermute, int Left, int Right) {
  if (Left==Right) {
    for (int x = 0; x < Length; x++) {
      PermutatedPoints[Count][x] = ToPermute[x];
    }
    Count += 1;
  } else {
    for (int i = Left; i <= Right; i++) {
      ToPermute = Swap(ToPermute, Left, i);
      GeneratePermutations(ToPermute, Left+1, Right);
      ToPermute = Swap(ToPermute, Left, i);
    }
  }
}


PVector[] Swap(PVector[] ToSwap, int Left, int Index) {
  PVector Temp = ToSwap[Index].copy();
  ToSwap[Index] = ToSwap[Left].copy();
  ToSwap[Left] = Temp.copy();
  return ToSwap;
}


int Factorial(int Fact) {
  int x = Fact;
  if (x == 1) {
    return 1;
  }
  x = x*Factorial(x-1);
  return x;
}
