within ServoWing.Mechanics.Examples;
model winchTest "绞盘测试"
  extends ServoWing.Icons.Test;
  Modelica.Mechanics.Rotational.Sources.Position speed annotation (Placement(transformation(origin = {-42.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {0.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));



  rope.winchT1D_S winchT1D1
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 5, duration = 5)
    annotation (Placement(transformation(origin = {-90.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.MassWithFriction massWithFriction annotation (Placement(transformation(origin = {-4.0, -68.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
    rotation = 270.0)));
  rope.ropeT1D ropeT1D1
    annotation (Placement(transformation(origin = {-4.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  Modelica.Mechanics.Rotational.Sources.Position speed1 annotation (Placement(transformation(origin = {86.0, 4.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(origin = {128.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));
  rope.winchT1D_N winchT1D2 annotation (Placement(transformation(origin = {128.0, 4.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp1(height = 5, duration = 5)
    annotation (Placement(transformation(origin = {38.0, 4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.MassWithFriction massWithFriction1 annotation (Placement(transformation(origin = {124.00000000000003, -64.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
    rotation = 270.0)));
  rope.ropeT1D ropeT1D2
    annotation (Placement(transformation(origin = {124.00000000000003, -28.000000000000007}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {160.0, 100.0}}, 
    grid = {2.0, 2.0})));
equation 
  connect(fixed.flange, winchT1D1.pull)
    annotation (Line(origin = {0.0, 23.0}, 
      points = {{0.0, 17.0}, {0.0, -14.0}}, 
      color = {0, 127, 0}));
  connect(speed.flange, winchT1D1.drive)
    annotation (Line(origin = {-27.0, 0.0}, 
      points = {{-5.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(winchT1D1.rope, ropeT1D1.rope2)
    annotation (Line(origin = {-4.0, -16.0}, 
      points = {{0.0, 5.0}, {0.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D1.rope1, massWithFriction.flange_a)
    annotation (Line(origin = {-5.0, -49.0}, 
      points = {{1.0, 6.0}, {1.0, -9.0}}, 
      color = {0, 127, 0}));
  connect(ramp.y, speed.phi_ref)
    annotation (Line(origin = {-66.0, 0.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(fixed1.flange, winchT1D2.pull)
    annotation (Line(origin = {128.0, 27.0}, 
      points = {{0.0, 17.0}, {0.0, -14.0}}, 
      color = {0, 127, 0}));
  connect(speed1.flange, winchT1D2.drive)
    annotation (Line(origin = {101.0, 4.0}, 
      points = {{-5.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(winchT1D2.rope, ropeT1D2.rope2)
    annotation (Line(origin = {124.0, -12.0}, 
      points = {{0.0, 5.0}, {0.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D2.rope1, massWithFriction1.flange_a)
    annotation (Line(origin = {123.0, -45.0}, 
      points = {{1.0, 6.0}, {1.0, -9.0}}, 
      color = {0, 127, 0}));
  connect(ramp1.y, speed1.phi_ref)
    annotation (Line(origin = {62.0, 4.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
end winchTest;