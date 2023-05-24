within ServoWing.Motors;
model PMSM "永磁同步电机"
  extends Motors.Components.PartialBasicInductionMachine(J_Rotor = 45e-6, p = 2);


  // parameter Modelica.SIunits.Frequency fNominal = 633 "d轴反电动势频率";
  // parameter Modelica.SIunits.Voltage V0 = 113 "d轴反电动势幅值";
  parameter Real FluxLinkage(unit = "V.s") = 0.04018 "由磁铁建立的磁链";
  parameter Modelica.SIunits.Resistance Rs = 0.06 "定子相电阻" 
    annotation (Dialog(group = "电阻和电感"));
  parameter Modelica.SIunits.Inductance Lssigma = 4e-5 "定子相漏感" 
    annotation (Dialog(group = "电阻和电感"));
  final parameter Modelica.SIunits.Inductance Lszero = 0 "定子的零序电感" 
    annotation (Dialog(group = "电阻和电感"));

  parameter Modelica.SIunits.Inductance Lmd = 0.16e-3 "d轴电感" 
    annotation (Dialog(group = "电阻和电感"));
  parameter Modelica.SIunits.Inductance Lmq = 0.16e-3 "q轴电感" 
    annotation (Dialog(group = "电阻和电感"));

  output SI.Current is_abc[3] = rs.i "定子相电流";
  output SI.Current idq_sr[2](each stateSelect = StateSelect.prefer) = airGapR.i_sr "定子空间矢量 / 转子固定";
  output SI.Power power_out = inertiaRotor.w * flange_a.tau "电机功率输出";

  // output SI.Current i_0_s(stateSelect = StateSelect.prefer) = spacePhasorS.zero.i "定子零序电流";
  // output SI.Current idq_ss[2] = airGapR.i_ss "定子空间矢量 / 定子固定";
  // output SI.Current idq_rs[2] = airGapR.i_rs "转子空间矢量 / 定子固定";
  // output SI.Current idq_rr[2](each stateSelect = StateSelect.prefer) = airGapR.i_rr "转子空间矢量 / 转子固定";
   //变量
  Real phi_rpm(unit = "rev/min") = inertiaRotor.w * 60 / (2 * pi) "电机转速";

  Motors.Components.AirGapR airGapR(final p = p, final m = 3, final L_md = Lmd, final L_mq = Lmq)
    annotation (Placement(transformation(origin = {12.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Motors.Components.PermanentMagnet permanentMagnet(I_e = Ie)
    annotation (Placement(transformation(origin = {10.5, -34.5}, 
      extent = {{-11.5, -11.5}, {11.5, 11.5}}, 
      rotation = -90.0)));
  Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m = m, final R = fill(Rs, m), useHeatPort = true)
    annotation (Placement(transformation(origin = {43.0, 70.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));

  Motors.Components.SpacePhasor spacePhasorS
    annotation (Placement(transformation(origin = {2.0, 52.0}, 
      extent = {{10.0, 10.0}, {-10.0, -10.0}}, 
      rotation = 90.0)));

  //final parameter SI.Current Ie = sqrt(2) * V0 / (Lmd * 2 * pi * fNominal) "等效励磁电流";
protected 
  final parameter SI.Current Ie = FluxLinkage / Lmd "等效励磁电流";
public 
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = Lszero)
    annotation (Placement(transformation(origin = {-23.0, 21.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Motors.Components.strayInductance strayInductance1(L = Lssigma)
    annotation (Placement(transformation(origin = {33.0, 41.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort[3]
    annotation (Placement(transformation(origin = {100.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(airGapR.support, internalSupport)
    annotation (Line(origin = {0.5, -50.0}, 
      points = {{2.0, 50.0}, {-20.0, 50.0}, {-20.0, -50.0}, {20.0, -50.0}}));
  connect(plug_sp, rs.plug_p)
    annotation (Line(origin = {50.0, 79.0}, 
      points = {{-30.0, 21.0}, {10.0, 21.0}, {10.0, -9.0}, {3.0, -9.0}}, 
      color = {0, 0, 255}));
  connect(spacePhasorS.plug_n, plug_sn)
    annotation (Line(origin = {-24.5, 69.0}, 
      points = {{17.0, -7.0}, {17.0, 1.0}, {-16.0, 1.0}, {-16.0, 31.0}}, 
      color = {0, 0, 255}));
  connect(airGapR.flange_a, inertiaRotor.flange_a)
    annotation (Line(origin = {40.0, 0.0}, 
      points = {{-18.0, 0.0}, {20.0, 0.0}}));
  connect(airGapR.spacePhasor_r, permanentMagnet.spacePhasor_r)
    annotation (Line(origin = {20.0, -15.5}, 
      points = {{2.0, 6.0}, {2.0, -8.0}}));annotation (defaultComponentName = "SMPM", 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        initialScale = 0.0, 
        grid = {2.0, 2.0}), graphics = {Text(origin = {8.0, 0.0}, 
        extent = {{-60.0, 60.0}, {60.0, -60.0}}, 
        textString = "PMSM", 
        textStyle = {TextStyle.None})}), 
      Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
		<HTML xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>
<BODY>
<P><IMG style=\"WIDTH: 182px; HEIGHT: 128px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\8.jpg\" 
width=397 height=325></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输入</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">输出接口为</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>plug_p</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">、</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>plug_n</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">，为多相电气特性连接器，输入信号包括的势变量、流变量分别为逆变器输出的三相电压、三相电流</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输出</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">输出接口为</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>Flange_a</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">，为机械转动连接器，输出信号包括的势变量、流变量分别为电机的电机转子轴的角度、电机输出的电磁转矩</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"><STRONG>建模原理</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">基于</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>DQ</FONT></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">轴坐标系对</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>PMSM</FONT></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">进行建模，依据方程：</SPAN></P>
<UL>
<LI><SPAN 
  style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">DQ坐标系下的电气特性方程</SPAN> 
  <LI><SPAN 
  style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"></SPAN><SPAN 
  style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">机械特性方程<BR></LI></UL></SPAN>
	<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\">建模原理参考:</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>Machines.Components.SpacePhasor</FONT></SPAN></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-fareast-font-family: 宋体\"><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>Machines.Components.AirGapR<o:p></o:p></FONT></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\" 
lang=EN-US>Machines.Components.PartialAirGap</SPAN></SPAN></P></BODY></HTML>
 "), 
      Line(points = {{0, 10}, {-130, 10}, {-130, -110}, {-10, -110}, {-10, -100}, 
        {20, -100}}, color = {0, 0, 127}), 
      Diagram(coordinateSystem(preserveAspectRatio = true, 
        extent = {{-100, -100}, {100, 100}})));
  connect(spacePhasorS.ground, inductor.p)
    annotation (Line(origin = {-29.0, 16.0}, 
      points = {{21.0, 26.0}, {21.0, 21.0}, {-10.0, 21.0}, {-10.0, 5.0}, {-4.0, 5.0}}, 
      color = {0, 0, 255}));
  connect(inductor.n, spacePhasorS.zero)
    annotation (Line(origin = {-8.0, 16.0}, 
      points = {{-5.0, 5.0}, {10.0, 5.0}, {10.0, 26.0}}, 
      color = {0, 0, 255}));
  connect(spacePhasorS.spacePhasor, strayInductance1.spacePhasor_a)
    annotation (Line(origin = {20.0, 22.0}, 
      points = {{-8.0, 20.0}, {3.0, 20.0}}, 
      color = {0, 0, 255}));
  connect(strayInductance1.spacePhasor_b, airGapR.spacePhasor_s)
    annotation (Line(origin = {37.0, 15.0}, 
      points = {{6.0, 26.0}, {14.0, 26.0}, {14.0, 5.0}, {-15.0, 5.0}, {-15.0, -5.0}}, 
      color = {0, 0, 255}));
  connect(rs.plug_n, spacePhasorS.plug_p)
    annotation (Line(origin = {24.0, 51.0}, 
      points = {{9.0, 19.0}, {-12.0, 19.0}, {-12.0, 11.0}}, 
      color = {0, 0, 255}));
  connect(rs.heatPort, heatPort)
    annotation (Line(origin = {72.0, 66.0}, 
      points = {{-29.0, -6.0}, {-29.0, -15.0}, {16.0, -15.0}, {16.0, 14.0}, {28.0, 14.0}}, 
      color = {191, 0, 0}));
end PMSM;