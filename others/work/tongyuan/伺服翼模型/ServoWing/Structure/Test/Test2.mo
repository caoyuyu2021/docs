within ServoWing.Structure.Test;
model Test2
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-20.0, -24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  TelescopicWingFlex telescopicWingFlex
    annotation (Placement(transformation(origin = {126.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (experiment(Algorithm = Dassl, Interval = 0.01, StartTime = 0, StopTime = 10, Tolerance = 0.0001), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {220.0, 100.0}}, 
      grid = {2.0, 2.0})));
  FoldingWingsFlex foldingWingsFlex
    annotation (Placement(transformation(origin = {192.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, 
    n = {0, -1, 0}) annotation (Placement(transformation(origin = {160.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {90.0, 46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0, 0}, {5, 0}, {10, 6.28}, {20, 6.28}})
    annotation (Placement(transformation(origin = {40.0, 46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  MainBodyFlex mainBodyFlex
    annotation (Placement(transformation(origin = {54.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
    annotation (Placement(transformation(origin = {86.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {5, 2.3}, {5, 2.3}, {10, 2.3}})
    annotation (Placement(transformation(origin = {-46.0, 12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {2.0, 12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.TelescopicRope telescopicRope annotation (Placement(transformation(origin = {42.0, 12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.FoldingGear foldingRope annotation (Placement(transformation(origin = {136.0, 46.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(telescopicWingFlex.frame_b, revolute.frame_a)
    annotation (Line(origin = {143.0, -26.0}, 
      points = {{-7.0, 0.0}, {7.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(revolute.frame_b, foldingWingsFlex.frame_a)
    annotation (Line(origin = {175.0, -25.0}, 
      points = {{-5.0, -1.0}, {7.0, -1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(timeTable1.y, position.phi_ref)
    annotation (Line(origin = {56.0, 19.0}, 
      points = {{-5.0, 27.0}, {22.0, 27.0}}, 
      color = {0, 0, 127}));


  connect(timeTable.y, position1.phi_ref)
    annotation (Line(origin = {-22.0, 12.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, telescopicRope.drive)
    annotation (Line(origin = {22.0, 12.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(world.frame_b, mainBodyFlex.frame_a)
    annotation (Line(origin = {17.0, -25.0}, 
      points = {{-27.0, 1.0}, {27.0, 1.0}, {27.0, -1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(mainBodyFlex.frame_b, prismatic.frame_a)
    annotation (Line(origin = {70.0, -26.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic.frame_b, telescopicWingFlex.frame_a)
    annotation (Line(origin = {106.0, -26.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(telescopicRope.pull1, prismatic.axis)
    annotation (Line(origin = {69.0, 2.0}, 
      points = {{-25.0, 14.0}, {-25.0, 22.0}, {25.0, 22.0}, {25.0, -22.0}}, 
      color = {0, 127, 0}));
  connect(position.flange, foldingRope.drive)
    annotation (Line(origin = {113.0, 33.0}, 
      points = {{-13.0, 13.0}, {13.0, 13.0}}, 
      color = {0, 0, 0}));
  connect(foldingRope.drive1, revolute.axis)
    annotation (Line(origin = {152.0, 10.0}, 
      points = {{-6.0, 42.0}, {8.0, 42.0}, {8.0, -26.0}}, 
      color = {0, 0, 0}));
end Test2;