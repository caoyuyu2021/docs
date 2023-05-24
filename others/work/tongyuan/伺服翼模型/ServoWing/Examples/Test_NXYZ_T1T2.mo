within ServoWing.Examples;
model Test_NXYZ_T1T2
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Blocks.Sources.Sine sine(phase = 1.5707963267949)
    annotation (Placement(transformation(origin = {-52.0, 62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(phase = 0.523598775598299)
    annotation (Placement(transformation(origin = {-52.0, 32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(phase = 2.61799387799149)
    annotation (Placement(transformation(origin = {-52.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 0.01)
    annotation (Placement(transformation(origin = {-52.0, -28.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.NXYZ_T1T2 nXYZ_T1T2_1
    annotation (Placement(transformation(origin = {20.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.IntegerTable integerConstant(table = {{0, 6}, {1 / 6, 4}, {2 / 6, 5}, {3 / 6, 1}, {4 / 6, 3}, {5 / 6, 2}, {1, 6}, {7 / 6, 4}, {8 / 6, 5}, {1.5, 1}, {10 / 6, 3}, {11 / 6, 2}, {2, 6}}) annotation (Placement(transformation(origin = {-52.0, -58.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, nXYZ_T1T2_1.X)
    annotation (Line(origin = {-16.0, 40.0}, 
      points = {{-25.0, 22.0}, {-4.0, 22.0}, {-4.0, -22.0}, {25.0, -22.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, nXYZ_T1T2_1.Y)
    annotation (Line(origin = {-16.0, 23.0}, 
      points = {{-25.0, 9.0}, {-8.0, 9.0}, {-8.0, -9.0}, {25.0, -9.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, nXYZ_T1T2_1.Z)
    annotation (Line(origin = {-16.0, 6.0}, 
      points = {{-25.0, -4.0}, {-4.0, -4.0}, {-4.0, 4.0}, {25.0, 4.0}}, 
      color = {0, 0, 127}));
  connect(const.y, nXYZ_T1T2_1.T)
    annotation (Line(origin = {-16.0, -13.0}, 
      points = {{-25.0, -15.0}, {8.0, -15.0}, {8.0, 19.0}, {25.0, 19.0}}, 
      color = {0, 0, 127}));
  connect(integerConstant.y, nXYZ_T1T2_1.N)
    annotation (Line(origin = {-16.0, -26.0}, 
      points = {{-25.0, -32.0}, {12.0, -32.0}, {12.0, 28.0}, {25.0, 28.0}}, 
      color = {255, 127, 0}));
end Test_NXYZ_T1T2;