within ServoWing.Motors.Examples;
model Test_TerminalBox
  extends ServoLib.Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-120.0, -120.0}, {100.0, 60.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.02, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));



  Modelica.Electrical.MultiPhase.Basic.Star star annotation (
    Placement(transformation(origin = {-70.0, -18.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(origin = {-106.0, -17.999999999999993}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
    rotation = 270.0)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y")
    annotation (Placement(transformation(origin = {0.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Sources.SineVoltage sineVoltage(V = fill(3, 3))
    annotation (Placement(transformation(origin = {-34.0, -18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Basic.Resistor resistor
    annotation (Placement(transformation(origin = {0.0, -54.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(star.plug_p, sineVoltage.plug_p)
    annotation (Line(origin = {-47.0, -18.0}, 
      points = {{-13.0, 0.0}, {3.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(star.pin_n, ground.p)
    annotation (Line(origin = {-97.0, -18.0}, 
      points = {{17.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(sineVoltage.plug_n, terminalBox.plugSupply)
    annotation (Line(origin = {-15.0, -41.0}, 
      points = {{-9.0, 23.0}, {15.0, 23.0}, {15.0, 13.0}}, 
      color = {0, 0, 255}));
  connect(resistor.plug_p, terminalBox.plug_sn)
    annotation (Line(origin = {-9.0, -41.0}, 
      points = {{-1.0, -13.0}, {-9.0, -13.0}, {-9.0, 11.0}, {3.0, 11.0}}, 
      color = {0, 0, 255}));
  connect(resistor.plug_n, terminalBox.plug_sp)
    annotation (Line(origin = {11.0, -41.0}, 
      points = {{-1.0, -13.0}, {5.0, -13.0}, {5.0, 11.0}, {-5.0, 11.0}}, 
      color = {0, 0, 255}));
end Test_TerminalBox;