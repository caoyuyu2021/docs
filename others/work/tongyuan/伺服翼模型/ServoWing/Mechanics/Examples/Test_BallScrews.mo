﻿within ServoWing.Mechanics.Examples;
model Test_BallScrews
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));



  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 20)
    annotation (Placement(transformation(origin = {-12.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(origin = {-50.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 80)
    annotation (Placement(transformation(origin = {-88.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Mass mass
    annotation (Placement(transformation(origin = {50.0, 38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  BallScrews ballScrews
    annotation (Placement(transformation(origin = {20.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(const.y, torque.tau)
    annotation (Line(origin = {-72.0, 22.0}, 
      points = {{-5.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(torque.flange, inertia.flange_a)
    annotation (Line(origin = {-31.0, 22.0}, 
      points = {{-9.0, 0.0}, {9.0, 0.0}}));
  connect(inertia.flange_b, ballScrews.flange_r)
    annotation (Line(origin = {4.0, 22.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(ballScrews.flange_t, mass.flange_a)
    annotation (Line(origin = {41.0, 33.0}, 
      points = {{-21.0, -6.0}, {-21.0, 5.0}, {-1.0, 5.0}}, 
      color = {0, 127, 0}));
end Test_BallScrews;