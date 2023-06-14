within SystemModeler.Examples;
model NetWithSources
  block NetBlock
    extends SystemModeler.NeuralNet.Components.MIMO_ONNXNet(nin = 18, nout = 6, fileName = "C:/Users/Administrator/Desktop/SystemModeler/Examples/machine.onnx");
  end NetBlock;

  Modelica.Blocks.Sources.Sine sine[18](freqHz = {0.2, 0.5, 0.1, 0.3, 0.2, 0.5, 0.1, 0.3, 0.2, 0.5, 0.1, 0.3, 0.2, 0.5, 0.1, 0.3, 0.2, 0.5}) "Net input" annotation (Placement(transformation(origin = {-26.346666666666675, 0.05333333333333545}, 
    extent = {{-8.559999999999988, -8.56}, {8.56000000000001, 8.56}})));



  Normalization.min_max.Min_Max min_Max
    annotation (Placement(transformation(origin = {-6.8, 0.05333333333333501}, 
      extent = {{-4.7733333333333325, -4.613333333333332}, {4.773333333333334, 4.613333333333334}})));
  Normalization.min_max_trans.Min_Max_Trans min_Max_Trans
    annotation (Placement(transformation(origin = {30.4, 0.05333333333333545}, 
      extent = {{-4.773333333333333, -4.613333333333333}, {4.773333333333333, 4.613333333333332}})));
  NetBlock netBlock
    annotation (Placement(transformation(origin = {11.8, 0.05333333333333545}, 
      extent = {{-7.2308445532435766, -8.56}, {7.230844553243575, 8.56}})));
equation 
  annotation (experiment(StopTime = 10), Diagram(coordinateSystem(extent = {{-35, -20}, {35, 20}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {75, 138, 73}, fillColor = {75, 138, 73}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Polygon(visible = true, lineColor = {75, 138, 73}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-36, 60}, {64, 0}, {-36, -60}, {-36, 60}})}));
  connect(sine.y, min_Max.a)
    annotation (Line(origin = {-21.0, 0.0}, 
      points = {{4.0, 0.0}, {8.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(min_Max.y, netBlock.u)
    annotation (Line(origin = {0.0, 0.0}, 
      points = {{-2.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(netBlock.y, min_Max_Trans.a)
    annotation (Line(origin = {22.0, -1.0}, 
      points = {{-2.0, 1.0}, {3.0, 1.0}}, 
      color = {0, 0, 127}));
end NetWithSources;