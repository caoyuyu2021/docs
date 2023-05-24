within ServoWing.Loads.Examples;
model Test_JetNozzleX_T
  extends Modelica.Icons.Example;
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -140.0}, {140.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 50, Interval = 0.002, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  JetNozzleX_T jetNozzleX_T
    annotation (Placement(transformation(origin = {62.99999999999999, 21.000000000000007}, 
      extent = {{-19.0, -19.0}, {19.0, 19.0}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10, freqHz = 0.1)
    annotation (Placement(transformation(origin = {-26.0, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(origin = {10.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(origin = {10.0, 36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 10, freqHz = 0.1)
    annotation (Placement(transformation(origin = {-72.0, -82.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque3
    annotation (Placement(transformation(origin = {-36.0, -82.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 70.62)
    annotation (Placement(transformation(origin = {2.0, -82.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(origin = {48.0, -82.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain(k = 180 / Modelica.Constants.pi)
    annotation (Placement(transformation(origin = {76.00000000000001, -82.00000000000001}, 
      extent = {{-6.18, -6.18}, {6.18, 6.18}})));
  Sensors.Components.Normalized2 normalized(
    max = 180, 
    min = -180) annotation (Placement(transformation(origin = {104.0, -82.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(origin = {8.0, 84.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Force force1
    annotation (Placement(transformation(origin = {12.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 0)
    annotation (Placement(transformation(origin = {-26.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const1(k = 0)
    annotation (Placement(transformation(origin = {-26.0, -32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const2(k = 0)
    annotation (Placement(transformation(origin = {-26.0, 84.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(torque.flange, jetNozzleX_T.axis1)
    annotation (Line(origin = {32.0, 8.0}, 
      points = {{-12.0, -10.0}, {2.0, -10.0}, {2.0, 10.0}, {12.0, 10.0}}));
  connect(torque1.flange, jetNozzleX_T.axis)
    annotation (Line(origin = {32.0, 31.0}, 
      points = {{-12.0, 5.0}, {-6.0, 5.0}, {-6.0, -5.0}, {12.0, -5.0}}));
  connect(sine.y, torque1.tau)
    annotation (Line(origin = {-8.0, 43.0}, 
      points = {{-7.0, 7.0}, {-2.0, 7.0}, {-2.0, -7.0}, {6.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, torque3.tau)
    annotation (Line(origin = {-54.0, -75.0}, 
      points = {{-7.0, -7.0}, {6.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(torque3.flange, inertia.flange_a)
    annotation (Line(origin = {-17.0, -81.0}, 
      points = {{-9.0, -1.0}, {9.0, -1.0}}));



  connect(inertia.flange_b, angleSensor.flange)
    annotation (Line(origin = {25.0, -82.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}}));
  connect(angleSensor.phi, gain.u)
    annotation (Line(origin = {65.0, -83.0}, 
      points = {{-6.0, 1.0}, {4.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, normalized.u)
    annotation (Line(origin = {89.0, -83.0}, 
      points = {{-6.0, 1.0}, {3.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(force.flange, jetNozzleX_T.flange_y)
    annotation (Line(origin = {34.0, 55.0}, 
      points = {{-16.0, 29.0}, {-4.0, 29.0}, {-4.0, -26.0}, {10.0, -26.0}}, 
      color = {0, 127, 0}));
  connect(force1.flange, jetNozzleX_T.flange_z)
    annotation (Line(origin = {33.0, -7.0}, 
      points = {{-11.0, -25.0}, {7.0, -25.0}, {7.0, 21.0}, {11.0, 21.0}}, 
      color = {0, 127, 0}));
  connect(const.y, torque.tau)
    annotation (Line(origin = {-8.0, -2.0}, 
      points = {{-7.0, 0.0}, {6.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(const1.y, force1.f)
    annotation (Line(origin = {-8.0, -30.0}, 
      points = {{-7.0, -2.0}, {8.0, -2.0}}, 
      color = {0, 0, 127}));
  connect(const2.y, force.f)
    annotation (Line(origin = {-9.0, 84.0}, 
      points = {{-6.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 0, 127}));
end Test_JetNozzleX_T;