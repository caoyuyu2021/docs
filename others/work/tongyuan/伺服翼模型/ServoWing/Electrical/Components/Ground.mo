within ServoWing.Electrical.Components;
model Ground "地"
  annotation (Coordsys(
    extent = [-100, -100; 100, 100], 
    grid = [2, 2], 
    component = [20, 20]), 
    Documentation(info = "<HTML>








<P>








Ground of an electrical circuit. The potential at the








ground node is zero. Every electrical circuit has to contain








at least one ground object.








</P>








</HTML>








 ", 
      revisions = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">








<HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>








<P><BR>&nbsp;</P></BODY></HTML>








 "), 
    Icon(
      Line(points = [-60, 50; 60, 50]), 
      Line(points = [-40, 30; 40, 30]), 
      Line(points = [-20, 10; 20, 10]), 
      Line(points = [0, 90; 0, 50]), 
      Text(extent = [-144, -60; 138, 0], string = "%name")), 
    Diagram(
      Line(points = [-60, 50; 60, 50], style(thickness = 2)), 
      Line(points = [-40, 30; 40, 30], style(thickness = 2)), 
      Line(points = [-20, 10; 20, 10], style(thickness = 2)), 
      Line(points = [0, 96; 0, 50], style(thickness = 2)), 
      Text(extent = [-24, -38; 22, -6], string = "p.v=0")), 
    Window(
      x = 0.23, 
      y = 0.23, 
      width = 0.59, 
      height = 0.63));
  Modelica.Electrical.Analog.Interfaces.Pin p
    annotation (extent = [-10, 110; 10, 90], 
      rotation = -90);
equation 
  p.v = 0;
end Ground;