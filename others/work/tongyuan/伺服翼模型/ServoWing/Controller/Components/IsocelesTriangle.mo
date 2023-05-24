within ServoWing.Controller.Components;
model IsocelesTriangle "产生等腰三角形信号"
  extends Icons.BasicModel;
  //参数
  parameter Real amplitude = 1 "等腰三角形高度";
  parameter Modelica.SIunits.Time period(final min = Modelica.Constants.small) = 1 "一个周期的时间";
  parameter Real offset = 0 "输出的偏移量";
  parameter Modelica.SIunits.Time startTime = 0 "初始时刻";
protected 
  Modelica.SIunits.Time T0(
    final start = startTime) "每个周期的起始时间";
public 
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  when sample(startTime, period) then 
    T0 = time;
  end when;
  y = offset + (if time < startTime then 0 else 
    if time < T0 + 0.5 * period then (2 * amplitude / period) * (time - T0) else 
    2 * amplitude * (period - time + T0) / period);
  annotation (Coordsys(
    extent = [-100, -100; 100, 100], 
    grid = [1, 1], 
    component = [20, 20]), 
    Window(
      x = 0.21, 
      y = 0.11, 
      width = 0.55, 
      height = 0.71), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {1.0, 1.0}), graphics = {Text(origin = {88.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-45.0, 30.0}, {45.0, -30.0}}, 
      textString = "三角波", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Polygon(origin = {-80.0, 79.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{0.0, 11.0}, {-6.0, -11.0}, {6.0, -11.0}, {0.0, 11.0}}), Line(origin = {-80.0, -6.0}, 
      points = {{0.0, 74.0}, {0.0, -74.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Line(origin = {-4.0, -70.0}, 
      points = {{-86.0, 0.0}, {86.0, 0.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Polygon(origin = {79.0, -70.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{11.0, 0.0}, {-11.0, 5.0}, {-11.0, -5.0}, {11.0, 0.0}}), Polygon(origin = {-33.5, -25.5}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{-0.5, 6.5}, {-3.5, -6.5}, {3.5, -6.5}, {-0.5, 6.5}}), Line(origin = {-34.0, -45.0}, 
      points = {{0.0, 25.0}, {0.0, -25.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Polygon(origin = {-34.0, -63.5}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{0.0, -6.5}, {-3.0, 6.5}, {3.0, 6.5}, {0.0, -6.5}, {0.0, -6.5}}), Text(origin = {-47.0, -43.0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-18.0, 4.0}, {18.0, -4.0}}, 
      textString = "offset"), Text(origin = {-8.0, -76.0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-21.0, 4.0}, {21.0, -4.0}}, 
      textString = "startTime"), Text(origin = {-62.5, 84.0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-19.5, 8.0}, {19.5, -8.0}}, 
      textString = "y"), Text(origin = {77.5, -82.5}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.5, 4.5}, {10.5, -4.5}}, 
      textString = "time"), Line(origin = {-10.0, -45.0}, 
      points = {{0.0, 25.0}, {0.0, -25.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Line(origin = {-10.0, 34.0}, 
      points = {{0.0, 54.0}, {0.0, -54.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Line(origin = {30.0, 73.5}, 
      points = {{0.0, 14.5}, {0.0, -14.5}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Line(origin = {10.0, 83.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Text(origin = {11.0, 89.5}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-23.0, 4.5}, {23.0, -4.5}}, 
      textString = "period"), Line(origin = {-7.0, 60.0}, 
      points = {{-37.0, 0.0}, {37.0, 0.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Line(origin = {-34.0, 20.0}, 
      points = {{0.0, 27.0}, {0.0, -27.0}}, 
      color = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), Text(origin = {-54.5, 20.5}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-18.5, 4.5}, {18.5, -4.5}}, 
      textString = "amplitude"), Polygon(origin = {-33.5, 53.5}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{-0.5, 6.5}, {-3.5, -6.5}, {3.5, -6.5}, {-0.5, 6.5}}), Polygon(origin = {-34.0, -13.5}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{0.0, -6.5}, {-3.0, 6.5}, {3.0, 6.5}, {0.0, -6.5}, {0.0, -6.5}}), Polygon(origin = {-5.5, 83.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.5, 0.0}, {4.5, 2.0}, {4.5, -2.0}, {-4.5, 0.0}}), Polygon(origin = {26.0, 83.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      points = {{4.0, 0.0}, {-4.0, 2.0}, {-4.0, -2.0}, {4.0, 0.0}}), Line(origin = {-5.0, 20.0}, 
      points = {{-75.0, -40.0}, {-5.0, -40.0}, {15.0, 40.0}, {35.0, -40.0}, {55.0, 40.0}, {75.0, -40.0}}, 
      thickness = 0.5)}), 
    Diagram(coordinateSystem(preserveAspectRatio = false, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {1, 1}), 
      graphics = {
      Polygon(points = {{-80, 90}, {-86, 68}, {-74, 68}, {-80, 90}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-80, 68}, {-80, -80}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-90, -70}, {82, -70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{90, -70}, {68, -65}, {68, -75}, {90, -70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{-34, -19}, {-37, -32}, {-30, -32}, {-34, -19}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-34, -20}, {-34, -70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{-34, -70}, {-37, -57}, {-31, -57}, {-34, -70}, {-34, -70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{-65, -39}, {-29, -47}}, textString = "offset", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{-29, -72}, {13, -80}}, textString = "startTime", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{-82, 92}, {-43, 76}}, textString = "y", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{67, -78}, {88, -87}}, textString = "time", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-10, -20}, {-10, -70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-10, 88}, {-10, -20}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{30, 88}, {30, 59}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-10, 83}, {30, 83}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{-12, 94}, {34, 85}}, textString = "period", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-44, 60}, {30, 60}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-34, 47}, {-34, -7}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Text(extent = {{-73, 25}, {-36, 16}}, textString = "amplitude", color = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{-34, 60}, {-37, 47}, {-30, 47}, {-34, 60}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{-34, -20}, {-37, -7}, {-31, -7}, {-34, -20}, {-34, -20}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{-10, 83}, {-1, 85}, {-1, 81}, {-10, 83}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Polygon(points = {{30, 83}, {22, 85}, {22, 81}, {30, 83}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), 
      Line(points = {{-80, -20}, {-10, -20}, {10, 60}, {30, -20}, {50, 60}, 
      {70, -20}}, thickness = 0.5)}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD><BODY>








<P>The Real output y is a isoceles triangle signal: </P><P>&nbsp;</P></BODY></HTML>"), 
    experiment(StartTime = 0, StopTime = 2, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, IntegratorStep = 0.004, DoublePrecision = false));
end IsocelesTriangle;