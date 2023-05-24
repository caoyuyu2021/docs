within ServoWing.System.Others;
model System2 "伺服翼系统——带电机驱动"
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
  annotation (Diagram(coordinateSystem(extent = {{-200.0, -100.0}, {180.0, 140.0}}, 
    grid = {2.0, 2.0})), 
    experiment(Algorithm = Rkfix4, Interval = 1e-05, StartTime = 0, StopTime = 12, Tolerance = 0.0001, IntegratorStep = 1e-05));
  Mechanics.TelescopicGear telescopicRope annotation (Placement(transformation(origin = {-61.0, 33.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Mechanics.FoldingGear foldingRope annotation (Placement(transformation(origin = {38.0, 94.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Subsystems.ServoSysGearS servoSysGear
    annotation (Placement(transformation(origin = {-118.0, 34.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 0.4, duration = 5)
    annotation (Placement(transformation(origin = {-172.0, 34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.ServoSysGearZ servoSysGear1 annotation (Placement(transformation(origin = {-26.0, 94.0}, 
    extent = {{-20.0, -20.0}, {20.0, 20.0}})));

  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {5, 0}, {10, 1.57}, {20, 1.57}})
    annotation (Placement(transformation(origin = {-90.0, 94.0}, 
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
end System2;