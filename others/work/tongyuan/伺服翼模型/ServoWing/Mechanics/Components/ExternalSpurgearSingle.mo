within ServoWing.Mechanics.Components;
model ExternalSpurgearSingle "直齿外啮合齿轮"
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
  SI.Angle phiB "B处转动角度";
  SI.Torque tauB "B处轴所受扭矩";
  SI.Position sA "A处转动长度";
  SI.Position sB "B处转动长度";
  SI.Velocity vA "A处转动线速度";
  SI.Velocity vB "B处转动线速度";
  SI.AngularVelocity wA "A处转动角速度";
  SI.AngularVelocity wB "B处转动角速度";
  SI.Force ftA "A处所受切向力";
  SI.Force ftB "B处所受切向力";
  SI.Force frA "A处所受径向力";
  SI.Force frB "B处所受径向力";
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_a1
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.RotationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b1
    annotation (Placement(transformation(origin = {0.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {129, 129, 129}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-40.0, 80.0}, {40.0, -80.0}}), Rectangle(origin = {0.0, 90.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}), Rectangle(origin = {0.0, -90.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}), Rectangle(origin = {0.0, 0.0}, 
      lineColor = {64, 64, 64}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-100.0, -20.0}, {100.0, 20.0}}), Line(origin = {-70.0, -32.0}, 
      points = {{-30.0, 0.0}, {30.0, 0.0}}), Line(origin = {-69.5, 32.0}, 
      points = {{-29.5, 0.0}, {29.5, 0.0}}), Ellipse(origin = {-70.0, 90.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-70.0, 90.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 1.0}, {1.0, -1.0}}), Line(origin = {-70.75, -39.25}, 
      points = {{-8.75, -7.25}, {-0.75, -5.25}, {6.25, 0.25}, {8.75, 7.25}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Line(origin = {-69.75, 39.25}, 
      points = {{-9.75, 7.25}, {-1.75, 5.25}, {5.25, 1.75}, {9.75, -7.25}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Polygon(origin = {-75.5, 45.5}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 1.0}, {4.0, 3.0}, {2.0, -3.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "直齿外啮合齿轮", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
equation 
  phiA = flange_a.phi; //端口传递
  phiB = flange_b.phi; //端口传递
  tauA = flange_a.tau; //端口传递
  tauB = flange_b.tau; //端口传递
  sA = flange_a1.s; //端口传递
  ftA = flange_a1.f; //端口传递
  sB = flange_b1.s; //端口传递
  ftB = flange_b1.f; //端口传递
  d = m * z;//直径与模关系
  vA = der(sA);//线速度
  vB = der(sB);//线速度
  wA = der(phiA);//角速度;
  wB = der(phiB);//角速度;
  phiA = phiB; //两转动端口同轴
  sA = -sB;//上下接口位移相反
  sA = phiA * d / 2; //转动与线速度关系
  tauA + tauB + ftA * d / 2 - ftB * d / 2 = 0; //齿轮力矩平衡
  //径向力  
  frA = ftA * tan(Alpha);
  frB = ftB * tan(Alpha);
end ExternalSpurgearSingle;