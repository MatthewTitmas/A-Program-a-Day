NeuralNetwork Brain;
float[] input1 = {1, 1};
float[] output1 = {0};
float[] input2 = {1, 0};
float[] output2 = {1};
float[] input3 = {0, 1};
float[] output3 = {1};
float[] input4 = {0, 0};
float[] output4 = {0};
Matrix Input1;
Matrix Output1;
Matrix Input2;
Matrix Output2;
Matrix Input3;
Matrix Output3;
Matrix Input4;
Matrix Output4;

int[] Inputs;
int[] Hidden;
int[] Outputs;
boolean Pos1 = false;
boolean Pos2 = false;
boolean Output = false;
float[] FinalInput = new float[2];

void setup() {
  size(600, 600);

  Inputs = new int[2];
  Hidden = new int[3];
  Outputs = new int[1];

  Input1 = Matrix.Array(input1);
  Output1 = Matrix.Array(output1);
  Input2 = Matrix.Array(input2);
  Output2 = Matrix.Array(output2);
  Input3 = Matrix.Array(input3);
  Output3 = Matrix.Array(output3);
  Input4 =  Matrix.Array(input4);
  Output4 =  Matrix.Array(output4);
  Brain = new NeuralNetwork();
  for (int i = 0; i < 10000; i++) {
    Brain.Train(Input1, Output1);
    Brain.Train(Input2, Output2);
    Brain.Train(Input3, Output3);
    Brain.Train(Input4, Output4);
  }
  Matrix Test1 = Brain.ForwardPropogation(Input1);
  Matrix Test2 = Brain.ForwardPropogation(Input2);
  Matrix Test3 = Brain.ForwardPropogation(Input3);
  Matrix Test4 = Brain.ForwardPropogation(Input4);
}

void draw() {
  Brain.Train(Input1, Output1);
  Brain.Train(Input2, Output2);
  Brain.Train(Input3, Output3);
  Brain.Train(Input4, Output4);
  background(127);
  textSize(32);
  fill(0);
  text("AND",65,40);
  text("OR",265,40);
  text("XOR",465,40);
  line(0, 50, width, 50);
  line(200, 0, 200, 50);
  line(400, 0, 400, 50);
  for (int i = 0; i < Inputs.length; i++) {
    for (int j = 0; j < Hidden.length; j++) {
      line(100, (i+1)*height/(Inputs.length+1), 300, (j+1)*height/(Hidden.length+1));
    }
    fill(255, 0, 0);
    if ((Pos1 == true && i == 0) ||(Pos2 == true && i == 1)) {
      fill(0, 255, 0);
    }
    ellipse(100, ((i+1)*height/(Inputs.length+1)), 100, 100);
  }
  fill(255);
  for (int i = 0; i < Hidden.length; i++) {
    for (int j = 0; j < Outputs.length; j++) {
      line(300, (i+1)*height/(Hidden.length+1), 500, (j+1)*height/(Outputs.length+1));
    }
    ellipse(300, ((i+1)*height/(Hidden.length+1)), 100, 100);
  }
  FinalInput[0] = 0;
  if (Pos1) { 
    FinalInput[0] = 1;
  }
  FinalInput[1] = 0;
  if (Pos2) {
    FinalInput[1] = 1;
  }

  Matrix Output = Brain.ForwardPropogation(Matrix.Array(FinalInput));
  if (Output.Values[0][0] > 0.5) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }

  for (int i = 0; i < Outputs.length; i++) {
    ellipse(500, ((i+1)*height/(Outputs.length+1)), 100, 100);
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, 100, 200) < 100) {
    Pos1 = !Pos1;
  } else if (dist(mouseX, mouseY, 100, 400) < 100) {
    Pos2 = !Pos2;
  } else if (mouseX < 200 && mouseY < 200) {
    Input1.Values[0][0] = 1;
    Input1.Values[0][1] = 1;
    Output1.Values[0][0] = 1;
    Input2.Values[0][0] = 1;
    Input2.Values[0][1] = 0;
    Output2.Values[0][0] = 0;
    Input3.Values[0][0] = 0;
    Input3.Values[0][1] = 1;
    Output3.Values[0][0] = 0;
    Input4.Values[0][0] = 0;
    Input4.Values[0][1] = 0;
    Output4.Values[0][0] = 0;
    for (int i = 0; i < 10000; i++) {
      Brain.Train(Input1, Output1);
      Brain.Train(Input2, Output2);
      Brain.Train(Input3, Output3);
      Brain.Train(Input4, Output4);
    }
    println("Training for AND");
  } else if (mouseX < 400 && mouseY < 200) {
    Input1.Values[0][0] = 1;
    Input1.Values[0][1] = 1;
    Output1.Values[0][0] = 1;
    Input2.Values[0][0] = 1;
    Input2.Values[0][1] = 0;
    Output2.Values[0][0] = 1;
    Input3.Values[0][0] = 0;
    Input3.Values[0][1] = 1;
    Output3.Values[0][0] = 1;
    Input4.Values[0][0] = 0;
    Input4.Values[0][1] = 0;
    Output4.Values[0][0] = 0;
    for (int i = 0; i < 10000; i++) {
      Brain.Train(Input1, Output1);
      Brain.Train(Input2, Output2);
      Brain.Train(Input3, Output3);
      Brain.Train(Input4, Output4);
    }
    println("Training for OR");
  } else if (mouseX < 600 && mouseY < 200) {
    Input1.Values[0][0] = 1;
    Input1.Values[0][1] = 1;
    Output1.Values[0][0] = 0;
    Input2.Values[0][0] = 1;
    Input2.Values[0][1] = 0;
    Output2.Values[0][0] = 1;
    Input3.Values[0][0] = 0;
    Input3.Values[0][1] = 1;
    Output3.Values[0][0] = 1;
    Input4.Values[0][0] = 0;
    Input4.Values[0][1] = 0;
    Output4.Values[0][0] = 0;
    for (int i = 0; i < 10000; i++) {
      Brain.Train(Input1, Output1);
      Brain.Train(Input2, Output2);
      Brain.Train(Input3, Output3);
      Brain.Train(Input4, Output4);
    }
    println("Training for XOR");
  }
}
