within ServoWing.Examples;
model Test_BallScrews_E
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Mechanics.BallScrews_EJCDB ballScrews_E1 annotation (Placement(transformation(origin = {32.0, -16.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(origin = {4.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed1
    annotation (Placement(transformation(origin = {-26.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0.0, 0}, {5, 0}, {5, 10}, {7.5, 10}, {8, -10}, {10, -10}})
    annotation (Placement(transformation(origin = {-64.0, -16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Mass mass1
    annotation (Placement(transformation(origin = {70.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(inertia1.flange_b, ballScrews_E1.flange_r)
    annotation (Line(origin = {16.0, -16.0}, 
      points = {{-2.0, 0.0}, {6.0, 0.0}}));
  connect(speed1.flange, inertia1.flange_a)
    annotation (Line(origin = {-11.0, -16.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}));
  connect(timeTable1.y, speed1.w_ref)
    annotation (Line(origin = {-45.0, -16.0}, 
      points = {{-8.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(mass1.flange_a, ballScrews_E1.flange_t)
    annotation (Line(origin = {46.0, -1.0}, 
      points = {{14.0, 9.0}, {-14.0, 9.0}, {-14.0, -10.0}}, 
      color = {0, 127, 0}));
end Test_BallScrews_E;