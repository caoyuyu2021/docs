within ServoWing.Mechanics.Components;
model PlanetNGW "NGW行星轮"
  //参数
  parameter SI.Length m(displayUnit = "mm") = 0.001 "齿轮模数" 
    annotation (Dialog(tab = "基本参数", group = "匹配参数"));
  parameter Real Alpha(final quantity = "Angle", unit = "deg") = 20 "齿轮压力角" 
    annotation (choices(choice = 15, choice = 20, choice = 25), Dialog(tab = "基本参数", group = "匹配参数"));
  parameter Real CoefficientOfHa = 1 "齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "齿轮参数"));
  parameter Real CoefficientOfC = 0.25 "顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "齿轮参数"));
  parameter Real zA = 20 "外啮合的齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "齿轮参数"));
  parameter Real zC = 80 "内啮合的齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "齿轮参数"));
  //变量
  SI.AngularVelocity wH "行星架H转动角速度";
  Real zB "行星齿轮齿数";
  SI.Length dB "行星齿轮直径";
  SI.Position sA "A处转动长度";
  SI.Position sB "B处转动长度";
  SI.Force ftA "A处所受切向力";
  SI.Force ftB "B处所受切向力";
  SI.Force frA "A处所受径向力";
  SI.Force frB "B处所受径向力";
  Interfaces.TranslationalInterfaces.Flange_a flange_a1
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b1
    annotation (Placement(transformation(origin = {0.0, 40.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {89.0, -50.25}, 
      points = {{7.0, 12.25}, {-1.0, 9.75}, {-7.0, 3.75}, {-7.0, -4.25}, {1.0, -10.25}, {7.0, -12.25}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Rectangle(origin = {0.0, 70.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-10.0, 30.0}, {10.0, -30.0}}), Rectangle(origin = {22.0, 9.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.VerticalCylinder, 
      extent = {{-4.0, 55.0}, {4.0, -55.0}}), Rectangle(origin = {59.0, -50.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-41.0, -4.0}, {41.0, 4.0}}), Rectangle(origin = {0.0, 70.0}, 
      fillColor = {165, 165, 165}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-10.0, 26.0}, {10.0, -26.0}}), Rectangle(origin = {5.0, 70.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-21.0, 4.0}, {21.0, -4.0}}), Rectangle(origin = {22.0, 88.0}, 
      fillColor = {153, 153, 153}, 
      fillPattern = FillPattern.VerticalCylinder, 
      extent = {{-4.0, 12.0}, {4.0, -12.0}}), Polygon(origin = {97.0, -39.5}, 
      fillPattern = FillPattern.Solid, 
      points = {{3.0, 1.5}, {-3.0, 3.0}, {-3.0, -3.0}}), Ellipse(origin = {90.0, 90.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {90.0, 90.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 1.0}, {1.0, -1.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "NGW行星轮", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {100.0, -50.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_a2
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b2
    annotation (Placement(transformation(origin = {0.0, 40.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
  Interfaces.RotationalInterfaces.Flange_a flange_a3
    annotation (Placement(transformation(origin = {100.0, -50.0}, 
      extent = {{-4.0, -4.0}, {4.0, 4.0}})));
equation 
  zA + zB = zC - zB;//行星齿轮齿数
  wH = der(flange_a.phi); //行星架转速
  der(flange_a1.s) - wH * m * zA / 2 = der(sA);//转化后的端口传递
  ftA = flange_a1.f; //端口传递";
  der(flange_b1.s) - wH * m * zC / 2 = der(sB);//转化后的端口传递
  ftB = flange_b1.f; //端口传递
  dB = m * zB; //直径与模关系
  sA = -sB; //转化后上下接口速度相反
  ftA * dB / 2 - ftB * dB / 2 = 0; //齿轮力矩平衡
  ftA + ftB + flange_a.tau * 4 / (m * zA + m * zC) = 0;//齿轮力平衡
  //径向力  
  frA = ftA * tan(Alpha);
  frB = ftB * tan(Alpha);
end PlanetNGW;