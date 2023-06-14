within SystemModelerExtras.Normalization.min_max_trans;
model Min_Max_Trans
  Integer input_column = 6;
  Integer output_column = 6;
  Modelica.Blocks.Interfaces.RealInput a[6]
    annotation (Placement(transformation(origin = {-120.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[6]
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));

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
      fileName = "Modelica://SystemModelerExtras/Images/minmax.png"), Text(origin = {0.0, 130.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
      textString = "%name", 
      textColor = {0, 0, 255})}));
equation 
  y = callC(input_column, output_column, a);
end Min_Max_Trans;