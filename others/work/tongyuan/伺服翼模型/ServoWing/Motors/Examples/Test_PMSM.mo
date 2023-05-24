within ServoWing.Motors.Examples;
model Test_PMSM
  extends ServoLib.Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-120.0, -120.0}, {100.0, 60.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 3, Interval = 0.0001, Algorithm = "Rkfix4", Tolerance = 0.0001, IntegratorStep = 0.0001, DoublePrecision = true, StoreEventValue = false));
  PMSM pMSM(J_Rotor = 0.15, p = 6, Rs = 1.275, Lmd = 0.00975, Lmq = 0.00975, FluxLinkage = 0.505528)
    annotation (Placement(transformation(origin = {2.0, -34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (
    Placement(transformation(origin = {-68.0, 10.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(origin = {-104.0, 10.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
    rotation = 270.0)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y")
    annotation (Placement(transformation(origin = {2.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Sources.SineVoltage sineVoltage(V = fill(100, 3))
    annotation (Placement(transformation(origin = {-32.0, 10.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  System.Subsystems.ThermalSystem thermalSystem
    annotation (Placement(transformation(origin = {48.0, 10.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep1(stepTorque = -100, startTime = 1.2)
    annotation (Placement(transformation(origin = {48.0, -36.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
equation 
  connect(terminalBox.plug_sn, pMSM.plug_sn)
    annotation (Line(origin = {-3.0, 0.0}, 
      points = {{-1.0, -2.0}, {-1.0, -24.0}, {1.0, -24.0}}, 
      color = {0, 0, 255}));
  connect(terminalBox.plug_sp, pMSM.plug_sp)
    annotation (Line(origin = {7.0, 0.0}, 
      points = {{1.0, -2.0}, {1.0, -24.0}, {-3.0, -24.0}}, 
      color = {0, 0, 255}));
  connect(star.pin_n, ground.p)
    annotation (Line(origin = {-95.0, 10.0}, 
      points = {{17.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(pMSM.flange_a, torqueStep1.flange)
    annotation (Line(origin = {24.0, -27.0}, 
      points = {{-12.0, -7.0}, {14.0, -7.0}, {14.0, -9.0}}));
  connect(star.plug_p, sineVoltage.plug_n)
    annotation (Line(origin = {-50.0, 10.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(sineVoltage.plug_p, terminalBox.plugSupply)
    annotation (Line(origin = {-10.0, 5.0}, 
      points = {{-12.0, 5.0}, {12.0, 5.0}, {12.0, -5.0}}, 
      color = {0, 0, 255}));
  connect(pMSM.heatPort, thermalSystem.port)
    annotation (Line(origin = {25.0, -8.0}, 
      points = {{-13.0, -18.0}, {-1.0, -18.0}, {-1.0, 18.0}, {13.0, 18.0}}, 
      color = {191, 0, 0}));
end Test_PMSM;