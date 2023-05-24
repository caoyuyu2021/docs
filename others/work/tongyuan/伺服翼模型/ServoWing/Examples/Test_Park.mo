within ServoWing.Examples;
model Test_Park
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.Components.Park park
    annotation (Placement(transformation(origin = {18.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1 / 10, 
    phase = 3.14159265358979) annotation (Placement(transformation(origin = {-38.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 1 / 10, 
    phase = 4.71238898038469) annotation (Placement(transformation(origin = {-38.0, -24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable sine2(table = {{0, 0}, {10, -2 * pi}}) annotation (Placement(transformation(origin = {-38.0, 48.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine2.y, park.theta)
    annotation (Line(origin = {-4.0, 26.0}, 
      points = {{-23.0, 22.0}, {0.0, 22.0}, {0.0, -22.0}, {11.0, -22.0}}, 
      color = {0, 0, 127}));
  connect(sine.y, park.i_alpha)
    annotation (Line(origin = {-4.0, 5.0}, 
      points = {{-23.0, 5.0}, {-10.0, 5.0}, {-10.0, -5.0}, {11.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, park.i_beta)
    annotation (Line(origin = {-4.0, -14.0}, 
      points = {{-23.0, -10.0}, {0.0, -10.0}, {0.0, 10.0}, {11.0, 10.0}}, 
      color = {0, 0, 127}));


end Test_Park;