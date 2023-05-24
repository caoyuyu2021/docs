within ServoWing.Sensors.Examples;
model Test_CurrentMeasure
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  CurrentMeasure currentMeasure
    annotation (Placement(transformation(origin = {2.0, 56.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10)
    annotation (Placement(transformation(origin = {30.0, 56.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 360.0)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(origin = {-66.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.SignalVoltage signalVoltage
    annotation (Placement(transformation(origin = {-32.0, 56.0}, 
      extent = {{10.0, 10.0}, {-10.0, -10.0}})));
  Modelica.Blocks.Sources.Sine sine(offset = 5)
    annotation (Placement(transformation(origin = {-58.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(currentMeasure.n, resistor.p)
    annotation (Line(origin = {16.0, 56.0}, 
      points = {{-4.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(sine.y, signalVoltage.v)
    annotation (Line(origin = {-37.0, 43.0}, 
      points = {{-10.0, -69.0}, {5.0, -69.0}, {5.0, 6.0}}, 
      color = {0, 0, 127}));
  connect(signalVoltage.p, currentMeasure.p)
    annotation (Line(origin = {-15.0, 56.0}, 
      points = {{-7.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(signalVoltage.n, ground.p)
    annotation (Line(origin = {-54.0, 34.0}, 
      points = {{12.0, 22.0}, {-12.0, 22.0}, {-12.0, -22.0}}, 
      color = {0, 0, 255}));
  connect(resistor.n, ground.p)
    annotation (Line(origin = {-9.0, 34.0}, 
      points = {{49.0, 22.0}, {57.0, 22.0}, {57.0, -10.0}, {-57.0, -10.0}, {-57.0, -22.0}}, 
      color = {0, 0, 255}));
end Test_CurrentMeasure;