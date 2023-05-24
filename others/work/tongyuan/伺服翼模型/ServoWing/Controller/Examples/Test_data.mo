within ServoWing.Controller.Examples;
model Test_data
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 20, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Blocks.Sources.Clock clock
    annotation (Placement(transformation(origin = {-82.0, 14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table = fill(0.0, 0, 9), tableOnFile = true, tableName = "table", 
    fileName = loadResource("modelica://ServoLib/Resources/data.txt")) annotation (Placement(transformation(origin = {32.0, 14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = {{0, 0}, {20, 500}})
    annotation (Placement(transformation(origin = {-32.0, 14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(clock.y, combiTable1Ds1.u)
    annotation (Line(origin = {-57.0, 14.0}, 
      points = {{-14.0, 0.0}, {13.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(combiTable1Ds1.y[1], combiTable1Ds.u)
    annotation (Line(origin = {0.0, 14.0}, 
      points = {{-21.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 127}));
end Test_data;