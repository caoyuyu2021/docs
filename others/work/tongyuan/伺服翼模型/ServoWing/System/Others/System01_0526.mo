within ServoWing.System.Others;
model System01_0526 "伺服翼系统——不带电机驱动"
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-96.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Structure.MainBodyFlex mainBody annotation (Placement(transformation(origin = {-50.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  ServoWing.Structure.TelescopicWingFlex telescopicWing annotation (Placement(transformation(origin = {40.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  ServoWing.Structure.FoldingWingsFlex foldingWings annotation (Placement(transformation(origin = {114.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
    annotation (Placement(transformation(origin = {-18.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, 
    n = {0, 1, 0}) annotation (Placement(transformation(origin = {86.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-180.0, -100.0}, {180.0, 120.0}}, 
    grid = {2.0, 2.0})), 
    experiment(Algorithm = Dassl, Interval = 0.02, StartTime = 0, StopTime = 20, Tolerance = 0.0001));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {-4.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {5, 2.3}, {5, 2.3}, {10, 2.3}})
    annotation (Placement(transformation(origin = {-130.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0, 0}, {5, 0}, {10, 90}, {20, 90}})
    annotation (Placement(transformation(origin = {-130.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {-88.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.TelescopicGear telescopicRope(ballScrews(ratio = 2)) annotation (Placement(transformation(origin = {-30.0, 24.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.FoldingGear foldingRope(ballScrews(ratio = 4), externalSpurgear(zA = 1, zB = 1)) annotation (Placement(transformation(origin = {44.0, 40.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.Translational.Components.Rod rod
    annotation (Placement(transformation(origin = {43.0, 15.0}, 
      extent = {{-9.0, -9.0}, {9.0, 9.0}})));
  Modelica.Blocks.Math.Gain gain(k = -Modelica.Constants.pi / 180 * 4)
    annotation (Placement(transformation(origin = {-67.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression[3]
    annotation (Placement(transformation(origin = {-180.0, -54.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(world.frame_b, mainBody.frame_a)
    annotation (Line(origin = {-73.0, -12.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(mainBody.frame_b, prismatic.frame_a)
    annotation (Line(origin = {-34.0, -12.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic.frame_b, telescopicWing.frame_a)
    annotation (Line(origin = {39.0, -9.0}, 
      points = {{-47.0, -3.0}, {-9.0, -3.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(telescopicWing.frame_b, revolute.frame_a)
    annotation (Line(origin = {72.0, -9.0}, 
      points = {{-22.0, -3.0}, {4.0, -3.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(revolute.frame_b, foldingWings.frame_a)
    annotation (Line(origin = {99.0, -9.0}, 
      points = {{-3.0, -3.0}, {5.0, -3.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(timeTable.y, position1.phi_ref)
    annotation (Line(origin = {-220.0, 38.0}, 
      points = {{101.0, -14.0}, {120.0, -14.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, telescopicRope.drive)
    annotation (Line(origin = {-179.0, 38.0}, 
      points = {{101.0, -14.0}, {139.0, -14.0}}, 
      color = {0, 0, 0}));
  connect(telescopicRope.pull1, prismatic.axis)
    annotation (Line(origin = {-33.0, 24.0}, 
      points = {{5.0, 4.0}, {5.0, 16.0}, {23.0, 16.0}, {23.0, -30.0}}, 
      color = {0, 127, 0}));
  connect(telescopicRope.pull1, rod.flange_a)
    annotation (Line(origin = {-7.0, 29.0}, 
      points = {{-21.0, -1.0}, {-21.0, 11.0}, {-3.0, 11.0}, {-3.0, -14.0}, {41.0, -14.0}}, 
      color = {0, 127, 0}));
  connect(position.flange, foldingRope.drive)
    annotation (Line(origin = {20.0, 53.0}, 
      points = {{-14.0, 13.0}, {2.0, 13.0}, {2.0, -13.0}, {14.0, -13.0}}, 
      color = {0, 0, 0}));
  connect(foldingRope.drive1, revolute.axis)
    annotation (Line(origin = {70.0, 22.0}, 
      points = {{-16.0, 24.0}, {16.0, 24.0}, {16.0, -24.0}}, 
      color = {0, 0, 0}));
  connect(timeTable1.y, gain.u)
    annotation (Line(origin = {-99.0, 66.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, position.phi_ref)
    annotation (Line(origin = {-36.0, 66.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, mainBody.aerodynamicforce)
    annotation (Line(origin = {-109.0, -27.0}, 
      points = {{-60.0, -27.0}, {51.0, -27.0}, {51.0, 26.0}, {59.0, 26.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, telescopicWing.aerodynamicforce)
    annotation (Line(origin = {-64.0, -27.0}, 
      points = {{-105.0, -27.0}, {104.0, -27.0}, {104.0, 26.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, foldingWings.aerodynamicforce)
    annotation (Line(origin = {-27.0, -27.0}, 
      points = {{-142.0, -27.0}, {111.0, -27.0}, {111.0, -1.0}, {141.0, -1.0}, {141.0, 26.0}}, 
      color = {0, 0, 127}));
end System01_0526;