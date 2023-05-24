within ServoWing.Motors.Components;
partial model PartialBasicMachine "电机通用抽象模型"
  extends Icons.BasicModel;

  parameter SI.Inertia J_Rotor = 0.05 "转子转动惯量";
  parameter Boolean useSupport = false "使用支撑还是固定定子" 
    annotation (Evaluate = true);
  final parameter SI.Inertia J_Stator = J_Rotor
    "定子转动惯量" 
    annotation (Dialog(enable = useSupport));
  output SI.Angle phi_mechanical = flange_a.phi - internalSupport.phi
    "相对于定子的转子机械角度";
  output SI.AngularVelocity w_mechanical = der(phi_mechanical)
    "相对于定子的转子机械角速度";
  output SI.Conversions.NonSIunits.AngularVelocity_rpm rpm_mechanical = 
    SI.Conversions.to_rpm(w_mechanical)
    "转子机械角速度，单位为r/min";
  output SI.Torque Te = inertiaRotor.flange_a.tau
    "电磁转矩";
  output SI.Torque tau_shaft = -flange_a.tau "轴端转矩";
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (extent = [90, -10; 110, 10]);
  Modelica.Mechanics.Rotational.Components.Inertia inertiaRotor(final J = J_Rotor, 
    phi(start
       = 0, 
      fixed
       = true))
    annotation (extent = [80, 10; 60, -10], 
      rotation = -180);
  Modelica.Mechanics.Rotational.Components.Inertia inertiaStator(final J = J_Stator) if useSupport
    annotation (Placement(transformation(origin = {70, -90}, rotation = -180, extent = {{10, 10}, {-10, -10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed if (not useSupport)
    annotation (extent = [30, -110; 50, -90]);
protected 
  Modelica.Mechanics.Rotational.Interfaces.Flange_b internalSupport
    annotation (extent = [19, -101; 21, -99]);
public 
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support if useSupport
    "Support at which the reaction torque is acting" 
    annotation (Placement(transformation(extent = {{90, -110}, {110, -90}}, 
      rotation = 0)));
equation 
  connect(inertiaRotor.flange_b, flange_a)
    annotation (points = [80, 1.22465e-15; 92, 1.22465e-15; 92, 0; 100, 0], 
      style(color = 0, rgbcolor = {0, 0, 0}));
  connect(internalSupport, inertiaStator.flange_a)
    annotation (Line(points = {{20, -100}, {20, -90}, {60, -90}}, color = {0, 0, 0}));
  connect(internalSupport, fixed.flange)
    annotation (Line(color = {0, 0, 0}, points = {{20, -100}, {40, -100}}));
  connect(inertiaStator.flange_b, support)
    annotation (Line(color = {0, 0, 0}, points = {{80, -90}, {100, -90}, {100, -100}}));
  annotation (Coordsys(preserveAspectRatio = false, 
    extent = [-100, -100; 100, 100], 
    grid = [1, 1], 
    scale = 0), 
    Icon(coordinateSystem(preserveAspectRatio = false, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {1, 1}, 
      initialScale = 0), 
      graphics = {
      Rectangle(extent = {{-40, -60}, {80, 60}}, color = {0, 0, 0}, fillColor = {153, 204, 255}, 
      fillPattern = FillPattern.HorizontalCylinder), 
      Rectangle(extent = {{-60, -60}, {-40, 60}}, color = {0, 0, 0}, fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.HorizontalCylinder), 
      Rectangle(extent = {{80, -10}, {100, 10}}, color = {0, 0, 0}, fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.HorizontalCylinder), 
      Rectangle(extent = {{-40, 50}, {40, 70}}, color = {95, 95, 95}, fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid), 
      Polygon(points = {{-50, -90}, {-40, -90}, {-10, -30}, {40, -30}, {70, -90}, 
      {80, -90}, {80, -100}, {-50, -100}, {-50, -90}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid), 
      Rectangle(extent = {{-50, -100}, {80, -85}}, color = {0, 0, 0}, fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid), 
      Rectangle(extent = {{80, -80}, {120, -120}}, color = {192, 192, 192}, fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid), 
      Line(visible = not useSupport, points = {{80, -100}, {120, -100}}, color = {0, 0, 0}, smooth = Smooth.None), 
      Line(visible = not useSupport, points = {{90, -100}, {80, -120}}, color = {0, 0, 0}, smooth = Smooth.None), 
      Line(visible = not useSupport, points = {{100, -100}, {90, -120}}, color = {0, 0, 0}, smooth = Smooth.None), 
      Line(visible = not useSupport, points = {{110, -100}, {100, -120}}, color = {0, 0, 0}, smooth = Smooth.None), 
      Line(visible = not useSupport, points = {{120, -100}, {110, -120}}, color = {0, 0, 0}, smooth = Smooth.None)}), 
    Coordsys(grid = [1, 1], scale = 0), 
    Documentation(revisions = "<html>
<table border=\"1\" rules=\"groups\">
<thead>
<tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr>
</thead>
<tbody>
<tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr>
</tbody>
</table>
</html>", info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>
<BODY><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>建模原理</STRONG></SPAN></P></SPAN>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">提取旋转电机建模时公共的机械部分，除了机械转动连接器</SPAN><I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>flange_a</SPAN></I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">外，电机有一个二级机械转动连接器</SPAN><I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>support</SPAN></I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">。若</SPAN><I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>useSupport</SPAN></I><I style=\"mso-bidi-font-style: normal\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US> = fals</SPAN></I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>e</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>, </SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">则认为定子是固定的。否则响应转矩</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>(</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">如气隙转矩减去定子转动惯量的加速转矩</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>)</SPAN><I style=\"mso-bidi-font-style: normal\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">由</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Times New Roman','serif'; FONT-SIZE: 12pt; mso-fareast-theme-font: minor-fareast; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>support</SPAN></I><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">测量。也有可能固定转轴让定子旋转，参数</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>Js</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">只有当定子旋转时才有用。</SPAN></P></BODY></HTML>
 "), Icon(
      Rectangle(extent = [80, -10; 100, 10], style(rgbcolor = {0, 0, 0}, rgbfillColor = {95, 95, 95}, gradient = 2)), 
      Text(extent = [-150, -180; 150, -120], style(rgbcolor = {0, 0, 255}, rgbfillColor = {95, 95, 95}, fillPattern = 1), string = "%name"), 
      Rectangle(extent = [80, -120; 120, -80], style(rgbcolor = {192, 192, 192}, rgbfillColor = {192, 192, 192}, fillPattern = 1))), 
    Documentation(info = "<HTML>
Base partial model DC machines:
<ul>
<li>main parts of the icon</li>
<li>mechanical flange</li>
<li>mechanical support</li>
</ul>
Besides the mechanical connector <i>flange_a</i> (i.e. the shaft) the machines have a second mechanical connector <i>support</i>.<br>
If <i>useSupport</i> = false, it is assumed that the stator is fixed.<br>
Otherwise reaction torque (i.e. airGap torque, minus acceleration torque for stator's moment of inertia) can be measured at <i>support</i>.<br>
One may also fix the the shaft and let rotate the stator; parameter Js is only of importance when the stator is rotating.
</HTML>"), 
    Diagram);
end PartialBasicMachine;