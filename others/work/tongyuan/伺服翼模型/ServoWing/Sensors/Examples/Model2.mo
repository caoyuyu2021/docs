within ServoWing.Sensors.Examples;
model Model2
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 5, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
  Components.DigitalDerivative digitalDerivative(T = 0.01)
    annotation (Placement(transformation(origin = {20.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(origin = {-30.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, digitalDerivative.u)
    annotation (Line(origin = {-5.0, 0.0}, 
      points = {{-14.0, 0.0}, {14.0, 0.0}}, 
      color = {0, 0, 127}));

end Model2;