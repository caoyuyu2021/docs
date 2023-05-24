within ServoWing.Motors.Components;
partial model PartialBasicInductionMachine "感应电机抽象模型"
  extends PartialBasicMachine(J_Rotor = 0.05);
  parameter Integer m = 3 "相数";
  final parameter Real pi = Modelica.Constants.pi "常数π";
  parameter Integer p(min = 1) = 6 "极对数";
  output SI.Voltage vs[m] = plug_sp.pin.v - plug_sn.pin.v "定子瞬时电压";
  output SI.Current is[m] = plug_sp.pin.i "定子瞬时电流";
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_sp(
    final m = m)
    annotation (Placement(transformation(extent = {{10, 90}, {30, 110}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_sn(
    final m = m)
    annotation (extent = [-50, 90; -30, 110]);
  annotation (Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>
<BODY><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>建模原理</STRONG></SPAN></P></SPAN>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">感应电机的基础部分模型，其中包括定子的电学接口（包括流变量电流、势变量电压）和旋转电机的通用机械部分，建立感应电机基础组件模型。</SPAN><BR></P></BODY></HTML>
 "), 
    Diagram(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}, 
      initialScale = 0)), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      initialScale = 0.0, 
      grid = {1.0, 1.0}), graphics = {Line(origin = {-32.0, 85.0}, 
      points = {{-15.0, 15.0}, {15.0, 15.0}, {15.0, -15.0}}, 
      color = {0, 0, 255}), Line(origin = {15.0, 85.0}, 
      points = {{15.0, 15.0}, {-15.0, 15.0}, {-15.0, -15.0}}, 
      color = {0, 0, 255}), Text(origin = {2.5, -137.5}, 
      extent = {{-90.0, 30.0}, {90.0, -30.0}}, 
      textString = "永磁同步电机", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end PartialBasicInductionMachine;