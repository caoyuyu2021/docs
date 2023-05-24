within ServoWing.Motors.Examples;
model Test_ElectricLossBrake
  extends ServoLib.Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-120.0, -80.0}, {320.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 20, Interval = 0.001, Algorithm = Dassl, Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Electrical.Ground ground1
    annotation (Placement(transformation(origin = {14.0, -28.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1, 
    w(start
       = 6.28318530717959, 
      displayUnit
       = "rpm"))
    annotation (Placement(transformation(origin = {16.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(origin = {-18.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(origin = {-22.0, 4.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -270.0)));
  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 30}, {5, 30}, {5, 0}, {10, 0}})
    annotation (Placement(transformation(origin = {-66.0, 4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ElectricLossBrake VCM(torque_max = 55)
    annotation (Placement(transformation(origin = {38.0, 4.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0.0, 0.0}, {5, 0}, {20, 200}})
    annotation (Placement(transformation(origin = {-84.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(torque.flange, inertia.flange_a)
    annotation (Line(origin = {19.0, 44.0}, 
      points = {{-27.0, 0.0}, {-13.0, 0.0}}));
  connect(signalVoltage.n, ground1.p)
    annotation (Line(origin = {-38.0, -18.0}, 
      points = {{16.0, 12.0}, {16.0, 6.0}, {52.0, 6.0}, {52.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(timeTable.y, signalVoltage.v)
    annotation (Line(origin = {-69.0, -4.0}, 
      points = {{14.0, 8.0}, {40.0, 8.0}}, 
      color = {0, 0, 127}));
  connect(signalVoltage.p, VCM.pin_ap)
    annotation (Line(origin = {6.0, 10.0}, 
      points = {{-28.0, 4.0}, {-28.0, 14.0}, {8.0, 14.0}, {8.0, -2.0}, {22.0, -2.0}}, 
      color = {0, 0, 255}));
  connect(VCM.pin_an, ground1.p)
    annotation (Line(origin = {15.0, -21.0}, 
      points = {{13.0, 21.0}, {-1.0, 21.0}, {-1.0, 3.0}}, 
      color = {0, 0, 255}));
  connect(VCM.flange_a, inertia.flange_b)
    annotation (Line(origin = {83.0, 11.0}, 
      points = {{-45.0, 3.0}, {-45.0, 33.0}, {-57.0, 33.0}}));
  connect(timeTable1.y, torque.tau)
    annotation (Line(origin = {-59.0, 47.0}, 
      points = {{-14.0, -5.0}, {29.0, -5.0}, {29.0, -3.0}}, 
      color = {0, 0, 127}));
end Test_ElectricLossBrake;