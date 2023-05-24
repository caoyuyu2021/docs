within ServoWing.Motors.Components;
partial model PartialAirGap "基本气隙模型"
  parameter Integer m = 3 "相数";
  parameter Integer p(min = 1) = 6 "极对数";
  output SI.Torque tau_electrical "转矩";
  Real RotationMatrix[2,2] "从转子到定子旋转的矩阵";
  SI.Angle gamma "转子角位移";
  SI.Current i_ss[2] "考虑到定子固定框架的定子电流空间矢量";
  SI.Current i_sr[2] "考虑到转子固定框架的定子电流空间矢量";
  SI.Current i_rs[2] "考虑到定子固定框架的转子电流空间矢量";
  SI.Current i_rr[2] "考虑到转子固定框架的转子电流空间矢量";
  SI.MagneticFlux psi_ms[2] "考虑到定子固定框架的磁通矢量";
  SI.MagneticFlux psi_mr[2] "考虑到转子固定框架的磁通矢量";
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (extent = [-10, 110; 10, 90]);
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support
    annotation (extent = [-10, -110; 10, -90]);
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_s
    annotation (extent = [-110, 90; -90, 110]);
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r
    annotation (extent = [90, 90; 110, 110]);
equation 
  // 转子的机械角度，γ是α与d轴的夹角
  gamma = p * (flange_a.phi - support.phi);
  // 旋转矩阵是从dq轴到α、β之间的一个矩阵
  RotationMatrix = {{+cos(gamma), -sin(gamma)}, {+sin(gamma), +cos(gamma)}};
  // i_rs: 转子静止坐标电流，包含 alpha, beta。i_rr: 转子旋转坐标电流，包含d, q。
  i_ss = spacePhasor_s.i_;
  i_ss = RotationMatrix * i_sr;
  i_rr = spacePhasor_r.i_;
  i_rs = RotationMatrix * i_rr;
  // 定子电压
  spacePhasor_s.v_ = der(psi_ms);
  // 转子电压
  spacePhasor_r.v_ = der(psi_mr);
  // 电磁转矩 (电流和磁通空间矢量的叉积)
  tau_electrical = m / 2 * p * (spacePhasor_s.i_[2] * psi_ms[1] - spacePhasor_s.i_[1] * psi_ms[2]);
  flange_a.tau = -tau_electrical;
  support.tau = tau_electrical;
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, -1.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-90.0, 91.0}, {90.0, -91.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-80.0, 80.0}, {80.0, -80.0}}), Rectangle(origin = {0.0, 5.0}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.VerticalCylinder, 
      extent = {{-10.0, 85.0}, {10.0, -85.0}})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16533\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 191px; HEIGHT: 186px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\18.jpg\" 
width=374 height=353></P>
<P><STRONG>输入</STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">向量形式的电枢电压、电流，励磁电流</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P><STRONG>输出</STRONG></P>
<P><SPAN
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">转动端口（包括转矩、转角）</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P>
<P><STRONG>建模原理</STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">将两相静止坐标系下的电压电流转换为两相旋转坐标系下的电压电流，并计算电磁转矩。</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">具体变换参考</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>Park</FONT></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">变换。</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">转矩的计算原理，如下所示：</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">ψ_d 
= Ld*i_d + ψ_f;</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">ψ_q 
= Lq*i_q;</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">Τe 
= 3/2*p*(ψ_sα*i_sβ - ψ_sα*i_sβ).</SPAN></P></BODY></HTML>
 "));
end PartialAirGap;