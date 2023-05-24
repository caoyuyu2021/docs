within ServoWing.Sensors.Examples;
model Test_HallSensor
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 5, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Mechanics.Rotational.Sources.Speed position annotation (Placement(transformation(origin = {-40.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Sources.Sine sine(offset = 5)
    annotation (Placement(transformation(origin = {-82.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  HallSensor hallSensor
    annotation (Placement(transformation(origin = {4.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, position.w_ref)
    annotation (Line(origin = {-72.0, -15.0}, 
      points = {{1.0, 15.0}, {20.0, 15.0}}, 
      color = {0, 0, 127}));
  connect(position.flange, hallSensor.flange)
    annotation (Line(origin = {-18.0, 0.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}));
end Test_HallSensor;