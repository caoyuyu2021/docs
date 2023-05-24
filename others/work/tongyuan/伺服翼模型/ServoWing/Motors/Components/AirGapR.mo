within ServoWing.Motors.Components;
model AirGapR "转子为固定轴的气隙模型"
  extends PartialAirGap;
  parameter SI.Inductance L_md = 1 "转子d轴电感";
  parameter SI.Inductance L_mq = 1 "转子q轴电感";
  SI.Current i_mr[2] "考虑转子固定支架的磁化电流空间矢量";
protected 
  parameter SI.Inductance L[2,2] = {{L_md, 0}, {0, L_mq}} "电感矩阵";
equation 
  // 考虑转子固定支架的磁化电流空间矢量
  i_mr = i_sr + i_rr;
  // 基于定子参考系的主磁链
  psi_mr = L * i_mr;
  // 基于定子参考系的主磁链
  psi_ms = RotationMatrix * psi_mr;
  annotation (defaultComponentName = "airGap", 
    Diagram(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}})), 
    Icon(Text(
      extent = [0, 40; 80, -40], 
      string = "R", 
      style(
        color = 0, 
        rgbcolor = {0, 0, 0}, 
        gradient = 1, 
        fillColor = 10, 
        rgbfillColor = {128, 128, 128})), 
      Text(
        extent = [-150, -90; 150, -150], 
        style(color = 3, rgbcolor = {0, 0, 255}), 
        string = "%name"), 
      coordinateSystem(preserveAspectRatio = true, 
        extent = {{-100, -100}, {100, 100}})), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
		<HTML xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16533\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 177px; HEIGHT: 157px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\19.jpg\" 
width=357 height=350></P>
<P><STRONG>输入</STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">向量形式的电枢电压、电流，励磁电流</SPAN></P>
<P><STRONG>输出</STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">转动端口（包括转矩、转角）</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P><STRONG>建模原理</STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 0pt\">具体的建模方式详见：</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 0pt\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 0pt\" 
lang=EN-US>MotorDrive.Machines.Components.PartialAirGap</SPAN></SPAN></P></BODY></HTML>
 "));
end AirGapR;