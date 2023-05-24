within ServoWing.Examples;
model Test_Tabc_Tcm
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.Components.Tabc_Tcm tabc_Tcm
    annotation (Placement(transformation(origin = {22.0, 16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)
    annotation (Placement(transformation(origin = {-34.0, 52.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 1, 
    phase = 1.5707963267949)
    annotation (Placement(transformation(origin = {-34.0, 18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(freqHz = 1, 
    phase = 3.14159265358979)
    annotation (Placement(transformation(origin = {-34.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.IntegerTable integerConstant(table = {{0, 6}, {1 / 6, 4}, {2 / 6, 5}, {3 / 6, 1}, {4 / 6, 3}, {5 / 6, 2}, {1, 6}, {7 / 6, 4}, {8 / 6, 5}, {1.5, 1}, {10 / 6, 3}, {11 / 6, 2}, {2, 6}}) annotation (Placement(transformation(origin = {-36.0, -58.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, tabc_Tcm.Ta)
    annotation (Line(origin = {-6.0, 37.0}, 
      points = {{-17.0, 15.0}, {2.0, 15.0}, {2.0, -15.0}, {17.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, tabc_Tcm.Tb)
    annotation (Line(origin = {-6.0, 17.0}, 
      points = {{-17.0, 1.0}, {17.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, tabc_Tcm.Tc)
    annotation (Line(origin = {-6.0, -3.0}, 
      points = {{-17.0, -17.0}, {2.0, -17.0}, {2.0, 17.0}, {17.0, 17.0}}, 
      color = {0, 0, 127}));
  connect(integerConstant.y, tabc_Tcm.N)
    annotation (Line(origin = {-7.0, -24.0}, 
      points = {{-18.0, -34.0}, {11.0, -34.0}, {11.0, 34.0}, {18.0, 34.0}}, 
      color = {255, 127, 0}));
end Test_Tabc_Tcm;