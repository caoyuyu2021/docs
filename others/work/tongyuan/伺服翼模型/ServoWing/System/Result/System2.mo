within ServoWing.System.Result;
model System2 "伺服翼系统——降阶模型"
  extends Modelica.Icons.Example;
  annotation (Diagram(coordinateSystem(extent = {{-200.0, -100.0}, {180.0, 140.0}}, 
    grid = {2.0, 2.0})), 
    experiment(Algorithm = Dassl, Interval = 0.01, StartTime = 0, StopTime = 20, Tolerance = 0.0001));
  Mechanics.TelescopicGear telescopicRope annotation (Placement(transformation(origin = {-61.0, 33.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Mechanics.FoldingGear foldingRope annotation (Placement(transformation(origin = {38.0, 94.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Subsystems.ServoSysGearS2 servoSysGear annotation (Placement(transformation(origin = {-118.0, 34.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  Modelica.Blocks.Sources.Ramp ramp(height = 0.4, duration = 5)
    annotation (Placement(transformation(origin = {-172.0, 34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.ServoSysGearZ2 servoSysGear1 annotation (Placement(transformation(origin = {-26.0, 94.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {5, 0}, {10, 1.57}, {20, 1.57}})
    annotation (Placement(transformation(origin = {-90.0, 94.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor(use_w = false, use_a = false) annotation (Placement(transformation(origin = {95.0, 105.59999999999998}, 
    extent = {{-13.0, -10.0}, {13.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.GeneralForceToPositionAdaptor positionToForceAdaptor(use_pder = false, use_pder2 = false) annotation (Placement(transformation(origin = {18.0, 41.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  bp_1402.ROM.ROM_Basis rOM_Basis
    annotation (Placement(transformation(origin = {88.0, -19.999999999999996}, 
      extent = {{-20.0, -20.0}, {20.0, 19.999999999999996}})));
  MENSLib.DeviceLib.PneumaticForceTorque.PneumaticF_S pneumaticF_S
    annotation (Placement(transformation(origin = {-37.999999999999986, -24.000000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp1[7] annotation (Placement(transformation(origin = {-107.99999999999994, -16.000000000000014}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  MENSLib.DeviceLib.Atmosphere.DensityVeolcity densityVeolcity
    annotation (Placement(transformation(origin = {-100.0, -50.000000000000014}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp2(height = 1000) annotation (Placement(transformation(origin = {-136.0, -50.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(servoSysGear.flange_a, telescopicRope.drive)
    annotation (Line(origin = {-83.0, 37.0}, 
      points = {{-15.0, -3.0}, {4.0, -3.0}, {4.0, -4.0}, {2.0, -4.0}}, 
      color = {0, 0, 0}));
  connect(ramp.y, servoSysGear.u)
    annotation (Line(origin = {-148.0, 32.0}, 
      points = {{-13.0, 2.0}, {8.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(servoSysGear1.flange_a, foldingRope.drive)
    annotation (Line(origin = {-15.0, 82.0}, 
      points = {{9.0, 12.0}, {33.0, 12.0}}, 
      color = {0, 0, 0}));
  connect(timeTable.y, servoSysGear1.u)
    annotation (Line(origin = {-58.0, 94.0}, 
      points = {{-21.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(foldingRope.drive1, torqueToAngleAdaptor.flange)
    annotation (Line(origin = {75.0, 106.0}, 
      points = {{-17.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(telescopicRope.pull1, positionToForceAdaptor.flange)
    annotation (Line(origin = {-25.0, 39.0}, 
      points = {{-32.0, 2.0}, {41.0, 2.0}}, 
      color = {0, 127, 0}));
  connect(torqueToAngleAdaptor.phi, rOM_Basis.foldAngle)
    annotation (Line(origin = {83.0, 51.0}, 
      points = {{16.0, 63.0}, {33.0, 63.0}, {33.0, -7.0}, {-33.0, -7.0}, {-33.0, -63.0}, {-17.0, -63.0}}, 
      color = {0, 0, 127}));
  connect(positionToForceAdaptor.p, rOM_Basis.teleLength)
    annotation (Line(origin = {44.0, 17.0}, 
      points = {{-23.0, 32.0}, {-10.0, 32.0}, {-10.0, -37.0}, {22.0, -37.0}}, 
      color = {0, 0, 127}));
  connect(ramp1.y, pneumaticF_S.u)
    annotation (Line(origin = {-72.99999999999997, -19.0}, 
      points = {{-24.0, 3.0}, {14.0, 3.0}, {14.0, -3.0}, {24.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(densityVeolcity.AirDensity, pneumaticF_S.AirDensity)
    annotation (Line(origin = {-68.99999999999997, -37.0}, 
      points = {{-20.0, -11.0}, {7.0, -11.0}, {7.0, 11.0}, {20.0, 11.0}}, 
      color = {0, 0, 127}));
  connect(ramp2.y, densityVeolcity.Height)
    annotation (Line(origin = {-118.99999999999997, -52.00000000000001}, 
      points = {{-6.0, 2.0}, {8.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(pneumaticF_S.AeroForce, rOM_Basis.aerodynamicforce)
    annotation (Line(origin = {-6.0, -32.0}, 
      points = {{-21.0, 4.0}, {72.0, 4.0}}, 
      color = {0, 0, 127}));
  connect(positionToForceAdaptor.f, rOM_Basis.result_teleWing[2])
    annotation (Line(origin = {72.0, 7.0}, 
      points = {{-51.0, 26.0}, {-42.0, 26.0}, {-42.0, 22.0}, {50.0, 22.0}, {50.0, -27.0}, {38.0, -27.0}}, 
      color = {0, 0, 127}));
  connect(torqueToAngleAdaptor.tau, rOM_Basis.result_foldWing1[1])
    annotation (Line(origin = {113.0, 35.0}, 
      points = {{-14.0, 63.0}, {13.0, 63.0}, {13.0, -63.0}, {-3.0, -63.0}}, 
      color = {0, 0, 127}));
end System2;