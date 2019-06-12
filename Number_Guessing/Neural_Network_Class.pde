class NeuralNetwork {

  float LearningRate = 0.15;

  int InputNodes = 784;
  int HiddenLayerOne = 512;
  int HiddenLayerTwo =256;
  int HiddenLayerThree =128;
  int OutputNodes = 10;

  Matrix Weights1;
  Matrix Weights2;
  Matrix Weights3;
  Matrix Weights4;

  Matrix HiddenOneBias;
  Matrix HiddenTwoBias;
  Matrix HiddenThreeBias;
  Matrix OutputBias;

  NeuralNetwork() {
    Weights1 = new Matrix(InputNodes, HiddenLayerOne, true);
    Weights2 = new Matrix(HiddenLayerOne, HiddenLayerTwo, true);
    Weights3 = new Matrix(HiddenLayerTwo, HiddenLayerThree, true);
    Weights4 = new Matrix(HiddenLayerThree, OutputNodes, true);
    HiddenOneBias = new Matrix(1, HiddenLayerOne, true);
    HiddenTwoBias = new Matrix(1, HiddenLayerTwo, true);
    HiddenThreeBias = new Matrix(1, HiddenLayerThree, true);
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
    DotProduct3.AddMatrix(HiddenThreeBias);
    DotProduct3.Sigmoid();
    Matrix DotProduct4 = Matrix.Dot(DotProduct3, Weights4);
    DotProduct4.AddMatrix(OutputBias);
    DotProduct4.Sigmoid();
    return DotProduct4;
  }
}
