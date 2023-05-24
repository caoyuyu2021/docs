within ServoWing.Sensors;
model HallSensor "磁极位置传感器"
  parameter Boolean useSupport = false "是否用相对位置，true：使用相对位置，false：不使用相对位置";
  parameter Integer p(min = 1) = 2 "极对数";
  parameter ServoLib.Utilities.Types.Angle shift(min = 0) = 0 "初始偏置角度,rad";
  ServoLib.Utilities.Types.Angle angle "电机转子位置角,在0-360度区间范围内";
  ServoLib.Interfaces.RotationalInterfaces.Flange_a flange
    annotation (Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  ServoLib.Interfaces.RotationalInterfaces.Flange_a Support if useSupport "是否使用Support接口，false表示不使用，电机定子完全固定" 
    annotation (Placement(transformation(extent = {{-60, -88}, {-40, -68}})));
  ServoLib.Interfaces.BlockInterfaces.BooleanInput y[3]
    annotation (Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport
    annotation (Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor "电机转子位置角,在0-360度区间范围内" 
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-50, 30})));
equation 
  angle = mod(p * relanglesensor.phi_rel + shift, 2 * Modelica.Constants.pi);
  y[1] = not (angle > Modelica.Constants.pi / 3 and angle < 4 * Modelica.Constants.pi / 3);
  y[2] = angle < Modelica.Constants.pi;
  y[3] = angle > 2 * Modelica.Constants.pi / 3 and angle < 5 * Modelica.Constants.pi / 3;
  connect(flange, relanglesensor.flange_b)
    annotation (Line(color = {0, 0, 0}, points = {{-100, 0}, {-100, 60}, {-50, 60}, {-50, 40}}));
  connect(Support, relanglesensor.flange_a)
    annotation (Line(color = {0, 0, 0}, points = {{-50, -78}, {-50, 20}}));
  connect(fixed.flange, relanglesensor.flange_a)
    annotation (Line(color = {0, 0, 0}, points = {{-20, 0}, {-50, 0}, {-50, 20}}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      radius = 25.0), Polygon(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-90.0, 0.0}, {-50.0, 80.0}, {50.0, 80.0}, {90.0, 0.0}, {50.0, -80.0}, {-50.0, -80.0}, {-90.0, 0.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {135, 135, 135}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 60.0}, {60.0, -60.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-56.0, 56.0}, {56.0, -56.0}}), Rectangle(origin = {-49.5, 0.0}, 
      fillColor = {175, 175, 175}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-50.5, 10.0}, {50.5, -10.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {175, 175, 175}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Sphere, 
      extent = {{-25.0, -25.0}, {25.0, 25.0}}), Polygon(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      fillColor = {0, 127, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, -6.0}, {6.0, -6.0}, {0.0, 6.0}, {-6.0, -6.0}}), Rectangle(origin = {0.0, 20.0}, 
      fillColor = {0, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, 20.0}, {10.0, -20.0}}), Rectangle(origin = {0.0, -20.0}, 
      fillColor = {255, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, 20.0}, {10.0, -20.0}}), Rectangle(origin = {60.0, 0.0}, 
      fillColor = {215, 215, 215}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, 20.0}, {10.0, -20.0}}), Polygon(origin = {-33.0, 50.0}, 
      fillColor = {215, 215, 215}, 
      fillPattern = FillPattern.Solid, 
      points = {{-11.0, -20.0}, {23.0, 3.0}, {11.0, 20.0}, {-23.0, -3.0}, {-11.0, -20.0}}), Polygon(origin = {-33.0, -50.0}, 
      fillColor = {215, 215, 215}, 
      fillPattern = FillPattern.Solid, 
      points = {{23.0, -3.0}, {-11.0, 20.0}, {-23.0, 3.0}, {11.0, -20.0}, {23.0, -3.0}}), Polygon(origin = {60.5, 0.0}, 
      lineColor = {0, 0, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      points = {{6.5, 0.0}, {-6.5, -6.0}, {-6.5, 6.0}, {6.5, 0.0}}), Polygon(origin = {-30.5, 48.0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-3.5, -7.0}, {6.5, 0.0}, {-6.5, 7.0}, {-3.5, -7.0}}), Polygon(origin = {-30.5, -48.0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-3.5, 7.0}, {6.5, 0.0}, {-6.5, -7.0}, {-3.5, 7.0}}), Rectangle(origin = {-50.0, -78.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {192, 192, 192}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-12.0, 12.0}, {12.0, -12.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-120.0, 30.0}, {120.0, -30.0}}, 
      textString = "磁极位置传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end HallSensor;