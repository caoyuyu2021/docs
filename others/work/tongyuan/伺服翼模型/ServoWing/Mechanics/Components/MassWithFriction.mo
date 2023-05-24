within ServoWing.Mechanics.Components;
model MassWithFriction "带摩擦的线性运动质量块"
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-77.5, 0.0}, 
      points = {{-22.5, 0.0}, {22.5, 0.0}}, 
      color = {0, 127, 0}), Rectangle(origin = {0.5, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Sphere, 
      extent = {{-55.5, -30.0}, {55.5, 30.0}}), Polygon(origin = {-45.0, -90.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-15.0, 0.0}, {15.0, 10.0}, {15.0, -10.0}, {-15.0, 0.0}}), Line(origin = {10.0, -90.0}, 
      points = {{40.0, 0.0}, {-40.0, 0.0}}), Text(origin = {0.0, 75.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
      textString = "%name", 
      textColor = {0, 0, 255}), Text(origin = {0.0, -70.0}, 
      extent = {{-150.0, 15.0}, {150.0, -15.0}}, 
      textString = "m=%m"), Rectangle(origin = {0.0, 50.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Backward, 
      extent = {{-80.0, 10.0}, {80.0, -10.0}}), Rectangle(origin = {0.0, -50.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Backward, 
      extent = {{-80.0, 10.0}, {80.0, -10.0}}), Line(origin = {0.0, 34.0}, 
      points = {{-52.0, 0.0}, {52.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash), Line(origin = {0.0, -34.0}, 
      points = {{-52.0, 0.0}, {52.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash)}));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" annotation (
    Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v "速度";
  Modelica.Blocks.Interfaces.RealOutput a "加速度";
  parameter SI.Mass mass(min = 0) = 100 "质量";
  parameter Real coefv(unit = "N/(m/s)") = 0 "粘性摩擦系数";
  parameter Real wind(unit = "N/(m/s)**2") = 0 "风阻系数";
  parameter SI.Force coul = 0 "库仑摩擦力";
  parameter SI.Force stict = 0 "静摩擦力";
  parameter SI.Angle angle = Modelica.Constants.pi / 2 "倾角=+90(pi/2)，表示接口在最下面;
倾角=-90(-pi/2)，表示接口在最上面。";
  SI.Force force "不考虑摩擦的合力";
  SI.Acceleration vdot "加速度";
  SI.Velocity xdot "速度";
equation 
  force = Modelica.Constants.g_n * mass * sin(angle) + flange_a.f;
  if abs(force) > stict or abs(v) > Modelica.Constants.eps then 
    vdot = (force - coul * sign(v) - coefv * v - wind * abs(v) * v) / mass;
  elseif abs(force) < stict and abs(v) < Modelica.Constants.eps then 
    vdot = 0;
  else
    vdot = 0;
  end if;
  xdot = v;
  a = vdot;
  xdot = der(flange_a.s);
  vdot = der(v);

end MassWithFriction;