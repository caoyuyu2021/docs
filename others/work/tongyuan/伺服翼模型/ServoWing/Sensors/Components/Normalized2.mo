within ServoWing.Sensors.Components;
model Normalized2 "将角度转换为-180-180度之间"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real min = -180;
  parameter Real max = 180 "deg";
protected 
  parameter Real pi = Modelica.Constants.pi;
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -5.0}, 
      extent = {{-80.0, 75.0}, {80.0, -75.0}}, 
      textString = "-180~180deg", 
      textStyle = {TextStyle.None})}));
public 
  Modelica.Blocks.Interfaces.IntegerOutput n "归一化时减了几个2pi" 
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
algorithm 
  y := u;
  n := 0;
  while y > max loop 
    n := n + 1;
    y := y - (max - min);
  end while;
  while y < min loop 
    n := n - 1;
    y := y + (max - min);
  end while;
end Normalized2;