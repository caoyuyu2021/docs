within ServoWing.Motors.Examples;
model Test_AirGapELB
  extends ServoLib.Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.01, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Components.AirGapELB airGapELB
    annotation (Placement(transformation(origin = {-30.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.ConstantVoltage constantVoltage
    annotation (Placement(transformation(origin = {-80.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  Electrical.Ground ground
    annotation (Placement(transformation(origin = {-80.0, -24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {6.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGap(s_rel0 = 1, c = 10000, d = 1000)
    annotation (Placement(transformation(origin = {62.0, 30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(origin = {86.0, 20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(constantVoltage.n, ground.p)
    annotation (Line(origin = {-78.0, -2.0}, 
      points = {{-2.0, 2.0}, {-2.0, -12.0}}, 
      color = {0, 0, 255}));
  connect(constantVoltage.p, airGapELB.p)
    annotation (Line(origin = {-60.0, 21.0}, 
      points = {{-20.0, -1.0}, {-20.0, 11.0}, {4.0, 11.0}, {4.0, -11.0}, {20.0, -11.0}}, 
      color = {0, 0, 255}));
  connect(airGapELB.n, ground.p)
    annotation (Line(origin = {-60.0, -6.0}, 
      points = {{20.0, 8.0}, {2.0, 8.0}, {2.0, -1.0}, {-20.0, -1.0}, {-20.0, -8.0}}, 
      color = {0, 0, 255}));
  connect(airGapELB.support, fixed.flange)
    annotation (Line(origin = {-7.0, -12.0}, 
      points = {{-13.0, 14.0}, {11.0, 14.0}, {11.0, -14.0}, {13.0, -14.0}}, 
      color = {0, 127, 0}));
  connect(elastoGap.flange_b, fixed1.flange)
    annotation (Line(origin = {79.0, 25.0}, 
      points = {{-7.0, 5.0}, {7.0, 5.0}, {7.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(airGapELB.flange_a, elastoGap.flange_a)
    annotation (Line(origin = {16.0, 20.0}, 
      points = {{-36.0, -10.0}, {-6.0, -10.0}, {-6.0, 10.0}, {36.0, 10.0}}, 
      color = {0, 127, 0}));
end Test_AirGapELB;