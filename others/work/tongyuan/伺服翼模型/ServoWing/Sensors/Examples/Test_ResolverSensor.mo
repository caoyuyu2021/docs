within ServoWing.Sensors.Examples;
model Test_ResolverSensor
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 5, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  ResolverSensor resolverSensor(samplePeriod = 0.001)
    annotation (Placement(transformation(origin = {4.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(w(start = 3))
    annotation (Placement(transformation(origin = {-40.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(inertia.flange_b, resolverSensor.flange_a)
    annotation (Line(origin = {-18.0, 0.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}));
end Test_ResolverSensor;