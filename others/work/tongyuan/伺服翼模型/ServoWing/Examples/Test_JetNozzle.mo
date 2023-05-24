within ServoWing.Examples;
model Test_JetNozzle
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 20, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Loads.JetNozzle jetNozzle
    annotation (Placement(transformation(origin = {31.0, 1.0}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}})));
  Modelica.Mechanics.Translational.Sources.Position position1(useSupport = false)
    annotation (Placement(transformation(origin = {-30.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 0.027065, offset = 0.0585, 
    freqHz = 0.1) annotation (Placement(transformation(origin = {-82.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position2(useSupport = false)
    annotation (Placement(transformation(origin = {-46.0, -34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 0.0586)
    annotation (Placement(transformation(origin = {-88.0, -34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine2.y, position1.s_ref)
    annotation (Line(origin = {-63.0, 6.0}, 
      points = {{-8.0, 2.0}, {21.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, jetNozzle.flange_y)
    annotation (Line(origin = {-2.0, 8.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}, {18.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(const.y, position2.s_ref)
    annotation (Line(origin = {-67.0, -34.0}, 
      points = {{-10.0, 0.0}, {9.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(position2.flange, jetNozzle.flange_z)
    annotation (Line(origin = {-10.0, -19.0}, 
      points = {{-26.0, -15.0}, {0.0, -15.0}, {0.0, 15.0}, {26.0, 15.0}}, 
      color = {0, 127, 0}));
end Test_JetNozzle;