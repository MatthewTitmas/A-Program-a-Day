Table ToLearn;
int Colour = 0;
int Number = 0;

float[] CurrentNumber = new float[784];
float[] Expected = new float[10];
NeuralNetwork Brain;


void setup() {
  size(560, 560);
  colorMode(HSB);
  ToLearn = loadTable("Test.csv");
  Brain = new NeuralNetwork();
  for (int Epochs = 1; Epochs < 4; Epochs++) {
    println("Epoch: "+Epochs);
    for (int k = 0; k < ToLearn.getRowCount(); k++) {
      if (k % 1000 == 0) {
        println(k);
      }
      TableRow Row = ToLearn.getRow(k);
      for (int i = 0; i < 28; i++) {
        for (int j = 0; j < 28; j++) {
          if (Row.getInt(i+j*28) >= 64) {
            CurrentNumber[i+j*28] = 1;
          } else {
            CurrentNumber[i+j*28] = 0;
          }
        }
      }
      for (int i = 0; i < Expected.length; i++) {
        Expected[i] = 0;
      }
      if (Row.getInt(0) == 0) {
        Expected[0] = 1;
      } else if (Row.getInt(0) == 1) {
        Expected[1] = 1;
      } else if (Row.getInt(0) == 2) {
        Expected[2] = 1;
      } else if (Row.getInt(0) == 3) {
        Expected[3] = 1;
      } else if (Row.getInt(0) == 4) {
        Expected[4] = 1;
      } else if (Row.getInt(0) == 5) {
        Expected[5] = 1;
      } else if (Row.getInt(0) == 6) {
        Expected[6] = 1;
      } else if (Row.getInt(0) == 7) {
        Expected[7] = 1;
      } else if (Row.getInt(0) == 8) {
        Expected[8] = 1;
      } else if (Row.getInt(0) == 9) {
        Expected[9] = 1;
      }
      Brain.Train(Matrix.Array(CurrentNumber), Matrix.Array(Expected));
    }
  }
}

void draw() {
  TableRow Row = ToLearn.getRow(Number);
  for (int i = 0; i < 28; i++) {
    for (int j = 0; j < 28; j++) {
      fill(0);
      if (Row.getInt(i+j*28) >= 64) {
        CurrentNumber[i+j*28] = 1;
        fill(255);
      } else {
        CurrentNumber[i+j*28] = 0;
      }
      rect(i*20, j*20, 20, 20);
    }
  }
  Matrix Input = Matrix.Array(CurrentNumber);
  Matrix Result = Brain.ForwardPropogation(Input);
  println("The number shown is a: "+Row.getInt(0)+". The neural network believes it is a: ");
  Result.ShowMax();

  noLoop();
}

void mouseClicked() {
  Number = int(random(0, 20000));
  loop();
}
