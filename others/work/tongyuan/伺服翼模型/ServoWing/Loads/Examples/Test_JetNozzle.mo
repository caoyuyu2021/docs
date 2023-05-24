within ServoWing.Loads.Examples;
model Test_JetNozzle
  extends Modelica.Icons.Example;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.002, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  JetNozzleX jetNozzle2_1(
    world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity))
    annotation (Placement(transformation(origin = {60.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position(
    useSupport = true) annotation (Placement(transformation(origin = {-36.0, 26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10 / 1000, freqHz = 0.5)
    annotation (Placement(transformation(origin = {-72.0, 26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position1(
    useSupport = true) annotation (Placement(transformation(origin = {-36.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 407.5 / 1000)
    annotation (Placement(transformation(origin = {-36.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 407.5 / 1000)
    annotation (Placement(transformation(origin = {-36.0, -42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 10 / 1000, 
    phase = 1.5707963267949, 
    freqHz = 0.5)
    annotation (Placement(transformation(origin = {-76.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 0.8e7, d = 10000000)
    annotation (Placement(transformation(origin = {12.0, 26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 0.8e7, d = 10000000)
    annotation (Placement(transformation(origin = {12.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(position.support, fixed.flange)
    annotation (Line(origin = {-30.0, 11.0}, 
      points = {{-6.0, 5.0}, {-6.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(position1.support, fixed1.flange)
    annotation (Line(origin = {-36.0, -34.0}, 
      points = {{0.0, 8.0}, {0.0, -8.0}}, 
      color = {0, 127, 0}));
  connect(sine.y, position.s_ref)
    annotation (Line(origin = {-52.0, 26.0}, 
      points = {{-9.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, position1.s_ref)
    annotation (Line(origin = {-70.0, -15.0}, 
      points = {{5.0, -1.0}, {22.0, -1.0}}, 
      color = {0, 0, 127}));
  connect(position.flange, springDamper.flange_a)
    annotation (Line(origin = {-12.0, 26.0}, 
      points = {{-14.0, 0.0}, {14.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(position1.flange, springDamper1.flange_a)
    annotation (Line(origin = {-12.0, -16.0}, 
      points = {{-14.0, 0.0}, {14.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(springDamper.flange_b, jetNozzle2_1.flange_y)
    annotation (Line(origin = {36.0, 17.0}, 
      points = {{-14.0, 9.0}, {-2.0, 9.0}, {-2.0, -11.0}, {14.0, -11.0}}, 
      color = {0, 127, 0}));
  connect(springDamper1.flange_b, jetNozzle2_1.flange_z)
    annotation (Line(origin = {36.0, -8.0}, 
      points = {{-14.0, -8.0}, {-2.0, -8.0}, {-2.0, 6.0}, {14.0, 6.0}}, 
      color = {0, 127, 0}));
end Test_JetNozzle;