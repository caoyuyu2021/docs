within ServoWing.Examples;
model Test_rPark
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Blocks.Sources.Constant cosine(k = -0.01) annotation (Placement(transformation(origin = {-48.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Blocks.Sources.Constant cosine1(k = -0.05) annotation (Placement(transformation(origin = {-48.0, -32.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0.0}, {10, -2 * pi}})
    annotation (Placement(transformation(origin = {-48.0, 36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.rPark rPark1
    annotation (Placement(transformation(origin = {10.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(timeTable.y, rPark1.theta)
    annotation (Line(origin = {-19.0, 20.0}, 
      points = {{-18.0, 16.0}, {3.0, 16.0}, {3.0, -16.0}, {18.0, -16.0}}, 
      color = {0, 0, 127}));
  connect(cosine.y, rPark1.U_d)
    annotation (Line(origin = {-19.0, 0.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(cosine1.y, rPark1.U_q)
    annotation (Line(origin = {-19.0, -18.0}, 
      points = {{-18.0, -14.0}, {3.0, -14.0}, {3.0, 14.0}, {18.0, 14.0}}, 
      color = {0, 0, 127}));


end Test_rPark;