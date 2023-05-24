within ServoWing.Sensors.Examples;
model Test_PositionSensor
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Modelica.Mechanics.Translational.Components.Mass mass(v(start = 1))
    annotation (Placement(transformation(origin = {10.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  PositionSensor polePositionSensor
    annotation (Placement(transformation(origin = {40.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(offset = 5)
    annotation (Placement(transformation(origin = {-82.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position1
    annotation (Placement(transformation(origin = {-36.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(mass.flange_b, polePositionSensor.flange_a)
    annotation (Line(origin = {25.0, -30.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(position1.s_ref, sine.y)
    annotation (Line(origin = {-59.0, -30.0}, 
      points = {{11.0, 0.0}, {-12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, mass.flange_a)
    annotation (Line(origin = {-13.0, -30.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}}, 
      color = {0, 127, 0}));
end Test_PositionSensor;