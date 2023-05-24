within ServoWing.Examples;
model Test_PlanetaryReducer
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(origin = {-2.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed
    annotation (Placement(transformation(origin = {-32.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0.0, 0}, {5, 0}, {5, 10}, {7.5, 10}, {8, -10}, {10, -10}})
    annotation (Placement(transformation(origin = {-70.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(origin = {62.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.PlanetaryReducer planetaryReducer
    annotation (Placement(transformation(origin = {32.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(speed.flange, inertia.flange_a)
    annotation (Line(origin = {-17.0, 10.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}));
  connect(timeTable.y, speed.w_ref)
    annotation (Line(origin = {-51.0, 10.0}, 
      points = {{-8.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(inertia.flange_b, planetaryReducer.flange_a)
    annotation (Line(origin = {15.0, 10.0}, 
      points = {{-7.0, 0.0}, {7.0, 0.0}}));
  connect(planetaryReducer.flange_b, inertia1.flange_a)
    annotation (Line(origin = {47.0, 10.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}));



end Test_PlanetaryReducer;