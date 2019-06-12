class NeuralNetwork {

  int InputNodes = 30;
  int HiddenLayerOne = 6;
  int HiddenLayerTwo = 4;
  int OutputNodes = 3;

  Matrix Weights1;
  Matrix Weights2;
  Matrix Weights3;

  Matrix HiddenOneBias;
  Matrix HiddenTwoBias;
  Matrix OutputBias;

  NeuralNetwork() {
    Weights1 = new Matrix(InputNodes, HiddenLayerOne, true);
    Weights2 = new Matrix(HiddenLayerOne, HiddenLayerTwo, true);
    Weights3 = new Matrix(HiddenLayerTwo, OutputNodes, true);
    HiddenOneBias = new Matrix(1, HiddenLayerOne, true);
    HiddenTwoBias = new Matrix(1, HiddenLayerTwo, true);
    OutputBias = new Matrix(1, OutputNodes, true);
  }

  Matrix ForwardPropogation(Matrix Input) {
    Matrix DotProduct1 = Matrix.Dot(Input, Weights1);
    DotProduct1.AddMatrix(HiddenOneBias);
    DotProduct1.Sigmoid();
    Matrix DotProduct2 = Matrix.Dot(DotProduct1, Weights2);
    DotProduct2.AddMatrix(HiddenTwoBias);
    DotProduct2.Sigmoid();
    Matrix DotProduct3 = Matrix.Dot(DotProduct2, Weights3);
    DotProduct3.AddMatrix(OutputBias);
    DotProduct3.Sigmoid();
    return DotProduct3;
  }
}
