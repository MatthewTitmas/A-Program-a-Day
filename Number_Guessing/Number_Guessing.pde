NeuralNetwork Brain;

void setup() {
  size(560, 560);
  background(0);
  Brain = new NeuralNetwork();
  Brain.Weights1 = LoadMatrix("Weights1");
  Brain.Weights2 = LoadMatrix("Weights2");
  Brain.Weights3 = LoadMatrix("Weights3");
  Brain.Weights4 = LoadMatrix("Weights4");
  Brain.HiddenOneBias = LoadMatrix("HiddenOneBias");
  Brain.HiddenTwoBias = LoadMatrix("HiddenTwoBias");
  Brain.HiddenThreeBias = LoadMatrix("HiddenThreeBias");
  Brain.OutputBias = LoadMatrix("OutputBias");
  println("Start Drawing!");
}


void draw() {
}


void keyPressed() {
  if (keyCode == ENTER) {
    Guess();
  } else if (key == 'r') {
    background(0);
  }
}

void mouseDragged() {
  noStroke();
  fill(255);
  rect(floor(mouseX/20)*20, floor(mouseY/20)*20, 20, 20);
}

void Guess() {
  float[] Guess = new float[784];
  for (int i = 0; i < 28; i++) {
    for (int j = 0; j < 28; j++) {
      Guess[i*28+j] = blue(get(j*20+1, i*20+1))/255;
    }
  }
  Matrix Output = Brain.ForwardPropogation(Matrix.Array(Guess));
  Output.ShowMax();
}


Matrix LoadMatrix(String Name) {
  Matrix LoadedMatrix;
  String[] Lines = loadStrings(Name+".txt");
  int Rows = Lines.length;
  int Cols = Lines[0].split(" ").length;
  LoadedMatrix = new Matrix(Rows, Cols, false);
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Cols; j++) {
      LoadedMatrix.Values[i][j] = float(Lines[i].split(" ")[j]);
    }
  }
  return LoadedMatrix;
}
