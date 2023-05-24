﻿within ServoWing.Icons;
connector SignalBus "总线接口图标"
  annotation (Icon(coordinateSystem(
    preserveAspectRatio = false, 
    extent = {{-100, -100}, {100, 100}}, 
    grid = {2, 2}, 
    initialScale = 0.2), graphics = {
    Rectangle(
    extent = {{-20, 2}, {20, -2}}, 
    lineColor = {255, 204, 51}, 
    lineThickness = 0.5), 
    Polygon(
    points = {{-80, 50}, {80, 50}, {100, 30}, {80, -40}, {60, -50}, {-60, -50}, {-80, 
    -40}, {-100, 30}, {-80, 50}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {255, 204, 51}, 
    fillPattern = FillPattern.Solid), 
    Ellipse(
    extent = {{-65, 25}, {-55, 15}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {0, 0, 0}, 
    fillPattern = FillPattern.Solid), 
    Ellipse(
    extent = {{-5, 25}, {5, 15}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {0, 0, 0}, 
    fillPattern = FillPattern.Solid), 
    Ellipse(
    extent = {{55, 25}, {65, 15}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {0, 0, 0}, 
    fillPattern = FillPattern.Solid), 
    Ellipse(
    extent = {{-35, -15}, {-25, -25}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {0, 0, 0}, 
    fillPattern = FillPattern.Solid), 
    Ellipse(
    extent = {{25, -15}, {35, -25}}, 
    lineColor = {0, 0, 0}, 
    fillColor = {0, 0, 0}, 
    fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(
      preserveAspectRatio = false, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {2, 2}, 
      initialScale = 0.2), graphics = {
      Polygon(
      points = {{-40, 25}, {40, 25}, {50, 15}, {40, -20}, {30, -25}, {-30, -25}, {-40, 
      -20}, {-50, 15}, {-40, 25}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {255, 204, 51}, 
      fillPattern = FillPattern.Solid), 
      Ellipse(
      extent = {{-32.5, 7.5}, {-27.5, 12.5}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Ellipse(
      extent = {{-2.5, 12.5}, {2.5, 7.5}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Ellipse(
      extent = {{27.5, 12.5}, {32.5, 7.5}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Ellipse(
      extent = {{-17.5, -7.5}, {-12.5, -12.5}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Ellipse(
      extent = {{12.5, -7.5}, {17.5, -12.5}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Text(
      extent = {{-150, 70}, {150, 40}}, 
      lineColor = {0, 0, 0}, 
      textString = 
      "%name")}), 
    Documentation(Error, 
      info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">



<HTML><HEAD>



<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>



<META name=GENERATOR content=\"MSHTML 11.00.9600.18231\"></HEAD>



<BODY>



<P>&nbsp;</P></BODY></HTML>



 "));
end SignalBus;