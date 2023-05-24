within tool;
model AIModel
  Integer input_column = INPUTCOLUMN;
  Integer output_column = OUTPUTCOLUMN;
  String path = "MODELPATH";
  Modelica.Blocks.Interfaces.RealInput a[INPUTCOLUMN]
    annotation (Placement(transformation(origin = {-120.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[OUTPUTCOLUMN]
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
