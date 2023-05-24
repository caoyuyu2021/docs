within ServoWing.Loads.Examples;
model Test_BADEGHJTablefun_Opt "七维插值测试"
  extends Modelica.Icons.Example;
  Components.C_BADEGHJTablefun_Opt c_BADEG(path = "D:/gongzuo/MWorks/StudyLib/Interpolation/Resources/data.csv") annotation (
    Placement(transformation(origin = {38.0, 0.0}, 
      extent = {{-40.0, -40.0}, {40.0, 40.0}})));

  Modelica.Blocks.Sources.RealExpression realExpression(y = 40)
    annotation (
      Placement(transformation(origin = {-90.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 15)
    annotation (
      Placement(transformation(origin = {-90.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = -20)
    annotation (
      Placement(transformation(origin = {-90.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = -10)
    annotation (
      Placement(transformation(origin = {-90.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = -18)
    annotation (
      Placement(transformation(origin = {-90.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = 2 + time)
    annotation (
      Placement(transformation(origin = {-90.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = -7.5 + time * 0.1)
    annotation (
      Placement(transformation(origin = {-90.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (experiment(StartTime = 0, StopTime = 100, Interval = 0.005, Algorithm = "Rkfix4", Tolerance = 0.0001, IntegratorStep = 0.005, DoublePrecision = true, StoreEventValue = false));
equation 
  connect(realExpression.y, c_BADEG.B)
    annotation (Line(origin = {-36.0, 52.0}, 
      points = {{-43.0, 8.0}, {16.0, 8.0}, {16.0, -16.0}, {30.0, -16.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, c_BADEG.A)
    annotation (Line(origin = {-36.0, 36.0}, 
      points = {{-43.0, 4.0}, {-4.0, 4.0}, {-4.0, -12.0}, {30.0, -12.0}}, 
      color = {0, 0, 127}));
  connect(realExpression2.y, c_BADEG.D)
    annotation (Line(origin = {-36.0, 20.0}, 
      points = {{-43.0, 0.0}, {-24.0, 0.0}, {-24.0, -8.0}, {30.0, -8.0}}, 
      color = {0, 0, 127}));
  connect(realExpression3.y, c_BADEG.E)
    annotation (Line(origin = {-36.0, 4.0}, 
      points = {{-43.0, -4.0}, {30.0, -4.0}}, 
      color = {0, 0, 127}));
  connect(realExpression4.y, c_BADEG.G)
    annotation (Line(origin = {-36.0, -12.0}, 
      points = {{-43.0, -8.0}, {-24.0, -8.0}, {-24.0, 0.0}, {30.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(realExpression5.y, c_BADEG.H)
    annotation (Line(origin = {-42.0, -32.0}, 
      points = {{-37.0, -8.0}, {2.0, -8.0}, {2.0, 8.0}, {36.0, 8.0}}, 
      color = {0, 0, 127}));
  connect(realExpression6.y, c_BADEG.J)
    annotation (Line(origin = {-42.0, -48.0}, 
      points = {{-37.0, -12.0}, {22.0, -12.0}, {22.0, 12.0}, {36.0, 12.0}}, 
      color = {0, 0, 127}));
end Test_BADEGHJTablefun_Opt;