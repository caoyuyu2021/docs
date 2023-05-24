within ServoWing.Examples;
model Test_IdealDiode
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Electrical.Components.IdealDiode idealDiode
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.SignalVoltage signalVoltage
    annotation (Placement(transformation(origin = {2.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor
    annotation (Placement(transformation(origin = {34.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(origin = {-32.0, 70.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(origin = {-46.0, -18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(signalVoltage.p, idealDiode.p)
    annotation (Line(origin = {-15.0, 16.0}, 
      points = {{7.0, 26.0}, {-7.0, 26.0}, {-7.0, -16.0}, {5.0, -16.0}}, 
      color = {0, 0, 255}));
  connect(signalVoltage.n, resistor.n)
    annotation (Line(origin = {35.0, 21.0}, 
      points = {{-23.0, 21.0}, {23.0, 21.0}, {23.0, -21.0}, {9.0, -21.0}}, 
      color = {0, 0, 255}));
  connect(resistor.p, idealDiode.n)
    annotation (Line(origin = {17.0, 0.0}, 
      points = {{7.0, 0.0}, {-7.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(sine.y, signalVoltage.v)
    annotation (Line(origin = {-13.0, 60.0}, 
      points = {{-8.0, 10.0}, {15.0, 10.0}, {15.0, -11.0}}, 
      color = {0, 0, 127}));
  connect(ground.p, idealDiode.p)
    annotation (Line(origin = {-28.0, -1.0}, 
      points = {{-18.0, -7.0}, {-18.0, 1.0}, {18.0, 1.0}}, 
      color = {0, 0, 255}));
end Test_IdealDiode;