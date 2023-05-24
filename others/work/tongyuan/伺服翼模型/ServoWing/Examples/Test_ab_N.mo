within ServoWing.Examples;
model Test_ab_N
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)
    annotation (Placement(transformation(origin = {-52.0, 12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 1, phase = 1.5707963267949)
    annotation (Placement(transformation(origin = {-52.0, -22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.ab_N ab_N1
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, ab_N1.U_alpha)
    annotation (Line(origin = {-26.0, 7.0}, 
      points = {{-15.0, 5.0}, {-2.0, 5.0}, {-2.0, -5.0}, {15.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, ab_N1.U_beta)
    annotation (Line(origin = {-26.0, -12.0}, 
      points = {{-15.0, -10.0}, {-2.0, -10.0}, {-2.0, 10.0}, {15.0, 10.0}}, 
      color = {0, 0, 127}));


end Test_ab_N;