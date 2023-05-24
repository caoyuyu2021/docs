within ServoWing.Controller.Components;
model Clark2 "三相静止坐标系abc到两相静止坐标系αβ的变换"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput i_a
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput i_c
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_alpha
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_beta
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  //隐含了i_b=-i_a-i_c
  i_alpha = sqrt(0.666666666666667) * 1.5 * i_a;
  i_beta = sqrt(0.5) * (-i_a - 2 * i_c);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {75.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_α", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {76.0, -20.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_β", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-77.0, 23.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_a", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-75.0, -24.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_c", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {188.5, 61.5}, 
      lineColor = {255, 104, 32}, 
      extent = {{-255.5, 15.5}, {-182.5, -15.5}}, 
      textString = "(a, c)", 
      textStyle = {TextStyle.None}, 
      textColor = {255, 104, 32}), Text(origin = {163.8, -31.799999999999997}, 
      lineColor = {255, 104, 32}, 
      extent = {{-176.8, 4.799999999999997}, {-108.80000000000001, -43.2}}, 
      textString = "(α，β)", 
      textColor = {255, 104, 32}), Line(origin = {0.0, 0.0}, 
      points = {{92.0, 92.0}, {-92.0, -92.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "Clark变换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}})), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16533\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 182px; HEIGHT: 137px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\21.jpg\" 
width=341 height=297></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输入</STRONG></SPAN></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">三相正弦电流信号或三相正弦电压信号</SPAN></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt\"><STRONG>输出</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt\">两相静止坐标系下的电压或电流信号</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>建模原理</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">三相静止坐标系<SPAN 
lang=EN-US>abc</SPAN>到两相静止坐标系αβ</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">的变换公式为:</SPAN></P>
<P>u_α = sqrt(2/3)*(u_a-u_b/2 - u_c/2);</P>
<P>u_β = sqrt(2/3)*[sqrt(3)*u_b/2 - sqrt(3)*u_c/2]</P></BODY></HTML>
 "));
end Clark2;