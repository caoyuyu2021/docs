within ServoWing.Motors.Examples;
model Test_SpacePhasor
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  PMSM pMSM
    annotation (Placement(transformation(origin = {0.0, -52.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (
    Placement(transformation(origin = {-64.0, 18.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(origin = {-100.0, 18.000000000000007}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
    rotation = 270.0)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y")
    annotation (Placement(transformation(origin = {0.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Sources.SineVoltage sineVoltage(m = 3)
    annotation (Placement(transformation(origin = {-28.0, 18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 10)
    annotation (Placement(transformation(origin = {50.0, -52.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.SpacePhasor spacePhasor
    annotation (Placement(transformation(origin = {54.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(terminalBox.plug_sn, pMSM.plug_sn)
    annotation (Line(origin = {-5.0, -28.0}, 
      points = {{-1.0, 26.0}, {-1.0, -14.0}, {1.0, -14.0}}, 
      color = {0, 0, 255}));
  connect(terminalBox.plug_sp, pMSM.plug_sp)
    annotation (Line(origin = {5.0, -28.0}, 
      points = {{1.0, 26.0}, {1.0, -14.0}, {-1.0, -14.0}}, 
      color = {0, 0, 255}));
  connect(star.plug_p, sineVoltage.plug_p)
    annotation (Line(origin = {-41.0, 18.0}, 
      points = {{-13.0, 0.0}, {3.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(star.pin_n, ground.p)
    annotation (Line(origin = {-91.0, 18.0}, 
      points = {{17.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(sineVoltage.plug_n, terminalBox.plugSupply)
    annotation (Line(origin = {-9.0, -5.0}, 
      points = {{-9.0, 23.0}, {9.0, 23.0}, {9.0, 5.0}}, 
      color = {0, 0, 255}));
  connect(pMSM.flange_a, inertia.flange_a)
    annotation (Line(origin = {24.0, -52.0}, 
      points = {{-14.0, 0.0}, {16.0, 0.0}}));
  connect(spacePhasor.zero, spacePhasor.ground)
    annotation (Line(origin = {66.0, 4.0}, 
      points = {{-2.0, -16.0}, {4.0, -16.0}, {4.0, -24.0}, {-2.0, -24.0}}, 
      color = {0, 0, 255}));
  connect(spacePhasor.plug_p, pMSM.plug_sp)
    annotation (Line(origin = {24.0, -25.0}, 
      points = {{20.0, 17.0}, {-18.0, 17.0}, {-18.0, -17.0}, {-20.0, -17.0}}, 
      color = {0, 0, 255}));
  connect(spacePhasor.plug_n, pMSM.plug_sn)
    annotation (Line(origin = {19.0, -29.0}, 
      points = {{25.0, 13.0}, {-25.0, 13.0}, {-25.0, -13.0}, {-23.0, -13.0}}, 
      color = {0, 0, 255}));
end Test_SpacePhasor;