within tool;
model AIModel
  Integer input_column = 4;
  Integer output_column = 24;
  Modelica.Blocks.Interfaces.RealInput a[4]
    annotation (Placement(transformation(origin = {-120.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[24]
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  y = callC(input_column, output_column, a);
end AIModel;