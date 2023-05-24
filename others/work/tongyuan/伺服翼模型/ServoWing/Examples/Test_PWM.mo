within ServoWing.Examples;
model Test_PWM
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 1e-005, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.Components.PWM pWM(T_PWM = 0.001)
    annotation (Placement(transformation(origin = {16.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)
    annotation (Placement(transformation(origin = {-38.0, 34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 1, 
    phase = 1.5707963267949) annotation (Placement(transformation(origin = {-38.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(freqHz = 1, 
    phase = 3.14159265358979) annotation (Placement(transformation(origin = {-38.0, -38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, pWM.Tcm1)
    annotation (Line(origin = {-11.0, 19.0}, 
      points = {{-16.0, 15.0}, {3.0, 15.0}, {3.0, -15.0}, {16.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, pWM.Tcm2)
    annotation (Line(origin = {-11.0, 0.0}, 
      points = {{-16.0, 0.0}, {16.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, pWM.Tcm3)
    annotation (Line(origin = {-11.0, -21.0}, 
      points = {{-16.0, -17.0}, {3.0, -17.0}, {3.0, 17.0}, {16.0, 17.0}}, 
      color = {0, 0, 127}));


end Test_PWM;