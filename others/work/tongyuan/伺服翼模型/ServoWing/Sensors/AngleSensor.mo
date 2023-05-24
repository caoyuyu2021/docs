within ServoWing.Sensors;
model AngleSensor "理想角度传感器"
  extends ServoLib.Icons.BasicModel;
  annotation (Documentation(info = "<html>
<p>
Measures the <b>absolute angle phi</b> of a flange in an ideal
way and provides the result as output signal <b>phi</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
</html>"), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {73.0, -2.0}, 
      extent = {{-25.0, 20.0}, {25.0, -20.0}}, 
      textString = "phi"), Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      radius = 25.0), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {245, 245, 245}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-70.0, -70.0}, {70.0, 70.0}}), Line(origin = {0.0, 55.0}, 
      points = {{0.0, 15.0}, {0.0, -15.0}}), Line(origin = {31.55, 45.05}, 
      points = {{-8.650000000000002, -12.25}, {8.650000000000002, 12.25}}), Line(origin = {-31.55, 45.05}, 
      points = {{8.650000000000002, -12.25}, {-8.650000000000002, 12.25}}), Line(origin = {51.7, 18.799999999999997}, 
      points = {{-14.100000000000001, -5.099999999999998}, {14.099999999999994, 5.100000000000001}}), Line(origin = {-51.7, 18.799999999999997}, 
      points = {{14.100000000000001, -5.099999999999998}, {-14.099999999999994, 5.100000000000001}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {64, 64, 64}, 
      fillColor = {255, 255, 255}, 
      extent = {{-12.0, -12.0}, {12.0, 12.0}}), Polygon(origin = {0.0, 0.0}, 
      rotation = -17.5, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      points = {{-5.0, 0.0}, {-2.0, 60.0}, {0.0, 65.0}, {2.0, 60.0}, {5.0, 0.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-7.0, -7.0}, {7.0, 7.0}}), Line(origin = {85.0, 0.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 0, 127}), Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "理想角度传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {82.0, 9.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "phi", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {101.0, -11.0}, 
      extent = {{-23.0, 5.0}, {23.0, -5.0}}, 
      textString = "测量角度输出rad", 
      textStyle = {TextStyle.None})}));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange "Flange of shaft from which sensor information shall be measured" 
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput phi "测量角度输出rad" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(angleSensor.flange, flange)
    annotation (Line(origin = {-54.0, 0.0}, 
      points = {{44.0, 0.0}, {-45.0, 0.0}}));
  connect(angleSensor.phi, phi)
    annotation (Line(origin = {55.0, 0.0}, 
      points = {{-44.0, 0.0}, {55.0, 0.0}}, 
      color = {0, 0, 127}));
end AngleSensor;