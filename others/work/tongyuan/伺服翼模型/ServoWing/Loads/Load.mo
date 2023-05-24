within ServoWing.Loads;
model Load "等效负载"
  parameter SI.Torque table[:,2] = {{0, 10}, {100, 10}} "负载力矩" 
    annotation (Dialog(tab = "负载力矩"));
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-100.0, -100.0}, {100.0, 100.0}}), Line(origin = {-4.0, 31.0}, 
      points = {{-84.0, -31.0}, {-60.0, -1.0}, {-32.0, 21.0}, {2.0, 31.0}, {32.0, 25.0}, {52.0, 13.0}, {68.0, -3.0}, {80.0, -17.0}, {84.0, -21.0}}, 
      thickness = 0.5), Polygon(origin = {62.0, 29.0}, 
      fillPattern = FillPattern.Solid, 
      points = {{24.0, -29.0}, {4.0, 29.0}, {-24.0, -1.0}, {24.0, -29.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "等效负载", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Modelica.Blocks.Sources.TimeTable timetable(table = table)
    annotation (Placement(transformation(origin = {-50.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(timetable.y, torque.tau)
    annotation (Line(origin = {-26.0, 0.0}, 
      points = {{-13.0, 0.0}, {14.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(torque.flange, flange_b)
    annotation (Line(origin = {55.0, 0.0}, 
      points = {{-45.0, 0.0}, {45.0, 0.0}}));
end Load;