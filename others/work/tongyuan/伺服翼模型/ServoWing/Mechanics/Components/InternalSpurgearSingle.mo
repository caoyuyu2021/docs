within ServoWing.Mechanics.Components;
model InternalSpurgearSingle "直齿内啮合齿轮"
  //参数
  parameter SI.Length m(displayUnit = "mm") = 0.001 "齿轮模数" 
    annotation (Dialog(tab = "基本参数", group = "匹配参数"));
  parameter Real Alpha(final quantity = "Angle", unit = "deg") = 20 "齿轮压力角" 
    annotation (choices(choice = 15, choice = 20, choice = 25), Dialog(tab = "基本参数", group = "匹配参数"));
  parameter Integer z = 10 "齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "齿轮参数"));
  parameter Real CoefficientOfHa = 1 "齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "齿轮参数"));
  parameter Real CoefficientOfC = 0.25 "顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "齿轮参数"));
  //变量  
  SI.Length d "齿轮直径";
  SI.Angle phiA "A处转动角度";
  SI.Torque tauA "A处所受扭矩";
  SI.Position sA "A处转动长度";
  SI.Position sB "B处转动长度";
  SI.Velocity vA "A处转动线速度";
  SI.Velocity vB "B处转动线速度";
  SI.AngularVelocity wA "A处转动角速度";
  SI.Force ftA "A处所受切向力";
  SI.Force ftB "B处所受切向力";
  SI.Force frA "A处所受径向力";
  SI.Force frB "B处所受径向力";
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {11.359469591138481, 70.06291770062758}, 
      fillColor = {255, 255, 255}, 
      extent = {{-28.75019256303011, 9.70602363528441}, {28.7501925630301, -9.706023635284424}}), Rectangle(origin = {-58.23422202135508, -0.7657779786449224}, 
      lineColor = {64, 64, 64}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-41.0, -20.0}, {41.0, 20.0}}), Line(origin = {-70.0, -32.0}, 
      points = {{-30.0, 0.0}, {30.0, 0.0}}), Line(origin = {-69.5, 32.0}, 
      points = {{-29.5, 0.0}, {29.5, 0.0}}), Rectangle(origin = {-26.769373858447437, 0.41733333906349657}, 
      fillColor = {167, 167, 167}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-9.940787881652966, 80.83357575184559}, {9.940787881652966, -80.83357575184561}}), Rectangle(origin = {1.7565137381218108, 90.4778530413164}, 
      fillColor = {42, 42, 42}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-38.464407619488995, 10.367046157174656}, {38.464407619489016, -10.367046157174656}}), Rectangle(origin = {10.123653940408001, -70.2535111291386}, 
      fillColor = {255, 255, 255}, 
      extent = {{-30.123653940408, 10.253511129138602}, {30.123653940408, -10.253511129138602}}), Rectangle(origin = {1.7602537987353486, -89.73843839925146}, 
      fillColor = {42, 42, 42}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-38.540446675341926, 10.393711645275019}, {38.540446675341954, -10.393711645275005}}), Ellipse(origin = {-70.0, 90.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-70.0, 90.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 1.0}, {1.0, -1.0}}), Line(origin = {-68.75, -39.25}, 
      points = {{-8.75, -7.25}, {-0.75, -5.25}, {6.25, 0.25}, {8.75, 7.25}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Line(origin = {-69.75, 39.25}, 
      points = {{-9.75, 7.25}, {-1.75, 5.25}, {5.25, 1.75}, {9.75, -7.25}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Polygon(origin = {-75.5, 45.5}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 1.0}, {4.0, 3.0}, {2.0, -3.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "直齿内啮合齿轮", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_a1
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b1
    annotation (Placement(transformation(origin = {0.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  phiA = flange_a.phi; //端口传递
  tauA = flange_a.tau; //端口传递
  sA = flange_a1.s; //端口传递
  ftA = flange_a1.f; //端口传递
  sB = flange_b1.s; //端口传递
  ftB = flange_b1.f; //端口传递
  d = m * z; //直径与模关系;
  vA = der(sA); //线速度
  vB = der(sB); //线速度
  wA = der(phiA); //角速度;
  sA = -sB;//上下接口位移相反
  sA = phiA * d / 2; //转动与线速度关系
  tauA + ftA * d / 2 - ftB * d / 2 = 0; //齿轮力矩平衡
  //径向力  
  frA = ftA * tan(Alpha);
  frB = ftB * tan(Alpha);
end InternalSpurgearSingle;