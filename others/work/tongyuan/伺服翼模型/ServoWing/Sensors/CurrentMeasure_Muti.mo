within ServoWing.Sensors;
model CurrentMeasure_Muti "三相-采样电流传感器"
  extends Icons.BasicModel;
  //参数
  final parameter Real Irange(final unit = "A") = 30 "电流量程";
  final parameter Real Vrange(final unit = "V") = 30 "电压量程";
  parameter Real T(final unit = "s") = 50 / 1e6 "采样周期";
  final parameter Integer n = 12 "采集器位数";
  //实例化
  Modelica.Blocks.Interfaces.RealOutput y[3] "三相电流,A" 
    annotation (Placement(transformation(origin = {-0.2959, -109.5}, rotation = 270, extent = {{-9.5, -10.5}, {9.5, 10.5}})));
  Modelica.Electrical.MultiPhase.Sensors.CurrentSensor currentsensor
    annotation (Placement(transformation(origin = {0.0, 89.0}, 
      extent = {{-10.0, -11.0}, {10.0, 11.0}})));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p
    annotation (Placement(transformation(origin = {-102.0, -0.5}, 
      extent = {{-10.0, -9.5}, {10.0, 9.5}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n
    annotation (Placement(transformation(origin = {101.0, 0.5}, 
      extent = {{-10.0, -9.5}, {10.0, 9.5}})));
  Components.A_D a_d(n = n, 
    min = 0, 
    max = Vrange, 
    samplePeriod = T)
    annotation (Placement(transformation(origin = {-59.0, 4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  Components.A_D a_d1(n = n, 
    min = 0, 
    max = Vrange, 
    samplePeriod = T)
    annotation (Placement(transformation(origin = {0.5, 6.5}, 
      extent = {{-9.5, -9.5}, {9.5, 9.5}}, 
      rotation = -90.0)));
  Modelica.Blocks.Discrete.UnitDelay unitdelay(samplePeriod = T)
    annotation (Placement(transformation(origin = {-58.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Discrete.UnitDelay unitdelay1(samplePeriod = T)
    annotation (Placement(transformation(origin = {0.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.A_D a_d2(n = n, 
    min = 0, 
    max = Vrange, 
    samplePeriod = T)
    annotation (Placement(transformation(origin = {61.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Discrete.UnitDelay unitdelay2(samplePeriod = T)
    annotation (Placement(transformation(origin = {62.0, -62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToVoltage tovoltage(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {-60.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToVoltage tovoltage1(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {0.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToVoltage tovoltage2(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {60.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToCurrent tocurrent(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {-58.0, -28.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToCurrent tocurrent1(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {0.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToCurrent tocurrent2(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {62.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
equation 
  connect(currentsensor.plug_p, plug_p)
    annotation (Line(origin = {-54.5, 43.5}, 
      points = {{45.0, 44.0}, {-26.0, 44.0}, {-26.0, -44.0}, {-48.0, -44.0}}));
  connect(currentsensor.plug_n, plug_n)
    annotation (Line(origin = {54.5, 43.0}, 
      points = {{-47.0, 45.0}, {26.0, 45.0}, {26.0, -43.0}, {47.0, -43.0}}));
  connect(unitdelay.y, y[1])
    annotation (Line(origin = {-30.0, -89.5}, 
      points = {{-28.0, 19.0}, {-28.0, 12.0}, {30.0, 12.0}, {30.0, -20.0}}, 
      color = {0, 0, 127}));
  connect(unitdelay1.y, y[2])
    annotation (Line(origin = {0.0, -90.5}, 
      points = {{0.0, 20.0}, {0.0, -19.0}}, 
      color = {0, 0, 127}));
  connect(unitdelay2.y, y[3])
    annotation (Line(origin = {22.0, -91.5}, 
      points = {{40.0, 19.0}, {40.0, 14.0}, {-22.0, 14.0}, {-22.0, -18.0}}, 
      color = {0, 0, 127}));
  connect(tovoltage.y, a_d.u)
    annotation (Line(origin = {-61.5, 24.5}, 
      points = {{2.0, 9.0}, {2.0, -10.0}, {3.0, -10.0}}, 
      color = {0, 0, 127}));
  connect(currentsensor.i[1], tovoltage.u)
    annotation (Line(origin = {-30.0, 66.0}, 
      points = {{30.0, 11.0}, {30.0, 2.0}, {-30.0, 2.0}, {-30.0, -11.0}}, 
      color = {0, 0, 127}));
  connect(currentsensor.i[2], tovoltage1.u)
    annotation (Line(origin = {-1.0, 65.0}, 
      points = {{0.0, 12.0}, {0.0, -11.0}, {1.0, -11.0}, {1.0, -12.0}}, 
      color = {0, 0, 127}));
  connect(tovoltage1.y, a_d1.u)
    annotation (Line(origin = {-1.5, 24.5}, 
      points = {{2.0, 6.0}, {2.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(tovoltage2.y, a_d2.u)
    annotation (Line(origin = {60.5, 24.5}, 
      points = {{0.0, 6.0}, {0.0, -7.0}, {1.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(currentsensor.i[3], tovoltage2.u)
    annotation (Line(origin = {21.0, 65.0}, 
      points = {{-22.0, 12.0}, {-22.0, 3.0}, {39.0, 3.0}, {39.0, -12.0}}, 
      color = {0, 0, 127}));
  connect(a_d.y, tocurrent.u)
    annotation (Line(origin = {-59.5, -11.5}, 
      points = {{1.0, 4.0}, {1.0, -5.0}, {2.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(tocurrent.y, unitdelay.u)
    annotation (Line(origin = {-60.0, -42.5}, 
      points = {{2.0, 3.0}, {2.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(a_d1.y, tocurrent1.u)
    annotation (Line(origin = {-0.5, -11.5}, 
      points = {{1.0, 7.0}, {1.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(tocurrent1.y, unitdelay1.u)
    annotation (Line(origin = {0.0, -44.5}, 
      points = {{0.0, 3.0}, {0.0, -4.0}}, 
      color = {0, 0, 127}));
  connect(a_d2.y, tocurrent2.u)
    annotation (Line(origin = {61.5, -11.5}, 
      points = {{0.0, 6.0}, {1.0, 6.0}, {1.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(tocurrent2.y, unitdelay2.u)
    annotation (Line(origin = {62.0, -45.5}, 
      points = {{0.0, 4.0}, {0.0, -5.0}}, 
      color = {0, 0, 127}));
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
      extent = {{-7.0, -7.0}, {7.0, 7.0}}), Text(origin = {0.5, -40.5}, 
      extent = {{-29.5, 29.5}, {29.5, -29.5}}, 
      textString = "A"), Line(origin = {-86.0, 0.0}, 
      points = {{-16.0, 0.0}, {16.0, 0.0}}), Line(origin = {81.0, 0.0}, 
      points = {{-11.0, 0.0}, {11.0, 0.0}}), Line(origin = {0.0, -85.0}, 
      points = {{0.0, -15.0}, {0.0, 15.0}}), Text(origin = {-60.0, -80.0}, 
      extent = {{-40.0, 20.0}, {40.0, -20.0}}, 
      textString = "m="), Text(origin = {60.0, -80.0}, 
      extent = {{-40.0, 20.0}, {40.0, -20.0}}, 
      textString = "3", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-135.0, 30.0}, {135.0, -30.0}}, 
      textString = "采样3相电流传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-14.0, -91.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "i", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {27.0, -103.0}, 
      extent = {{-17.0, 3.0}, {17.0, -3.0}}, 
      textString = "\"三相电流,A\"", 
      textStyle = {TextStyle.None})}));
end CurrentMeasure_Muti;