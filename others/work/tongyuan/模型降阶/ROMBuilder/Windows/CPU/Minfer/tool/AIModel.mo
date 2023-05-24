within tool;
model AIModel
  Integer input_column = 4;
  Integer output_column = 24;
  String path = "C:/Users/Administrator/Desktop/ROMBuilder/Windows/CPU/Minfer";
  Modelica.Blocks.Interfaces.RealInput a[4]
    annotation (Placement(transformation(origin = {-120.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[24]
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  extends tool.Icons;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})));
equation 
  y = callC(input_column, output_column, a, path);
end AIModel;