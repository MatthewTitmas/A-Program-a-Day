class Reacher {
  PVector LineOneStart;
  PVector LineTwoStart;
  PVector LineTwoEnd;
  float Length;
  float ArmOneAngle;
  float ArmTwoAngle;
  float TimeSinceFinal;


  boolean Dead;
  float Fitness;
  int FitnessRemoval;
  NeuralNetwork Brain;



  Reacher(float L) {
    Brain = new NeuralNetwork();
    Length = L;
    Reset();
  }

  void Show() {
    stroke(255);
    strokeWeight(7);
    line(LineOneStart.x, LineOneStart.y, LineTwoStart.x, LineTwoStart.y);
    line(LineTwoStart.x, LineTwoStart.y, LineTwoEnd.x, LineTwoEnd.y);
    ellipse(LineTwoEnd.x, LineTwoEnd.y, 10, 10);
  }

  void Update() {
    if (millis() - TimeSinceFinal >= 5000*1/Rate) {
      FitnessRemoval = (int)Fitness;
      Fitness -= dist(LineTwoEnd.x, LineTwoEnd.y, 400+FoodPosition.x, 400+FoodPosition.y);
      Dead = true;
    }
    float[] Input = new float[4];
    Input[0] = map(ArmOneAngle, 0, TWO_PI, 0, 1);
    Input[1] = map(ArmTwoAngle, 0, TWO_PI, 0, 1);
    Input[2] = map(400+FoodPosition.x, 100, 700, 0, 1);
    Input[3] = map(400+FoodPosition.y, 100, 700, 0, 1);

    Matrix Result = Brain.ForwardPropogation(Matrix.Array(Input));
    int Turn = Result.ShowMax();

    if (Turn == 0) {
      ArmOneAngle += 0.1;
    } else if (Turn == 1) {
      ArmOneAngle -= 0.1;
    } else if (Turn == 2) {
      ArmTwoAngle += 0.1;
    } else if (Turn == 3) {
      ArmTwoAngle -= 0.1;
    }

    if (ArmTwoAngle > TWO_PI) {
      ArmTwoAngle = 0;
    } 
    if (ArmTwoAngle < 0) {
      ArmTwoAngle = TWO_PI;
    }
    if (ArmOneAngle > TWO_PI) {
      ArmOneAngle = 0;
    }
    if (ArmOneAngle < 0) {
      ArmOneAngle = TWO_PI;
    }

    LineTwoStart = new PVector(LineOneStart.x+Length*cos(ArmOneAngle), LineOneStart.y+Length*sin(ArmOneAngle));
    LineTwoEnd = new PVector(LineTwoStart.x+Length*cos(ArmTwoAngle), LineTwoStart.y+Length*sin(ArmTwoAngle));
  }

  boolean Intersect(float X, float Y) {
    if (sq(LineTwoEnd.x - X) + sq(LineTwoEnd.y - Y) < 125) {
      TimeSinceFinal = millis();
      Fitness += 1000;
      return true;
    }
    return false;
  }

  void Reset() {
    ArmOneAngle = 0;
    ArmTwoAngle = 0;
    LineOneStart = new PVector(400, 400);
    LineTwoStart = new PVector(LineOneStart.x+Length*cos(ArmOneAngle), LineOneStart.y+Length*sin(ArmOneAngle));
    LineTwoEnd = new PVector(LineTwoStart.x+Length*cos(ArmTwoAngle), LineTwoStart.y+Length*sin(ArmTwoAngle));
    TimeSinceFinal = millis();
    Dead = false;
    Fitness = 1000;
  }
}
