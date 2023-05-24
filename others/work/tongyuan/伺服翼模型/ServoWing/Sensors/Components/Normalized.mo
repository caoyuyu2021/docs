within ServoWing.Sensors.Components;
model Normalized "将角度转换为0-360度之间"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real min = 0;
  parameter Real max = 2 * pi "周期";
protected 
  parameter Real pi = Modelica.Constants.pi;
  annotation (Icon(graphics = {
    Text(extent = {{-80, 70}, {80, -80}}, textString = "0~360")}));
public 
  Modelica.Blocks.Interfaces.IntegerOutput n "归一化时减了几个2pi" 
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
algorithm 
  y := u;
  n := 0;
  while y > max loop 
    n := n + 1;
    y := y - max;
  end while;
  while y < min loop 
    n := n - 1;
    y := y + max;
  end while;
end Normalized;