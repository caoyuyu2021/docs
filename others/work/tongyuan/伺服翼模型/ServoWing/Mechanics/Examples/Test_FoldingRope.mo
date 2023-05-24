within ServoWing.Mechanics.Examples;
model Test_FoldingRope



  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {-24.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 2, duration = 5)
    annotation (Placement(transformation(origin = {-80.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  FoldingRope foldingRope
    annotation (Placement(transformation(origin = {28.0, 0.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {10.0, -34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(origin = {68.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(ramp.y, position.phi_ref)
    annotation (Line(origin = {-49.0, -1.0}, 
      points = {{-20.0, 1.0}, {13.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(fixed.flange, foldingRope.pull1)
    annotation (Line(origin = {14.0, -17.0}, 
      points = {{-4.0, -17.0}, {-4.0, 17.0}, {4.0, 17.0}}, 
      color = {0, 127, 0}));
  connect(foldingRope.pull, fixed1.flange)
    annotation (Line(origin = {53.0, -16.0}, 
      points = {{-15.0, 16.0}, {15.0, 16.0}, {15.0, -16.0}}, 
      color = {0, 127, 0}));
  connect(position.flange, foldingRope.drive_R)
    annotation (Line(origin = {2.0, -3.0}, 
      points = {{-16.0, 3.0}, {-4.0, 3.0}, {-4.0, -3.0}, {16.0, -3.0}}, 
      color = {0, 0, 0}));
end Test_FoldingRope;