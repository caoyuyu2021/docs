within ServoWing.Examples;
model Test_DigitalPID_Sat
  //ServoLib.Controller.Components.DigitalPID_Sat
  extends Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -140.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Controller.Components.DigitalPI_Sat digitalPI_Sat
    annotation (Placement(transformation(origin = {12.0, 64.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(origin = {-36.0, 64.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.DigitalPI digitalPI
    annotation (Placement(transformation(origin = {12.0, 92.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.DigitalIntegrator digitalIntegrator
    annotation (Placement(transformation(origin = {12.0, 34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.DigitalIntegrator_Sat digitalIntegrator_Sat
    annotation (Placement(transformation(origin = {12.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 0.25)
    annotation (Placement(transformation(origin = {-34.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.DigitalPID_Sat digitalPI_Sat1(Kp = 2, T = 0.001, I_max = 0.2, Ki = 1) annotation (Placement(transformation(origin = {16.0, -76.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Blocks.Sources.Sine sine1
    annotation (Placement(transformation(origin = {-26.0, -76.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sine.y, digitalPI_Sat.u)
    annotation (Line(origin = {-12.0, 64.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(digitalPI.u, sine.y)
    annotation (Line(origin = {-12.0, 78.0}, 
      points = {{13.0, 14.0}, {0.0, 14.0}, {0.0, -14.0}, {-13.0, -14.0}}, 
      color = {0, 0, 127}));
  connect(digitalIntegrator.u, sine.y)
    annotation (Line(origin = {-12.0, 48.0}, 
      points = {{13.0, -14.0}, {0.0, -14.0}, {0.0, 16.0}, {-13.0, 16.0}}, 
      color = {0, 0, 127}));
  connect(digitalIntegrator_Sat.u, sine.y)
    annotation (Line(origin = {-12.0, 32.0}, 
      points = {{13.0, -34.0}, {0.0, -34.0}, {0.0, 32.0}, {-13.0, 32.0}}, 
      color = {0, 0, 127}));
  connect(const.y, digitalIntegrator_Sat.y_max)
    annotation (Line(origin = {-24.0, 4.0}, 
      points = {{1.0, -2.0}, {25.0, -2.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, digitalPI_Sat1.u)
    annotation (Line(origin = {-2.0, -76.0}, 
      points = {{-13.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 127}));
end Test_DigitalPID_Sat;