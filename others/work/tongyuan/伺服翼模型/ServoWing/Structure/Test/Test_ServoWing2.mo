within ServoWing.Structure.Test;
model Test_ServoWing2
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-96.0, -14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  MainBodyFlex mainBody annotation (Placement(transformation(origin = {-50.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  TelescopicWingFlex telescopicWing annotation (Placement(transformation(origin = {40.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  FoldingWingsFlex foldingWings annotation (Placement(transformation(origin = {114.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
    annotation (Placement(transformation(origin = {-18.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, 
    n = {0, 0, 1}) annotation (Placement(transformation(origin = {86.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-180.0, -100.0}, {180.0, 120.0}}, 
    grid = {2.0, 2.0})), 
    experiment(Algorithm = Dassl, Interval = 0.02, StartTime = 0, StopTime = 20, Tolerance = 0.0001));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {-4.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {5, 2.3}, {5, 2.3}, {10, 2.3}})
    annotation (Placement(transformation(origin = {-118.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0, 0}, {5, 0}, {10, 6.28}, {20, 6.28}})
    annotation (Placement(transformation(origin = {-54.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {-70.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.TelescopicGear telescopicRope annotation (Placement(transformation(origin = {-30.0, 24.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.FoldingGear foldingRope annotation (Placement(transformation(origin = {44.0, 40.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.Translational.Components.Rod rod
    annotation (Placement(transformation(origin = {43.0, 15.0}, 
      extent = {{-9.0, -9.0}, {9.0, 9.0}})));
equation 
  connect(world.frame_b, mainBody.frame_a)
    annotation (Line(origin = {-73.0, -12.0}, 
      points = {{-13.0, -2.0}, {13.0, -2.0}, {13.0, 0.0}}, 
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
  connect(timeTable1.y, position.phi_ref)
    annotation (Line(origin = {-38.0, 39.0}, 
      points = {{-5.0, 27.0}, {22.0, 27.0}}, 
      color = {0, 0, 127}));
  connect(timeTable.y, position1.phi_ref)
    annotation (Line(origin = {-122.0, 38.0}, 
      points = {{15.0, -14.0}, {40.0, -14.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, telescopicRope.drive)
    annotation (Line(origin = {-81.0, 38.0}, 
      points = {{21.0, -14.0}, {41.0, -14.0}}, 
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
end Test_ServoWing2;