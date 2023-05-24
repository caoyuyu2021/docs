within ServoWing.Examples;
model Test_Clark
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.Components.Clark clark
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)
    annotation (Placement(transformation(origin = {-58.0, 38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 1, 
    phase = 2.0943951023932)
    annotation (Placement(transformation(origin = {-58.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(freqHz = 1, 
    phase = 4.18879020478639)
    annotation (Placement(transformation(origin = {-58.0, -34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, clark.i_a)
    annotation (Line(origin = {-29.0, 21.0}, 
      points = {{-18.0, 17.0}, {7.0, 17.0}, {7.0, -17.0}, {18.0, -17.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, clark.i_b)
    annotation (Line(origin = {-29.0, 1.0}, 
      points = {{-18.0, -1.0}, {18.0, -1.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, clark.i_c)
    annotation (Line(origin = {-29.0, -19.0}, 
      points = {{-18.0, -15.0}, {7.0, -15.0}, {7.0, 15.0}, {18.0, 15.0}}, 
      color = {0, 0, 127}));
end Test_Clark;