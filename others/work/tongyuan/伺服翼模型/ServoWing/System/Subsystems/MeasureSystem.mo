within ServoWing.System.Subsystems;
model MeasureSystem "测量系统"
  extends Icons.BasicModel;
  //磁极位置传感器
  parameter Integer n_p = 20 "采集器位数" 
    annotation (Dialog(tab = "磁极位置传感器"));
  parameter SI.Length min_p = 0 "最小输出位移" 
    annotation (Dialog(tab = "磁极位置传感器"));
  parameter SI.Length max_p = 2 "最大输出位移" 
    annotation (Dialog(tab = "磁极位置传感器"));
  parameter Real samplePeriod_p(final unit = "s") = 50 / 1e6 "采样周期" 
    annotation (Dialog(tab = "磁极位置传感器"));
    //旋转变压器
  parameter Integer n_a = 21 "采集器位数" 
    annotation (Dialog(tab = "旋转变压器"));
  parameter Real max_a = 360 "角度最大值,deg" 
    annotation (Dialog(tab = "旋转变压器"));
  parameter Real min_a = 0 "角度最小值,deg" 
    annotation (Dialog(tab = "旋转变压器"));
  parameter Real samplePeriod_a(final unit = "s") = 50 / 1e6 "采样周期" 
    annotation (Dialog(tab = "旋转变压器"));

  //三相-采样电流传感器
  parameter Real T(final unit = "s") = 50 / 1e6 "采样周期" 
    annotation (Dialog(tab = "三相电流传感器"));
  //变量
  SI.Current i1 = currentMeasure_Muti.y[1] "三相电流";
  SI.Current i2 = currentMeasure_Muti.y[2] "三相电流";
  SI.Current i3 = currentMeasure_Muti.y[3] "三相电流";
  SI.Length s1 = s "传动机构输出位移";
  SI.Force f = flange_a1.f "传动机构输出力";


  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, -30.0}, {60.0, 30.0}}, 
      textString = "测量系统", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Rectangle(origin = {0.0, 0.0}, 
      lineColor = {128, 128, 128}, 
      extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      radius = 25.0), Ellipse(origin = {0.0, -30.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.VerticalCylinder, 
      extent = {{-90.0, -90.0}, {90.0, 90.0}}, 
      startAngle = 20.0, 
      endAngle = 160.0), Ellipse(origin = {0.0, -30.0}, 
      fillColor = {128, 128, 128}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}}), Ellipse(origin = {0.0, -30.0}, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), Polygon(origin = {0.0, -30.0}, 
      rotation = -35.0, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      points = {{-7.0, 0.0}, {-3.0, 85.0}, {0.0, 90.0}, {3.0, 85.0}, {7.0, 0.0}})}));



  Interfaces.BlockInterfaces.RealOutput phi "旋转角度,rad" 
    annotation (
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.BlockInterfaces.RealOutput w "旋转角速度，rad/s" 
    annotation (
      Placement(transformation(origin = {110.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));


  Sensors.PositionSensor polePositionSensor(n = n_p, min = min_p, max = max_p, samplePeriod = samplePeriod_p)
    annotation (Placement(transformation(origin = {-17.999999999999996, 60.000000000000036}, 
      extent = {{-14.0, -14.0}, {14.0, 14.0}})));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p
    annotation (Placement(transformation(origin = {-102.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n
    annotation (Placement(transformation(origin = {-100.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a1
    annotation (Placement(transformation(origin = {-100.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i[2] "电流值,a b相" annotation (Placement(transformation(origin = {110.0, -20.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Interfaces.BlockInterfaces.RealOutput s "位移，m" 
    annotation (
      Placement(transformation(origin = {110.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Sensors.CurrentMeasure_Muti currentMeasure_Muti(T = T) annotation (Placement(transformation(origin = {-12.999999999999996, -38.99999999999997}, 
    extent = {{15.000000000000014, 15.0}, {-15.000000000000014, -15.0}}, 
    rotation = 270.0)));
  Sensors.ResolverSensor resolverSensor
    annotation (Placement(transformation(origin = {-18.0, 20.0}, 
      extent = {{-14.0, -14.0}, {14.0, 14.0}})));
equation 
  connect(polePositionSensor.flange_a, flange_a1)
    annotation (Line(origin = {-77.0, 64.0}, 
      points = {{45.0, -4.0}, {-23.0, -4.0}}, 
      color = {0, 127, 0}));
  connect(polePositionSensor.s, s)
    annotation (Line(origin = {54.0, 61.0}, 
      points = {{-57.0, -1.0}, {56.0, -1.0}}, 
      color = {0, 0, 127}));
  connect(plug_p, currentMeasure_Muti.plug_p)
    annotation (Line(origin = {-55.0, -18.0}, 
      points = {{-47.0, -42.0}, {42.0, -42.0}, {42.0, -36.0}}, 
      color = {0, 0, 255}));
  connect(currentMeasure_Muti.plug_n, plug_n)
    annotation (Line(origin = {-55.0, -54.0}, 
      points = {{42.0, 30.0}, {42.0, 34.0}, {-45.0, 34.0}}, 
      color = {0, 0, 255}));
  connect(currentMeasure_Muti.y[1:2], i)
    annotation (Line(origin = {57.0, -29.0}, 
      points = {{-54.0, -10.0}, {-11.0, -10.0}, {-11.0, 9.0}, {53.0, 9.0}}, 
      color = {0, 0, 127}));
  connect(flange_a, resolverSensor.flange_a)
    annotation (Line(origin = {-66.0, 20.0}, 
      points = {{-34.0, 0.0}, {34.0, 0.0}}));
  connect(resolverSensor.phi_absolute, phi)
    annotation (Line(origin = {54.0, 20.0}, 
      points = {{-57.0, 0.0}, {56.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(resolverSensor.w, w)
    annotation (Line(origin = {54.0, -16.0}, 
      points = {{-57.0, 44.0}, {6.0, 44.0}, {6.0, -44.0}, {56.0, -44.0}}, 
      color = {0, 0, 127}));
end MeasureSystem;