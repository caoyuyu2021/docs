within ServoWing.Mechanics.rope;
model winchT1D_N "一维平动绞盘"
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {46.0, -56.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-10.0, 32.0}, {10.0, -32.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-60.0, 60.0}, {60.0, -60.0}}), Rectangle(origin = {0.0, 70.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Line(origin = {-79.0, 10.0}, 
      points = {{-21.0, 0.0}, {21.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-79.0, -10.0}, 
      points = {{-21.0, 0.0}, {21.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-6.0, 6.0}, {6.0, -6.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-20.0, 20.0}, {20.0, -20.0}}), Line(origin = {-10.0, 39.0}, 
      points = {{0.0, 21.0}, {0.0, -21.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {10.0, 39.0}, 
      points = {{0.0, 21.0}, {0.0, -21.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {2.0, 25.0}, 
      points = {{-38.0, -19.0}, {-38.0, -15.0}, {-34.0, 1.0}, {-22.0, 13.0}, {-2.0, 19.0}, {16.0, 13.0}, {26.0, 7.0}, {34.0, -3.0}, {38.0, -17.0}}, 
      thickness = 2.0, 
      arrow = {Arrow.Filled, Arrow.None}, 
      smooth = Smooth.Bezier), Line(origin = {-77.0, 0.0}, 
      points = {{3.0, -14.0}, {-1.0, -16.0}, {-7.0, -12.0}, {-5.0, 2.0}, {-3.0, 12.0}, {-0.38337641321690796, 15.846649434713239}, {7.0, 16.0}}, 
      thickness = 1.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      smooth = Smooth.Bezier)}));
  Modelica.Mechanics.Translational.Interfaces.Flange_a pull
    annotation (Placement(transformation(origin = {0.0, 90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b rope
    annotation (Placement(transformation(origin = {46.0, -98.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive annotation (Placement(transformation(origin = {-100.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.SIunits.Velocity v_rope "rope的速度";
  Modelica.SIunits.Velocity v_pull "pull接口的速度";
  Modelica.SIunits.AngularVelocity w_drive "drive接口的角速度";
  Real a1 "绳子解开/缠绕的长度";
  parameter Real R(unit = "m") = 0.25 "绞盘半径";
equation 
  v_rope = der(rope.s);
  v_pull = der(pull.s);
  w_drive = -der(drive.phi);
  -v_rope = v_pull + R * w_drive;
  rope.f = pull.f;
  -drive.tau = R * rope.f;
  a1 = R * drive.phi;
end winchT1D_N;