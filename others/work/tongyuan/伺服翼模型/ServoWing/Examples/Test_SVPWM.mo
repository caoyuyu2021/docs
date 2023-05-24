within ServoWing.Examples;
model Test_SVPWM
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 1, Interval = 1e-006, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Blocks.Sources.Cosine cosine
    annotation (Placement(transformation(origin = {-32.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Cosine cosine1(phase = 1.5707963267949)
    annotation (Placement(transformation(origin = {-32.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.SVPWM sVPWM(T_PWM = 0.001, U_dc = 30)
    annotation (Placement(transformation(origin = {16.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(cosine.y, sVPWM.U_alpha)
    annotation (Line(origin = {-8.0, 11.0}, 
      points = {{-13.0, 11.0}, {4.0, 11.0}, {4.0, -9.0}, {13.0, -9.0}}, 
      color = {0, 0, 127}));
  connect(cosine1.y, sVPWM.U_beta)
    annotation (Line(origin = {-8.0, -7.0}, 
      points = {{-13.0, -5.0}, {4.0, -5.0}, {4.0, 5.0}, {13.0, 5.0}}, 
      color = {0, 0, 127}));


end Test_SVPWM;