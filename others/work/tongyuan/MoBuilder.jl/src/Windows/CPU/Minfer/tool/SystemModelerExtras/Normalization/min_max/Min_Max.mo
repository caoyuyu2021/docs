﻿within SystemModelerExtras.Normalization.min_max;
model Min_Max
  Integer input_column = 18;
  Integer output_column = 18;
  Modelica.Blocks.Interfaces.RealInput a[18]
    annotation (Placement(transformation(origin = {-120.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[18]
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
      extent = {{-100.0, 100.0}, {100.0, -100.0}}), Bitmap(origin = {-0.1713586291309781, 3.1150550795593546}, 
      extent = {{-94.17135862913096, -86.88494492044065}, {94.17135862913098, 86.88494492044065}}, 
      fileName = "Modelica://SystemModelerExtras/Images/minmax.png"), Text(origin = {0.0, 130.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
      textString = "%name", 
      textColor = {0, 0, 255})}));
equation 
  y = callC(input_column, output_column, a);
end Min_Max;