within ServoWing.Sensors.Examples;
model Model1
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Modelica.Mechanics.Translational.Components.Mass mass(v(start = 1))
    annotation (Placement(transformation(origin = {-26.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  PolePositionSensor polePositionSensor
    annotation (Placement(transformation(origin = {4.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(mass.flange_b, polePositionSensor.flange_a)
    annotation (Line(origin = {-11.0, 8.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 127, 0}));
end Model1;