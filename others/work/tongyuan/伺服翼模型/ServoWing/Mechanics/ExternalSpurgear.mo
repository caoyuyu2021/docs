within ServoWing.Mechanics;
model ExternalSpurgear "直齿外啮合齿轮"
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
  //变量
  Real ratio "传送比";
  Mechanics.Components.ExternalSpurgearSingle externalSpurgear(m = m, Alpha = Alpha, z = zA, CoefficientOfHa = CoefficientOfHaA, CoefficientOfC = CoefficientOfCB)
    annotation (Placement(transformation(origin = {0.0, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.Components.ExternalSpurgearSingle externalSpurgear1(m = m, Alpha = Alpha, z = zB, CoefficientOfHa = CoefficientOfHaB, CoefficientOfC = CoefficientOfCB) annotation (Placement(transformation(origin = {0.0, -50.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.RotationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {2.0, -88.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "直齿外啮合齿轮", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
equation 
  ratio = zB / zA; //传送比
  connect(externalSpurgear1.flange_b, flange_b)
    annotation (Line(origin = {35.0, -30.0}, 
      points = {{-25.0, -20.0}, {65.0, -20.0}}));
  connect(externalSpurgear.flange_a, flange_a)
    annotation (Line(origin = {-55.0, 25.0}, 
      points = {{45.0, 25.0}, {-45.0, 25.0}, {-45.0, -25.0}}));
  connect(externalSpurgear.flange_b1, externalSpurgear1.flange_a1)
    annotation (Line(origin = {0.0, 0.0}, 
      points = {{0.0, 40.0}, {0.0, -40.0}}, 
      color = {0, 127, 0}));
end ExternalSpurgear;