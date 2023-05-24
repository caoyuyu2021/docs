within ServoWing.Motors.Examples;
model Test_spring
  extends ServoLib.Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-140.0, -140.0}, {140.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.02, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 10, s_rel0 = -0.005)
    annotation (Placement(transformation(origin = {8.0, 88.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 10, s_rel0 = 0.005)
    annotation (Placement(transformation(origin = {6.0, 48.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {-40.0, 70.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(origin = {-40.0, 38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position
    annotation (Placement(transformation(origin = {18.0, -42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 0}, {1, 0.05}})
    annotation (Placement(transformation(origin = {-64.0, -42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoLib.Motors.Components.SpringDamper_endstop springDamper_endstop2(c_fixed = 10, d = 10, s_rel0(displayUnit = "mm") = 0.005)
    annotation (Placement(transformation(origin = {54.0, -90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoLib.Motors.Components.SpringDamper_endstop springDamper_endstop3(c_fixed = 10, d = 1, s_rel0(displayUnit = "mm") = 0.005)
    annotation (Placement(transformation(origin = {8.0, 12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Mechanics.Translational.Components.Fixed fixed2
    annotation (Placement(transformation(origin = {-38.0, -6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed3
    annotation (Placement(transformation(origin = {76.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Sources.Position position1
    annotation (Placement(transformation(origin = {10.0, -90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = {{0, 0}, {5, 0}, {5.01, -0.008}, {7.5, -0.008}, {7.51, 0.008}, {10, 0.008}})
    annotation (Placement(transformation(origin = {-72.0, -90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1, amplitude = 0.006)
    annotation (Placement(transformation(origin = {-118.0, -94.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(fixed.flange, springDamper.flange_a)
    annotation (Line(origin = {-36.0, 36.0}, 
      points = {{-4.0, 34.0}, {-4.0, 52.0}, {34.0, 52.0}}, 
      color = {0, 127, 0}));
  connect(springDamper1.flange_b, fixed1.flange)
    annotation (Line(origin = {100.0, 39.0}, 
      points = {{-104.0, 9.0}, {-140.0, 9.0}, {-140.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(position.flange, springDamper.flange_b)
    annotation (Line(origin = {20.0, 21.0}, 
      points = {{8.0, -63.0}, {20.0, -63.0}, {20.0, 67.0}, {-2.0, 67.0}}, 
      color = {0, 127, 0}));
  connect(springDamper1.flange_a, springDamper.flange_b)
    annotation (Line(origin = {32.0, 46.0}, 
      points = {{-16.0, 2.0}, {8.0, 2.0}, {8.0, 42.0}, {-14.0, 42.0}}, 
      color = {0, 127, 0}));
  connect(timeTable.y, position.s_ref)
    annotation (Line(origin = {-28.0, 22.0}, 
      points = {{-25.0, -64.0}, {34.0, -64.0}}, 
      color = {0, 0, 127}));
  connect(fixed2.flange, springDamper_endstop3.flange_a)
    annotation (Line(origin = {-21.0, -5.0}, 
      points = {{-17.0, -1.0}, {-17.0, 17.0}, {19.0, 17.0}}, 
      color = {0, 127, 0}));
  connect(springDamper_endstop3.flange_b, springDamper.flange_b)
    annotation (Line(origin = {28.0, 47.0}, 
      points = {{-10.0, -35.0}, {12.0, -35.0}, {12.0, 41.0}, {-10.0, 41.0}}, 
      color = {0, 127, 0}));
  connect(fixed3.flange, springDamper_endstop2.flange_b)
    annotation (Line(origin = {-49.0, -23.0}, 
      points = {{125.0, -77.0}, {125.0, -67.0}, {113.0, -67.0}}, 
      color = {0, 127, 0}));
  connect(position1.flange, springDamper_endstop2.flange_a)
    annotation (Line(origin = {24.0, -103.0}, 
      points = {{-4.0, 13.0}, {20.0, 13.0}}, 
      color = {0, 127, 0}));
  connect(timeTable1.y, position1.s_ref)
    annotation (Line(origin = {-31.0, -90.0}, 
      points = {{-30.0, 0.0}, {29.0, 0.0}}, 
      color = {0, 0, 127}));
end Test_spring;