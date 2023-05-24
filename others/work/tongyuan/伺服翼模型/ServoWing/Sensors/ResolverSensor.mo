within ServoWing.Sensors;
model ResolverSensor "旋转变压器"
  extends Icons.BasicModel;
  //参数
  parameter Integer n = 21 "采集器位数";
  parameter Real max = 360 "最大值";
  parameter Real min = 0 "最小值";
  parameter Real samplePeriod(final unit = "s") = 6.25e-5 "采样周期";
  //实例化
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent = {{-110, -11}, {-90, 9}})));
  Modelica.Blocks.Interfaces.RealOutput phi "测量角度输出rad" 
    annotation (Placement(transformation(origin = {110.0, -41.5}, 
      extent = {{-10.0, -9.5}, {10.0, 9.5}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor
    annotation (
      Placement(transformation(origin = {-78.51, -0.421000000000002}, 
        extent = {{-10.0, -9.5}, {10.0, 9.5}})));
  Modelica.Blocks.Math.Gain gain(k = 180 / Modelica.Constants.pi)
    annotation (Placement(transformation(extent = {{-58.18, -6.18}, {-45.82, 6.18}})));
  Components.A_D a_d(
    n = n, 
    min = min, 
    max = max, 
    samplePeriod = samplePeriod)
    annotation (Placement(transformation(extent = {{-2, -10}, {18, 10}})));
  Components.Normalized normalized(
    max = 360)
    annotation (Placement(transformation(extent = {{-34, -10}, {-14, 10}})));
  Components.Resume resume(T = 360)
    annotation (Placement(transformation(origin = {42.0, 35.89}, 
      extent = {{-6.18, -6.18}, {6.18, 6.18}})));
  Modelica.Blocks.Interfaces.RealOutput w "测量角速度输出,rad/s" 
    annotation (Placement(transformation(extent = {{100, 50}, {120, 70}})));


  Modelica.Blocks.Math.Gain gain2(k = Modelica.Constants.pi / 180)
    annotation (Placement(transformation(extent = {{67.82, -6.18}, {80.18, 6.18}})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
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
      extent = {{-7.0, -7.0}, {7.0, 7.0}}), Line(origin = {-80.0, 0.0}, 
      points = {{10.0, 0.0}, {-10.0, 0.0}}), Line(origin = {85.0, 0.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 0, 127}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "旋转变压器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {62.5, 7.5}, 
      extent = {{-34.5, 10.5}, {34.5, -10.5}}, 
      textString = "phi_absolute", 
      textStyle = {TextStyle.None}), Text(origin = {80.0, 61.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "w", 
      textStyle = {TextStyle.None}), Text(origin = {74.5, -37.5}, 
      extent = {{-24.5, 7.5}, {24.5, -7.5}}, 
      textString = "phi", 
      textStyle = {TextStyle.None}), Text(origin = {73.5, -80.5}, 
      extent = {{-21.5, 6.5}, {21.5, -6.5}}, 
      textString = "n1", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {102.0, -55.0}, 
      extent = {{-22.0, 5.0}, {22.0, -5.0}}, 
      textString = "测量角度输出rad
(0~2pi)", 
      textStyle = {TextStyle.None}), Text(origin = {111.0, 47.0}, 
      extent = {{-23.0, 5.0}, {23.0, -5.0}}, 
      textString = "测量角度输出rad/s", 
      textStyle = {TextStyle.None}), Text(origin = {108.0, -13.0}, 
      extent = {{-30.0, 5.0}, {30.0, -5.0}}, 
      textString = "测量绝对角度输出rad
", 
      textStyle = {TextStyle.None}), Text(origin = {103.0, -91.0}, 
      extent = {{-19.0, 3.0}, {19.0, -3.0}}, 
      textString = "圈数", 
      textStyle = {TextStyle.None})}));



  Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = samplePeriod)
    annotation (Placement(transformation(origin = {48.0, 0.0}, 
      extent = {{-8.0, -8.0}, {8.0, 8.0}})));
  Modelica.Blocks.Interfaces.RealOutput phi_absolute "测量绝对角度输出rad" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.IntegerOutput n1 "圈数" 
    annotation (Placement(transformation(origin = {110.0, -80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain3(k = Modelica.Constants.pi / 180)
    annotation (Placement(transformation(origin = {72.0, 36.0}, 
      extent = {{-6.180000000000007, -6.18}, {6.180000000000007, 6.18}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(origin = {8.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = samplePeriod)
    annotation (Placement(transformation(origin = {64.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(gain.y, normalized.u)
    annotation (Line(points = {{-45, 0}, {-36, 0}}, color = {0, 0, 127}));
  connect(normalized.y, a_d.u)
    annotation (Line(points = {{-13, 0}, {-4, 0}}, color = {0, 0, 127}));
  connect(normalized.n, resume.n)
    annotation (Line(origin = {16.0, 35.0}, 
      points = {{-40.0, -24.0}, {-40.0, 16.0}, {26.0, 16.0}, {26.0, 8.0}}, 
      color = {255, 127, 0}));


  connect(anglesensor.phi, gain.u)
    annotation (Line(origin = {-64.0, 0.0}, 
      points = {{-4.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(anglesensor.flange, flange_a)
    annotation (Line(origin = {-95.0, -1.0}, 
      points = {{6.0, 1.0}, {-5.0, 1.0}, {-5.0, 0.0}}));
  connect(a_d.y, resume.u)
    annotation (Line(origin = {30.0, 20.0}, 
      points = {{-11.0, -20.0}, {1.0, -20.0}, {1.0, 16.0}, {5.0, 16.0}}, 
      color = {0, 0, 127}));
  connect(gain2.y, phi)
    annotation (Line(origin = {96.0, -41.0}, 
      points = {{-15.0, 41.0}, {-10.0, 41.0}, {-10.0, -1.0}, {14.0, -1.0}}, 
      color = {0, 0, 127}));
  connect(a_d.y, unitDelay.u)
    annotation (Line(origin = {29.0, 0.0}, 
      points = {{-10.0, 0.0}, {12.0, 0.0}, {12.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(unitDelay.y, gain2.u)
    annotation (Line(origin = {64.0, 0.0}, 
      points = {{-7.0, 1.0}, {3.0, 1.0}, {3.0, 0.0}}, 
      color = {0, 0, 127}));

  connect(normalized.n, n1)
    annotation (Line(origin = {38.0, -29.0}, 
      points = {{-62.0, 40.0}, {-62.0, 51.0}, {-46.0, 51.0}, {-46.0, -51.0}, {72.0, -51.0}}, 
      color = {255, 127, 0}));
  connect(resume.y, gain3.u)
    annotation (Line(origin = {57.0, 36.0}, 
      points = {{-8.0, 0.0}, {7.583999999999989, 0.0}}, 
      color = {0, 0, 127}));
  connect(speedSensor.flange, flange_a)
    annotation (Line(origin = {-31.0, 52.0}, 
      points = {{29.0, 8.0}, {-69.0, 8.0}, {-69.0, -53.0}}));
  connect(speedSensor.w, sampler.u)
    annotation (Line(origin = {36.0, 60.0}, 
      points = {{-17.0, 0.0}, {16.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sampler.y, w)
    annotation (Line(origin = {93.0, 60.0}, 
      points = {{-18.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(gain3.y, phi_absolute)
    annotation (Line(origin = {95.0, 18.0}, 
      points = {{-16.0, 18.0}, {-3.0, 18.0}, {-3.0, -18.0}, {15.0, -18.0}}, 
      color = {0, 0, 127}));
end ResolverSensor;