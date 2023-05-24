within ServoWing.Controller.Components;
model DigitalPI_Sat "数字PI控制器_抗积分饱和"
  extends Icons.BasicModel;
  //参数
  parameter Real Kp = 2 "比例系数";
  parameter Real T = 0.001 "积分周期";
  parameter Real Ki = 1 "积分系数";
  parameter Real I_max = 1 "积分限幅";
  parameter Real ystart = 0 "积分初始值";

  //实例化
  Modelica.Blocks.Interfaces.RealInput u "实型输入信号连接器" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y "实型输出信号连接器" 
    annotation (Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler(
    samplePeriod = T) "连续信号的理想采样" 
    annotation (Placement(transformation(origin = {-67.91, 0.3200000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain1(
    k = Ki) "增益放大器" 
    annotation (Placement(transformation(origin = {-19.997500000000002, -0.009999999999990905}, 
      extent = {{-9.997499999999999, -10.0}, {9.9975, 10.0}})));
  Modelica.Blocks.Math.Gain gain2(
    k = Kp)
    annotation (Placement(transformation(origin = {-30.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add add "两输入信号相加" 
    annotation (Placement(transformation(origin = {70.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  DigitalIntegrator_Sat sample_sum(T = T, y(start = ystart)) "采样值求和" annotation (Placement(transformation(origin = {19.980000000000004, 6.109999999999999}, 
    extent = {{-10.0, -10.0}, {10.000000000000004, 10.0}})));

  // parameter Real Ti = 0.03;

  Modelica.Blocks.Sources.Constant const(k = I_max)
    annotation (Placement(transformation(origin = {-26.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sampler.y, gain2.u)
    annotation (Line(origin = {-50.5, -20.0}, 
      points = {{-6.0, 20.0}, {3.0, 20.0}, {3.0, -20.0}, {9.0, -20.0}}, 
      color = {0, 0, 127}));
  connect(sampler.u, u)
    annotation (Line(origin = {-97.0, 0.0}, 
      points = {{17.0, 0.0}, {-15.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(add.y, y)
    annotation (Line(origin = {99.5, 0.0}, 
      points = {{-19.0, 0.0}, {11.0, 0.0}}, 
      color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-28.0, -31.0}, 
      points = {{-42.0, -69.0}, {-42.0, -9.0}, {42.0, 69.0}}), Line(origin = {52.0, 38.0}, 
      points = {{-38.0, 0.0}, {38.0, 0.0}}), Text(origin = {20.380000000000003, -34.71}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-66.38, 20.71}, {66.38, -20.71}}, 
      textString = "DigitalPI", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-90.0, 30.0}, {90.0, -30.0}}, 
      textString = "数字PI控制器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-89.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {94.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16533\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 184px; HEIGHT: 132px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\25.jpg\" 
width=449 height=337></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输入</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">给定与反馈的差值，即误差信号</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输出</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">控制系统中的给定值</SPAN></P></BODY></HTML>
 "), 
    Diagram(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}})));
  connect(gain2.y, add.u2)
    annotation (Line(origin = {24.0, -23.0}, 
      points = {{-43.0, -17.0}, {22.0, -17.0}, {22.0, 17.0}, {34.0, 17.0}}, 
      color = {0, 0, 127}));
  connect(sample_sum.y, add.u1)
    annotation (Line(origin = {44.0, 4.0}, 
      points = {{-13.0, 2.0}, {14.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(gain1.y, sample_sum.u)
    annotation (Line(origin = {-1.0, 0.0}, 
      points = {{-8.0, 0.0}, {10.0, 0.0}, {10.0, 4.0}}, 
      color = {0, 0, 127}));
  connect(gain1.u, sampler.y)
    annotation (Line(origin = {-44.0, 0.0}, 
      points = {{12.0, 0.0}, {-13.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(const.y, sample_sum.y_max)
    annotation (Line(origin = {-26.0, 23.0}, 
      points = {{11.0, 17.0}, {26.0, 17.0}, {26.0, -15.0}, {35.0, -15.0}}, 
      color = {0, 0, 127}));
end DigitalPI_Sat;