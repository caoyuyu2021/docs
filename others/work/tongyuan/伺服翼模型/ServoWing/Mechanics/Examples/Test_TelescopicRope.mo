within ServoWing.Mechanics.Examples;
model Test_TelescopicRope
  TelescopicRope telescopicRope
    annotation (Placement(transformation(origin = {20.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {-24.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 2, duration = 5)
    annotation (Placement(transformation(origin = {-80.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(position.flange, telescopicRope.drive)
    annotation (Line(origin = {-3.0, -1.0}, 
      points = {{-11.0, 1.0}, {13.0, 1.0}}, 
      color = {0, 0, 0}));
  connect(ramp.y, position.phi_ref)
    annotation (Line(origin = {-49.0, -1.0}, 
      points = {{-20.0, 1.0}, {13.0, 1.0}}, 
      color = {0, 0, 127}));
end Test_TelescopicRope;