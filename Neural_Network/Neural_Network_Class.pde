class NeuralNetwork {
  int InputNodes = 2;
  int HiddenLayerOne = 3;
  int OutputNodes = 1;
  float LearningRate = 0.15;

  Matrix Weights1;
  Matrix Weights2;

  Matrix HiddenBias;
  Matrix OutputBias;

  NeuralNetwork() {
    Weights1 = new Matrix(InputNodes, HiddenLayerOne, true);
    Weights2 = new Matrix(HiddenLayerOne, OutputNodes, true);
    HiddenBias = new Matrix(1, HiddenLayerOne, true);
    OutputBias = new Matrix(1, OutputNodes, true);
  }

  Matrix ForwardPropogation(Matrix Input) {
    Matrix DotProduct1 = Matrix.Dot(Input, Weights1);
    DotProduct1.AddMatrix(HiddenBias);
    DotProduct1.Sigmoid();
    Matrix DotProduct2 = Matrix.Dot(DotProduct1, Weights2);
    DotProduct2.AddMatrix(OutputBias);
    DotProduct2.Sigmoid();
    return DotProduct2;
  }

  void Train(Matrix Input, Matrix Expected) {
    Matrix DotProduct1 = Matrix.Dot(Input, Weights1);
    DotProduct1.AddMatrix(HiddenBias);
    DotProduct1.Sigmoid();
    Matrix DotProduct2 = Matrix.Dot(DotProduct1, Weights2);
    DotProduct2.AddMatrix(OutputBias);
    DotProduct2.Sigmoid();

    Matrix PredictionError = Matrix.Subtract(Expected, DotProduct2);
    Matrix PredictionDelta = Matrix.MultiplyMatrix(PredictionError, Matrix.SigmoidPrime(DotProduct2));

    Matrix HiddenOneError = Matrix.Dot(PredictionDelta, Matrix.Transpose(Weights2));
    Matrix HiddenOneDelta = Matrix.MultiplyMatrix(HiddenOneError, Matrix.SigmoidPrime(DotProduct1));

    Matrix ToAddWeights1 = Matrix.Dot(Matrix.Transpose(Input), HiddenOneDelta);
    Matrix ToAddWeights2 = Matrix.Dot(Matrix.Transpose(DotProduct1), PredictionDelta);
    ToAddWeights1.MultiplyNumber(LearningRate);
    ToAddWeights1.MultiplyNumber(LearningRate);


    OutputBias.AddMatrix(PredictionDelta);
    HiddenBias.AddMatrix(HiddenOneDelta);
    Weights1.AddMatrix(ToAddWeights1);
    Weights2.AddMatrix(ToAddWeights2);
  }
}
