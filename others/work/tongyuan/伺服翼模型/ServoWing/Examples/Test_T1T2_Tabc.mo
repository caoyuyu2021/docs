within ServoWing.Examples;
model Test_T1T2_Tabc
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.Components.T1T2_Tabc t1T2_Tabc
    annotation (Placement(transformation(origin = {16.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)
    annotation (Placement(transformation(origin = {-44.0, 36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant sine1(k = 0.001) annotation (Placement(transformation(origin = {-44.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));


  Modelica.Blocks.Sources.Sine sine2(freqHz = 1, 
    phase = 3.14159265358979)
    annotation (Placement(transformation(origin = {-44.0, -36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, t1T2_Tabc.T1)
    annotation (Line(origin = {-14.0, 20.0}, 
      points = {{-19.0, 16.0}, {-2.0, 16.0}, {-2.0, -16.0}, {19.0, -16.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, t1T2_Tabc.T)
    annotation (Line(origin = {-14.0, 0.0}, 
      points = {{-19.0, 0.0}, {19.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, t1T2_Tabc.T2)
    annotation (Line(origin = {-14.0, -20.0}, 
      points = {{-19.0, -16.0}, {-2.0, -16.0}, {-2.0, 16.0}, {19.0, 16.0}}, 
      color = {0, 0, 127}));


end Test_T1T2_Tabc;