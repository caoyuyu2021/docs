within ServoWing.System.Examples;
model Model1
  Mechanics.TelescopicGear telescopicRope annotation (Placement(transformation(origin = {28.0, 2.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.ServoSysGearS servoSysGear
    annotation (Placement(transformation(origin = {-10.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 0.4, duration = 5)
    annotation (Placement(transformation(origin = {-68.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 20)
    annotation (Placement(transformation(origin = {68.0, 18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(servoSysGear.flange_a, telescopicRope.drive)
    annotation (Line(origin = {25.0, 5.0}, 
      points = {{-25.0, -3.0}, {-7.0, -3.0}}, 
      color = {0, 0, 0}));
  connect(ramp.y, servoSysGear.u)
    annotation (Line(origin = {-40.0, 0.0}, 
      points = {{-17.0, 2.0}, {19.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(telescopicRope.pull1, mass.flange_a)
    annotation (Line(origin = {45.0, 10.0}, 
      points = {{-15.0, -4.0}, {-13.0, -4.0}, {-13.0, 8.0}, {13.0, 8.0}}, 
      color = {0, 127, 0}));
end Model1;