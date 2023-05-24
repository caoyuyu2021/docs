within ServoWing.Motors.Components;
model SpacePhasor "相位变换模型"
  constant Integer m = 3 "相数";
  constant Real pi = Modelica.Constants.pi;
  SI.Voltage v[m] "相电压瞬时值";
  SI.Current i[m] "相电流瞬时值";
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(
    final m = m)
    annotation (extent = [-110, 90; -90, 110]);
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(
    final m = m)
    annotation (extent = [-110, -110; -90, -90]);
  Modelica.Electrical.Analog.Interfaces.PositivePin zero
    annotation (extent = [90, -10; 110, 10]);
  Modelica.Electrical.Analog.Interfaces.NegativePin ground
    annotation (extent = [90, -110; 110, -90]);
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor
    annotation (extent = [90, 90; 110, 110]);
  Modelica.Electrical.Analog.Basic.Ground gnd
    annotation (extent = [60, -110; 80, -90]);
protected 
  parameter Real TransformationMatrix[2,m] = 2 / m * 
    {{cos(+(k - 1) / m * 2 * pi) for k in 1:m}, {+sin(+(k - 1) / m * 2 * pi) for k in 1:m}};
  parameter Real InverseTransformation[m,2] = 
    {{cos(-(k - 1) / m * 2 * pi), -sin(-(k - 1) / m * 2 * pi)} for k in 1:m};
equation 
  // 三相电流和电压计算
  v = plug_p.pin.v - plug_n.pin.v;
  i = +plug_p.pin.i;
  i = -plug_n.pin.i;
  zero.v = 1 / m * sum(v);
  // 定子空间两相静止坐标变量计算；包含 v_alpha, v_beta ,i_alpha,i_beta
  spacePhasor.v_ = TransformationMatrix * v;
  -zero.i = 1 / m * sum(i);
  -spacePhasor.i_ = TransformationMatrix * i;
  connect(gnd.p, ground)
    annotation (points = [70, -90; 100, -90; 100, -100], 
      style(
        color = 3, 
        rgbcolor = {0, 0, 255}, 
        fillColor = 3, 
        rgbfillColor = {0, 0, 255}, 
        fillPattern = 1));
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {40.0, 40.0}, 
      points = {{-40.0, -40.0}, {40.0, 40.0}, {20.0, 32.0}, {32.0, 20.0}, {40.0, 40.0}}, 
      color = {0, 0, 255}), Line(origin = {40.0, -40.0}, 
      points = {{-40.0, 40.0}, {40.0, -40.0}, {32.0, -20.0}, {20.0, -32.0}, {40.0, -40.0}}, 
      color = {0, 0, 255}), Line(origin = {-40.0, 0.0}, 
      points = {{-40.0, 0.0}, {-33.33, 10.0}, {-26.67, 17.32}, {-20.0, 20.0}, {-13.329999999999998, 17.32}, {-6.670000000000002, 10.0}, {0.0, 0.0}, {6.670000000000002, -10.0}, {13.329999999999998, -17.32}, {20.0, -20.0}, {26.67, -17.32}, {33.33, -10.0}, {40.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {-50.0, 0.0}, 
      points = {{-40.0, 0.0}, {-33.33, 10.0}, {-26.67, 17.32}, {-20.0, 20.0}, {-13.329999999999998, 17.32}, {-6.670000000000002, 10.0}, {0.0, 0.0}, {6.670000000000002, -10.0}, {13.329999999999998, -17.32}, {20.0, -20.0}, {26.67, -17.32}, {33.33, -10.0}, {40.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {-30.0, 0.0}, 
      points = {{-40.0, 0.0}, {-33.33, 10.0}, {-26.67, 17.32}, {-20.0, 20.0}, {-13.329999999999998, 17.32}, {-6.670000000000002, 10.0}, {0.0, 0.0}, {6.670000000000002, -10.0}, {13.329999999999998, -17.32}, {20.0, -20.0}, {26.67, -17.32}, {33.33, -10.0}, {40.0, 0.0}}, 
      color = {0, 0, 255}), Text(origin = {65.0, 0.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "zero", 
      textColor = {0, 0, 255}, 
      fillColor = 3, 
      rgbfillColor = {0, 0, 255}, 
      fillPattern = 1), Line(origin = {75.0, -100.0}, 
      points = {{15.0, 0.0}, {-15.0, 0.0}}, 
      color = {0, 0, 255}, 
      fillColor = 3, 
      rgbfillColor = {0, 0, 255}, 
      fillPattern = 1), Line(origin = {60.0, -100.0}, 
      points = {{0.0, 16.0}, {0.0, -16.0}}, 
      color = {0, 0, 255}, 
      fillColor = 3, 
      rgbfillColor = {0, 0, 255}, 
      fillPattern = 1), Line(origin = {50.0, -100.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      color = {0, 0, 255}, 
      fillColor = 3, 
      rgbfillColor = {0, 0, 255}, 
      fillPattern = 1), Line(origin = {40.0, -100.0}, 
      points = {{0.0, 4.0}, {0.0, -4.0}}, 
      color = {0, 0, 255}, 
      fillColor = 3, 
      rgbfillColor = {0, 0, 255}, 
      fillPattern = 1)}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
		<HTML xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16533\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 181px; HEIGHT: 150px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\17.jpg\" 
width=371 height=363></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输入</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">三相的相电压、相电流</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"><STRONG>输出</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">相电压、相电流两相静止坐标系下的分量。</SPAN></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">具体参考Clark变换。</SPAN></P></BODY></HTML>
 "));
end SpacePhasor;