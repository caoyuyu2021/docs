within SystemModeler.NeuralNet.Internal;
function RunMIMO_ONNXNet
  input ONNXNet onnxNet;
  input Real u[nin];
  input Integer nin;
  input Integer nout;
  output Real y[nout];

external "C" multiple_input_output(onnxNet, u, nin, y, nout); 
annotation (Library = {"SENeuralNetwork", "wonnxruntime"}, Include = "#include \"NeuralNetwork.h\"", IncludeDirectory = "modelica://SystemModeler/NeuralNet/Resources/Include", LibraryDirectory = "modelica://SystemModeler/NeuralNet/Resources/Library");
end RunMIMO_ONNXNet;