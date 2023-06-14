within SystemModeler.NeuralNet.Components;
block MIMO_ONNXNet
  parameter Integer nin annotation (Dialog(group = "Dimensions"));
  parameter Integer nout annotation (Dialog(group = "Dimensions"));
  parameter String fileName annotation (Dialog(group = "Net Data", loadSelector(filter = "ONNX files (*.onnx)", caption = "Select neural net")));

  Modelica.Blocks.Interfaces.RealInput u[nin] annotation (Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y[nout] annotation (Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.ONNXNet onnx = Internal.ONNXNet(fileName);
equation 
  y = Internal.RunMIMO_ONNXNet(onnx, u, nin, nout);
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {239, 239, 239}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.25, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}), Bitmap(origin = {0.0, 5.0}, 
      extent = {{-94.0, -85.0}, {94.0, 85.0}}, 
      fileName = "Modelica://SystemModeler/Images/neural.svg"), Text(origin = {0.0, 130.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
      textString = "%name", 
      textColor = {0, 0, 255})}));
end MIMO_ONNXNet;