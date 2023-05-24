within ServoWing.Sensors.Components;
model Resume "将归一化的角度还原"
  extends Modelica.Blocks.Interfaces.SISO;
protected 
  constant Real pi = Modelica.Constants.pi;
public 
  Modelica.Blocks.Interfaces.IntegerInput n "将角度归一化时增减2pi的次数" 
    annotation (Placement(transformation(origin = {-8.881784197001252e-16, 112.0}, 
      extent = {{-12.0, -12.0}, {12.0, 12.0}}, 
      rotation = -90.0)));
  parameter Real T = 2 * pi;
  annotation (Icon(graphics = {
    Text(extent = {{-80, 80}, {80, -80}}, textString = "角度还原")}));
equation 
  y = u + n * T;
end Resume;