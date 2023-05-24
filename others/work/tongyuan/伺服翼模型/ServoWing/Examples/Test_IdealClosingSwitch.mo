within ServoWing.Examples;
model Test_IdealClosingSwitch
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Electrical.SignalVoltage signalVoltage
    annotation (Placement(transformation(origin = {2.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor
    annotation (Placement(transformation(origin = {34.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(origin = {-46.0, -18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(origin = {-32.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 0.5, startValue = true)
    annotation (Placement(transformation(origin = {-38.0, -50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(signalVoltage.n, resistor.n)
    annotation (Line(origin = {35.0, 21.0}, 
      points = {{-23.0, 21.0}, {23.0, 21.0}, {23.0, -21.0}, {9.0, -21.0}}, 
      color = {0, 0, 255}));
  connect(const.y, signalVoltage.v)
    annotation (Line(origin = {-9.0, 58.0}, 
      points = {{-12.0, 8.0}, {11.0, 8.0}, {11.0, -9.0}}, 
      color = {0, 0, 127}));
  connect(signalVoltage.p, ground.p)
    annotation (Line(origin = {-27.0, 17.0}, 
      points = {{19.0, 25.0}, {-19.0, 25.0}, {-19.0, -25.0}}, 
      color = {0, 0, 255}));
  connect(idealClosingSwitch.p, ground.p)
    annotation (Line(origin = {-28.0, -4.0}, 
      points = {{18.0, 4.0}, {-18.0, 4.0}, {-18.0, -4.0}}, 
      color = {0, 0, 255}));
  connect(idealClosingSwitch.n, resistor.p)
    annotation (Line(origin = {17.0, 0.0}, 
      points = {{-7.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(booleanStep.y, idealClosingSwitch.control)
    annotation (Line(origin = {-13.0, -28.0}, 
      points = {{-14.0, -22.0}, {13.0, -22.0}, {13.0, 21.0}}, 
      color = {255, 0, 255}));


end Test_IdealClosingSwitch;