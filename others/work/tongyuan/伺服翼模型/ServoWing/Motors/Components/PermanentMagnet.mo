within ServoWing.Motors.Components;
model PermanentMagnet "永磁激励"
  parameter SI.Current I_e = 26.3 "等效励磁电流";
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r "空间矢量连接器" 
    annotation (Placement(transformation(extent = {{-110, 90}, {-90, 110}})));
equation 
  //永磁激励方程
  spacePhasor_r.i_ = {-I_e, 0};
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 40.0}, 
      lineColor = {255, 0, 0}, 
      fillColor = {255, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 20.0}, {60.0, -20.0}}), Ellipse(origin = {0.0, -40.0}, 
      lineColor = {0, 255, 0}, 
      fillColor = {0, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 20.0}, {60.0, -20.0}}), Rectangle(origin = {2.0, 14.0}, 
      lineColor = {255, 0, 0}, 
      fillColor = {255, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 20.0}, {60.0, -20.0}}), Polygon(origin = {-80.0, 100.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {0, 0, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-10.0, 0.0}, {10.0, 6.0}, {10.0, -6.0}, {-10.0, 0.0}}), Rectangle(origin = {0.0, -20.0}, 
      lineColor = {0, 255, 0}, 
      fillColor = {0, 255, 0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 20.0}, {60.0, -20.0}}, 
      thickness = 0.5), Line(origin = {-60.0, -20.0}, 
      points = {{0.0, -20.0}, {0.0, 20.0}}, 
      color = {0, 255, 0}, 
      fillColor = {0, 255, 0}, 
      fillPattern = FillPattern.Solid), Line(origin = {60.0, -20.0}, 
      points = {{0.0, -20.0}, {0.0, 20.0}}, 
      color = {0, 255, 0}, 
      fillColor = {0, 255, 0}, 
      fillPattern = FillPattern.Solid), Line(origin = {-35.0, 100.0}, 
      points = {{35.0, 0.0}, {-35.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {0.0, 80.0}, 
      points = {{0.0, 20.0}, {0.0, -20.0}}, 
      color = {255, 0, 0}, 
      fillColor = {255, 0, 0}, 
      fillPattern = FillPattern.Solid)}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
		<HTML XMLNS:<br xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16545\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 183px; HEIGHT: 152px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\20.jpg\" width=368 
height=301><BR><STRONG><FONT size=4>输入</FONT></STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">等效的激励电流。</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P><FONT style=\"BACKGROUND-COLOR: #cce8cf\" size=4><STRONG>输出</STRONG></FONT></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">电流的空间向量。</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P><FONT style=\"BACKGROUND-COLOR: #cce8cf\" 
size=4><STRONG>建模原理</STRONG></FONT></P>
<P><FONT style=\"BACKGROUND-COLOR: #cce8cf\"><FONT size=+0><FONT size=+0><FONT 
size=+0><FONT size=+0><FONT size=+0><FONT size=+0><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">用电流直接模拟永磁铁产生磁场。</SPAN></FONT></FONT></FONT></FONT></FONT></FONT></FONT></P></BODY></HTML>
 "));
end PermanentMagnet;