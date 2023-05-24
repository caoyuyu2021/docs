within ServoWing.System.Result;
model System1 "伺服翼系统——机理模型"
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-108.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Structure.MainBodyFlex mainBody annotation (Placement(transformation(origin = {-58.0, -32.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  ServoWing.Structure.TelescopicWingFlex telescopicWing annotation (Placement(transformation(origin = {40.0, -32.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  ServoWing.Structure.FoldingWingsFlex foldingWings annotation (Placement(transformation(origin = {142.0, -32.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
    annotation (Placement(transformation(origin = {-6.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, 
    n = {0, -1, 0}) annotation (Placement(transformation(origin = {90.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-280.0, -100.0}, {180.0, 140.0}}, 
    grid = {2.0, 2.0})), 
    experiment(Algorithm = Dassl, Interval = 0.01, StartTime = 0, StopTime = 20, Tolerance = 0.0001), 
    __MWorks(ResultViewerManager(resultViewers = {
      ResultViewer(name = "1", executeTrigger = executeTrigger.SimulationStarted, commands = {
      CreatePlot(id = 1, position = [0, 0, 785, 543], y = ["telescopicRope.pull1.s"], x_display_unit = "s", y_display_units = ["m"], y_axis = [1], legend_layout = 7, left_title = "[m]", fix_time_range = True, fix_time_range_value = 9.38725e-323)})})));

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
  MENSLib.DeviceLib.PneumaticForceTorque.PneumaticF_S pneumaticF_S
    annotation (Placement(transformation(origin = {-160.00000000000003, -39.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp1[7] annotation (Placement(transformation(origin = {-230.0, -32.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  MENSLib.DeviceLib.Atmosphere.DensityVeolcity densityVeolcity
    annotation (Placement(transformation(origin = {-222.0, -66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp2(height = 1000) annotation (Placement(transformation(origin = {-260.0, -66.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(world.frame_b, mainBody.frame_a)
    annotation (Line(origin = {-73.0, -12.0}, 
      points = {{-25.0, -20.0}, {-5.0, -20.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(mainBody.frame_b, prismatic.frame_a)
    annotation (Line(origin = {-34.0, -12.0}, 
      points = {{-4.0, -20.0}, {18.0, -20.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic.frame_b, telescopicWing.frame_a)
    annotation (Line(origin = {39.0, -9.0}, 
      points = {{-35.0, -23.0}, {-19.0, -23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(telescopicWing.frame_b, revolute.frame_a)
    annotation (Line(origin = {72.0, -9.0}, 
      points = {{-12.0, -23.0}, {8.0, -23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(revolute.frame_b, foldingWings.frame_a)
    annotation (Line(origin = {99.0, -9.0}, 
      points = {{1.0, -23.0}, {23.0, -23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(foldingRope.drive1, revolute.axis)
    annotation (Line(origin = {70.0, 22.0}, 
      points = {{-12.0, 84.0}, {20.0, 84.0}, {20.0, -44.0}}, 
      color = {0, 0, 0}));
  connect(servoSysGear.flange_a, telescopicRope.drive)
    annotation (Line(origin = {-83.0, 37.0}, 
      points = {{-15.0, -3.0}, {4.0, -3.0}, {4.0, -4.0}, {2.0, -4.0}}, 
      color = {0, 0, 0}));
  connect(ramp.y, servoSysGear.u)
    annotation (Line(origin = {-148.0, 32.0}, 
      points = {{-13.0, 2.0}, {8.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(telescopicRope.pull1, prismatic.axis)
    annotation (Line(origin = {-39.0, 43.0}, 
      points = {{-18.0, -2.0}, {41.0, -2.0}, {41.0, -69.0}}, 
      color = {0, 127, 0}));
  connect(servoSysGear1.flange_a, foldingRope.drive)
    annotation (Line(origin = {-15.0, 82.0}, 
      points = {{9.0, 12.0}, {33.0, 12.0}}, 
      color = {0, 0, 0}));
  connect(timeTable.y, servoSysGear1.u)
    annotation (Line(origin = {-58.0, 94.0}, 
      points = {{-21.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(mainBody.aerodynamicforce, telescopicWing.aerodynamicforce)
    annotation (Line(origin = {-9.0, -8.0}, 
      points = {{-49.0, -2.0}, {-49.0, 2.0}, {49.0, 2.0}, {49.0, -2.0}}, 
      color = {0, 0, 127}));
  connect(telescopicWing.aerodynamicforce, foldingWings.aerodynamicforce)
    annotation (Line(origin = {91.0, -8.0}, 
      points = {{-51.0, -2.0}, {-51.0, 2.0}, {51.0, 2.0}, {51.0, -2.0}}, 
      color = {0, 0, 127}));
  connect(ramp1.y, pneumaticF_S.u)
    annotation (Line(origin = {-195.0, -34.99999999999999}, 
      points = {{-24.0, 3.0}, {14.0, 3.0}, {14.0, -3.0}, {24.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(densityVeolcity.AirDensity, pneumaticF_S.AirDensity)
    annotation (Line(origin = {-191.0, -52.99999999999999}, 
      points = {{-20.0, -11.0}, {7.0, -11.0}, {7.0, 11.0}, {20.0, 11.0}}, 
      color = {0, 0, 127}));
  connect(ramp2.y, densityVeolcity.Height)
    annotation (Line(origin = {-241.0, -68.0}, 
      points = {{-8.0, 2.0}, {8.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(pneumaticF_S.AeroForce, mainBody.aerodynamicforce)
    annotation (Line(origin = {-103.0, -25.0}, 
      points = {{-46.0, -19.0}, {-31.0, -19.0}, {-31.0, 19.0}, {45.0, 19.0}, {45.0, 15.0}}, 
      color = {0, 0, 127}));
end System1;