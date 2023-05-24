within ServoWing.System.Subsystems;
model LoadSystem "负载系统"
  extends Icons.BasicModel;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, -30.0}, {60.0, 30.0}}, 
      textString = "等效负载", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Rectangle(origin = {-38.0, 2.0}, 
      fillColor = {236, 219, 32}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 40.0}, {40.0, -40.0}}), Line(origin = {-54.0, 2.0}, 
      points = {{0.0, 40.0}, {0.0, -40.0}}), Rectangle(origin = {-26.0, 2.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-28.0, 40.0}, {28.0, -40.0}}), Line(origin = {-38.0, -12.0}, 
      points = {{-40.0, 0.0}, {40.0, 0.0}}), Line(origin = {-38.0, 16.0}, 
      points = {{-40.0, 0.0}, {40.0, 0.0}}), Line(origin = {-26.0, 2.0}, 
      points = {{0.0, 40.0}, {0.0, -40.0}}), Polygon(origin = {46.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{34.0, 2.0}, {16.0, 18.0}, {20.0, 2.0}, {-34.0, 2.0}, {-34.0, -4.0}, {20.0, -4.0}, {18.0, -18.0}})}));
  Interfaces.RotationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Clock clock
    annotation (Placement(transformation(origin = {-50.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table = {{0, 0}, {100, 0}})
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(origin = {58.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(clock.y, combiTable1Ds.u)
    annotation (Line(origin = {-26.0, 0.0}, 
      points = {{-13.0, 0.0}, {14.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(torque.flange, flange_b)
    annotation (Line(origin = {84.0, 0.0}, 
      points = {{-16.0, 0.0}, {16.0, 0.0}}));
  connect(combiTable1Ds.y[1], torque.tau)
    annotation (Line(origin = {29.0, 0.0}, 
      points = {{-18.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 127}));
end LoadSystem;