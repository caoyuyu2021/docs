within ServoWing.Mechanics;
model ExternalSpurgear_EJ "直齿外啮合齿轮考虑效率、惯量"
  extends Icons.ExternalSpurgear;
  //基本参数
  parameter SI.Length m(displayUnit = "mm") = 0.001 "齿轮模数" 
    annotation (Dialog(tab = "基本参数", group = "共同参数"));
  parameter Real Alpha(final quantity = "Angle", unit = "deg") = 20 "齿轮压力角" 
    annotation (choices(choice = 15, choice = 20, choice = 25), Dialog(tab = "基本参数", group = "共同参数"));
  parameter Integer zA = 10 "A齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Integer zB = 20 "B齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "B齿轮参数"));
  parameter Real CoefficientOfHaA = 1 "A齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Real CoefficientOfHaB = 1 "B齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "B齿轮参数"));
  parameter Real CoefficientOfCA = 0.25 "A齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Real CoefficientOfCB = 0.25 "B齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "B齿轮参数"));
  //额外参数
  parameter Real eta = 0.95 "传动效率" 
    annotation (Dialog(tab = "额外参数", group = "共同参数"), choices(choice = 0.94, choice = 0.95, choice = 0.96, choice = 0.97, choice = 0.98), Dialog(tab = "基本参数", group = "共同参数"));
  parameter SI.Inertia JA(min = 0, start = 1) = 1e-5 "A齿轮惯性质量" 
    annotation (Dialog(tab = "额外参数", group = "A齿轮参数"));
  parameter SI.Inertia JB(min = 0, start = 1) = 1e-5 "B齿轮惯性质量" 
    annotation (Dialog(tab = "额外参数", group = "B齿轮参数"));
  //变量
  Real ratio "传送比";
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = JB)
    annotation (Placement(transformation(origin = {64.0, -50.0}, 
      extent = {{-10.000000000000007, -10.0}, {10.0, 10.000000000000007}})));
  Mechanics.Components.ExternalSpurgearSingle externalSpurgear(m = m, Alpha = Alpha, z = zA, CoefficientOfHa = CoefficientOfHaA, CoefficientOfC = CoefficientOfCA)
    annotation (Placement(transformation(origin = {0.0, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.Components.ExternalSpurgearSingle externalSpurgear1(m = m, Alpha = Alpha, z = zB, CoefficientOfHa = CoefficientOfHaB, CoefficientOfC = CoefficientOfCB) annotation (Placement(transformation(origin = {0.0, -50.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = JA)
    annotation (Placement(transformation(origin = {-50.0, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.Components.Efficiency efficiency1
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {4.0, -86.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "直齿外啮合齿轮", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.RotationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  ratio = zB / zA;//传送比
  connect(inertia1.flange_b, externalSpurgear.flange_a)
    annotation (Line(origin = {-23.0, 50.0}, 
      points = {{-14.0, 0.0}, {13.0, 0.0}}));
  connect(externalSpurgear.flange_b1, efficiency1.flange_a)
    annotation (Line(origin = {0.0, 25.0}, 
      points = {{0.0, 15.0}, {0.0, -15.0}}, 
      color = {0, 127, 0}));
  connect(efficiency1.flange_b, externalSpurgear1.flange_a1)
    annotation (Line(origin = {0.0, -25.0}, 
      points = {{0.0, 15.0}, {0.0, -15.0}}, 
      color = {0, 127, 0}));
  connect(externalSpurgear1.flange_b, inertia.flange_a)
    annotation (Line(origin = {30.0, -50.0}, 
      points = {{-20.0, 0.0}, {24.0, 0.0}, {24.0, 2.0}}));
  connect(inertia1.flange_a, flange_a)
    annotation (Line(origin = {-80.0, 25.0}, 
      points = {{20.0, 25.0}, {-20.0, 25.0}, {-20.0, -25.0}}));
  connect(flange_b, inertia.flange_b)
    annotation (Line(origin = {87.0, -25.0}, 
      points = {{13.0, 25.0}, {13.0, -25.0}, {-13.0, -25.0}}));
end ExternalSpurgear_EJ;