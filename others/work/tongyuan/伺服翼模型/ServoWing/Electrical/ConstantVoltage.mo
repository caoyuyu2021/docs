within ServoWing.Electrical;
model ConstantVoltage "直流电源"
  parameter SI.Voltage V = 30 "直流电源电压";
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  annotation (Coordsys(
    extent = [-100, -100; 100, 100], 
    grid = [1, 1], 
    component = [20, 20]), 
    Window(
      x = 0.33, 
      y = 0.18, 
      width = 0.6, 
      height = 0.6), 
    Icon(
      Line(points = [-90, 0; -10, 0], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [-10, 60; -10, -60], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [0, 30; 0, -30], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [0, 0; 90, 0], style(color = 0, rgbcolor = {0, 0, 0})), 
      Text(extent = [-100, -120; 100, -80], string = "%name=%V"), 
      Text(
        extent = [-120, 50; -20, 0], 
        style(color = 3, rgbcolor = {0, 0, 255}), 
        string = "+"), 
      Text(
        extent = [20, 50; 120, 0], 
        style(color = 3, rgbcolor = {0, 0, 255}), 
        string = "-")), 
    Diagram(
      Line(points = [-90, 0; -10, 0], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [-10, 60; -10, -60], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [0, 30; 0, -30], style(color = 0, rgbcolor = {0, 0, 0})), 
      Line(points = [0, 0; 90, 0], style(color = 0, rgbcolor = {0, 0, 0}))), 
    Documentation(revisions = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">








<HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>








<P>&nbsp;</P></BODY></HTML>








 "));
equation 
  v = V;
end ConstantVoltage;