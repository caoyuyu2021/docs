within ServoWing.Controller.Components;
model DigitalPI "数字PI控制器"
  extends Icons.BasicModel;

  //参数
  parameter Real Kp = 2;
  parameter Real T = 0.001;
  parameter Real Ki = Kp * T / Ti;
  //实例化
  Modelica.Blocks.Interfaces.RealInput u "实型输入信号连接器" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y "实型输出信号连接器" 
    annotation (Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler(
    samplePeriod = T) "连续信号的理想采样" 
    annotation (Placement(transformation(extent = {{-79.91, -9.68}, {-59.91, 10.32}})));
  Modelica.Blocks.Math.Gain gain1(
    k = Ki) "增益放大器" 
    annotation (Placement(transformation(extent = {{0.005, -10.01}, {20, 9.99}})));
  Modelica.Blocks.Math.Gain gain2(
    k = Kp)
    annotation (Placement(transformation(origin = {-30.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add add "两输入信号相加" 
    annotation (Placement(transformation(origin = {70.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  DigitalIntegrator sample_sum(T = T) "采样值求和" 
    annotation (Placement(transformation(extent = {{-40.02, -9.89}, {-20.02, 10.11}})));
protected 
  parameter Real Ti = 0.03;
equation 
  connect(sampler.y, gain2.u)
    annotation (Line(origin = {-50.5, -20.0}, 
      points = {{-8.0, 20.0}, {3.0, 20.0}, {3.0, -20.0}, {9.0, -20.0}}, 
      color = {0, 0, 127}));
  connect(sample_sum.u, sampler.y)
    annotation (Line(points = {{-41, 0}, {-59, 0}}, color = {0, 0, 127}));
  connect(sample_sum.y, gain1.u)
    annotation (Line(points = {{-19, 0}, {-2, 0}}, color = {0, 0, 127}));
  connect(sampler.u, u)
    annotation (Line(points = {{-82, 0}, {-112, 0}}, color = {0, 0, 127}));
  connect(add.y, y)
    annotation (Line(origin = {99.5, 0.0}, 
      points = {{-19.0, 0.0}, {11.0, 0.0}}, 
      color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {1.5949999999999989, -6.674999999999997}, 
      points = {{-71.595, -93.325}, {-71.595, -33.325}, {71.595, 93.325}}), Text(origin = {20.380000000000003, -34.71}, 
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
  connect(gain1.y, add.u1)
    annotation (Line(origin = {44.0, 3.0}, 
      points = {{-23.0, -3.0}, {2.0, -3.0}, {2.0, 3.0}, {14.0, 3.0}}, 
      color = {0, 0, 127}));
  connect(gain2.y, add.u2)
    annotation (Line(origin = {24.0, -23.0}, 
      points = {{-43.0, -17.0}, {22.0, -17.0}, {22.0, 17.0}, {34.0, 17.0}}, 
      color = {0, 0, 127}));
end DigitalPI;