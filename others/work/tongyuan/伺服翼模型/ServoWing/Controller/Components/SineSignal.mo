within ServoWing.Controller.Components;
model SineSignal "正弦信号源"
  parameter Real delta(unit = "deg") = 0.7 "信号幅值";
  parameter SI.AngularVelocity w = 2 "信号角速度";



  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      radius = 25.0), Line(origin = {-80.0, -6.0}, 
      points = {{0.0, 74.0}, {0.0, -74.0}}, 
      color = {192, 192, 192}), Polygon(origin = {-80.0, 79.0}, 
      lineColor = {192, 192, 192}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{0.0, 11.0}, {-8.0, -11.0}, {8.0, -11.0}, {0.0, 11.0}}), Line(origin = {-11.0, 0.0}, 
      points = {{-79.0, 0.0}, {79.0, 0.0}}, 
      color = {192, 192, 192}), Polygon(origin = {79.0, 0.0}, 
      lineColor = {192, 192, 192}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{11.0, 0.0}, {-11.0, 8.0}, {-11.0, -8.0}, {11.0, 0.0}}), Line(origin = {0.0, -0.10000000000000142}, 
      points = {{-80.0, 0.10000000000000142}, {-68.7, 34.300000000000004}, {-61.5, 53.2}, {-55.1, 66.5}, {-49.4, 74.69999999999999}, {-43.8, 79.19999999999999}, {-38.2, 79.9}, {-32.6, 76.69999999999999}, {-26.9, 69.80000000000001}, {-21.3, 59.5}, {-14.9, 44.2}, {-6.83, 21.3}, {10.1, -30.7}, {17.3, -50.1}, {23.7, -64.1}, {29.3, -73.0}, {35.0, -78.30000000000001}, {40.6, -79.9}, {46.2, -77.5}, {51.9, -71.4}, {57.5, -61.8}, {63.9, -47.1}, {72.0, -24.7}, {80.0, 0.10000000000000142}}, 
      smooth = Smooth.Bezier), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "正弦信号", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Modelica.Blocks.Interfaces.RealOutput y "信号，rad" annotation (Placement(
    transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
equation 
  y = delta / 180 * pi * sin(w * time);
end SineSignal;