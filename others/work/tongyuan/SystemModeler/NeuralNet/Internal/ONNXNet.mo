within SystemModeler.NeuralNet.Internal;
class ONNXNet
  extends ExternalObject;

  function constructor
    input String filepath;
    output ONNXNet onnxNet;

  external "C" onnxNet = onnx_constructor(filepath); 
  annotation (Library = {"SENeuralNetwork", "wonnxruntime"}, Include = "#include \"NeuralNetwork.h\"", IncludeDirectory = "modelica://SystemModeler/NeuralNet/Resources/Include", LibraryDirectory = "modelica://SystemModeler/NeuralNet/Resources/Library");
  end constructor;

  function destructor
    input ONNXNet onnxNet;

  external "C" onnx_destructor(onnxNet); 
  annotation (Library = {"SENeuralNetwork", "wonnxruntime"}, Include = "#include \"NeuralNetwork.h\"", IncludeDirectory = "modelica://SystemModeler/NeuralNet/Resources/Include", LibraryDirectory = "modelica://SystemModeler/NeuralNet/Resources/Library");
  end destructor;
end ONNXNet;