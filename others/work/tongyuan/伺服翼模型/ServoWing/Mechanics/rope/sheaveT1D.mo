within ServoWing.Mechanics.rope;
model sheaveT1D "一维平动滑轮"
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-60.0, 60.0}, {60.0, -60.0}}, 
      endAngle = 180.0), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-50.0, 50.0}, {50.0, -50.0}}), Rectangle(origin = {-55.0, -40.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-5.0, 40.0}, {5.0, -40.0}}), Rectangle(origin = {55.0, -40.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-5.0, 40.0}, {5.0, -40.0}}), Line(origin = {-80.0, 10.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-80.0, -10.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-20.0, 20.0}, {20.0, -20.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Rectangle(origin = {0.0, 44.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-6.0, 24.0}, {6.0, -24.0}}), Line(origin = {33.0, -18.0}, 
      points = {{-7.0, -10.0}, {-1.0, -8.0}, {7.0, 4.0}, {7.0, 10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0, 
      arrow = {Arrow.Filled, Arrow.None}, 
      arrowSize = 5.0, 
      smooth = Smooth.Bezier), Line(origin = {0.0, 84.00000000000001}, 
      points = {{0.0, -16.000000000000014}, {0.0, 15.999999999999986}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-55.0, -90.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {55.0, -90.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-33.0, 10.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash, 
      thickness = 1.0), Line(origin = {-34.0, -10.0}, 
      points = {{-16.0, 0.0}, {16.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash, 
      thickness = 1.0), Rectangle(origin = {-55.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-4.5, 2.0}, {4.5, -2.0}}), Rectangle(origin = {55.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-4.5, 2.0}, {4.5, -2.0}})}));
  Modelica.Mechanics.Translational.Interfaces.Flange_a pull
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b rope1
    annotation (Placement(transformation(origin = {-56.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b rope2
    annotation (Placement(transformation(origin = {54.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.SIunits.Velocity v_rope1 "rope1接口的速度";
  Modelica.SIunits.Velocity v_rope2 "rope2接口的速度";
  Modelica.SIunits.Velocity v_pull "pull接口的速度";
  Modelica.SIunits.AngularVelocity w_drive "drive接口的角速度";
  Real a1 "左端绳子解开的长度";
  Real a2 "右端绳子缠绕的长度";
  parameter Real R(unit = "m") = 0.25 "滑轮半径";
equation 
  v_rope1 = der(rope1.s);
  v_rope2 = der(rope2.s);
  v_pull = der(pull.s);
  w_drive = der(drive.phi);
  v_rope1 = v_pull + R * w_drive;
  v_rope2 = v_pull - R * w_drive;
  pull.f = rope1.f + rope2.f;
  drive.tau = R * (rope1.f - rope2.f);
  a1 = R * drive.phi;
  a2 = -R * drive.phi;
end sheaveT1D;