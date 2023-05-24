within ServoWing.Sensors;
model PositionSensor "直线位移传感器"
  //参数
  parameter Integer n = 20 "采集器位数";
  parameter SI.Length max = 2 "最大输出位移";
  parameter SI.Length min = 0 "最小输出位移";

  parameter Real samplePeriod(final unit = "s") = 6.25e-5 "采样周期";

  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
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
      extent = {{-7.0, -7.0}, {7.0, 7.0}}), Text(origin = {0.5, -40.5}, 
      extent = {{-29.5, 29.5}, {29.5, -29.5}}, 
      textString = "P", 
      textStyle = {TextStyle.None}), Line(origin = {-86.0, 0.0}, 
      points = {{-16.0, 0.0}, {16.0, 0.0}}), Line(origin = {81.0, 0.0}, 
      points = {{-11.0, 0.0}, {11.0, 0.0}}), Line(origin = {0.0, -85.0}, 
      points = {{0.0, -15.0}, {0.0, 15.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-120.0, 30.0}, {120.0, -30.0}}, 
      textString = "直线位移传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "机械接口" 
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(origin = {-66.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.A_D a_d(
    n = n, 
    min = min, 
    max = max, 
    samplePeriod = samplePeriod)



    annotation (Placement(transformation(origin = {22.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput s "绝对速度输出接口" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder
    annotation (Placement(transformation(origin = {-32.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(flange_a, positionSensor.flange)
    annotation (Line(origin = {-80.0, 0.0}, 
      points = {{-20.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 127, 0}));

  connect(a_d.y, s)
    annotation (Line(origin = {65.0, 0.0}, 
      points = {{-32.0, 0.0}, {45.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(positionSensor.s, secondOrder.u)
    annotation (Line(origin = {-49.0, 0.0}, 
      points = {{-6.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(secondOrder.y, a_d.u)
    annotation (Line(origin = {-17.0, 0.0}, 
      points = {{-4.0, 0.0}, {28.0, 0.0}}, 
      color = {0, 0, 127}));
end PositionSensor;