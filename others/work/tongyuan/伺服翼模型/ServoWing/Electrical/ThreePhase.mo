within ServoWing.Electrical;
model ThreePhase "三相全桥逆变器"
  extends Icons.BasicModel;
  extends Components.SupplyDC;
  extends Components.LoadThreePhase;
  /*
  pulse[6]信号连接关系
  1 2 3
  4 5 6
  */
  //参数
  parameter Modelica.SIunits.Resistance RonSwitch = 1e-5 "导通电阻" 
    annotation (Dialog(tab = "理想电子开关", group = "参数"));
  parameter Modelica.SIunits.Conductance GoffSwitch = 1e-5 "开路电导(电阻倒数)" 
    annotation (Dialog(tab = "理想电子开关", group = "参数"));
  parameter Modelica.SIunits.Resistance RonDiode = 1e-5 "二极管导通电阻" 
    annotation (Dialog(tab = "理想二极管", group = "参数"));
  parameter Modelica.SIunits.Conductance GoffDiode = 1e-5 "二极管截止电导(电阻倒数)" 
    annotation (Dialog(tab = "理想二极管", group = "参数"));
  parameter Modelica.SIunits.Voltage VkneeDiode = 0 "门限电压" 
    annotation (Dialog(tab = "理想二极管", group = "参数"));
  //实例化
  Modelica.Blocks.Interfaces.BooleanInput pulse[6] "六路开关控制信号" 
    annotation (extent = [110, -10; 90, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput vDC "直流电压,V" 
    annotation (extent = [90, -70; 110, -50], 
      Placement(transformation(origin = {110.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Electrical.Components.IdealClosingSwitch idealClosingSwitch1(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [-70, 40; -50, 60], 
      rotation = -90, 
      Placement(transformation(origin = {-56.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch3(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [-10, 40; 10, 60], 
      rotation = -90, 
      Placement(transformation(origin = {4.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch5(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [50, 40; 70, 60], 
      rotation = -90);
  Electrical.Components.IdealClosingSwitch idealClosingSwitch4(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [-70, -60; -50, -40], 
      rotation = -90, 
      Placement(transformation(origin = {-56.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch6(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [-10, -60; 10, -40], 
      rotation = -90, 
      Placement(transformation(origin = {4.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch2(final Goff = GoffSwitch, final Ron = RonSwitch)
    annotation (extent = [50, -60; 70, -40], 
      rotation = -90);

  Electrical.Components.IdealDiode idealDiode1(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [-50, 60; -30, 40], 
      rotation = -90, 
      Placement(transformation(origin = {-36.0, 50.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
        rotation = 90.0)));
  Electrical.Components.IdealDiode idealDiode3(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [13, 60; 33, 40], 
      rotation = -90, 
      Placement(transformation(origin = {27.0, 50.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
        rotation = 90.0)));
  Electrical.Components.IdealDiode idealDiode5(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [70, 60; 90, 40], 
      rotation = -90);
  Electrical.Components.IdealDiode idealDiode4(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [-50, -40; -30, -60], 
      rotation = -90, 
      Placement(transformation(origin = {-36.0, -50.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
        rotation = 90.0)));
  Electrical.Components.IdealDiode idealDiode6(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [10, -40; 30, -60], 
      rotation = -90, 
      Placement(transformation(origin = {24.0, -50.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
        rotation = 90.0)));
  Electrical.Components.IdealDiode idealDiode2(final Ron = RonDiode, 
    final Goff = GoffDiode, 
    final Vknee = VkneeDiode)
    annotation (extent = [70, -40; 90, -60], 
      rotation = -90);
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(origin = {-86.0, 14.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = 90.0)));
equation 
  connect(idealClosingSwitch1.n, idealClosingSwitch4.p)
    annotation (points = [-60, 40; -60, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-56.0, 0.0}, 
        points = {{0.0, 40.0}, {0.0, -40.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch3.n, idealClosingSwitch6.p)
    annotation (points = [6.12323e-16, 40; 6.12323e-16, -40; -6.12323e-16, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {4.0, 0.0}, 
        points = {{0.0, 40.0}, {0.0, -40.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch5.n, idealClosingSwitch2.p)
    annotation (points = [60, 40; 60, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}));
  connect(pSupply, idealClosingSwitch1.p)
    annotation (points = [-100, 60; -60, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-76.0, 60.0}, 
        points = {{-24.0, -20.0}, {-24.0, 0.0}, {20.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch1.p, idealClosingSwitch3.p)
    annotation (points = [-60, 60; -6.12323e-16, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-26.0, 60.0}, 
        points = {{-30.0, 0.0}, {30.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch3.p, idealClosingSwitch5.p)
    annotation (points = [-6.12323e-16, 60; 60, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {34.0, 60.0}, 
        points = {{-30.0, 0.0}, {26.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(nSupply, idealClosingSwitch4.n)
    annotation (points = [-100, -60; -60, 
      -60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-76.0, -60.0}, 
        points = {{-24.0, 20.0}, {-24.0, 0.0}, {20.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch4.n, idealClosingSwitch6.n)
    annotation (points = [-60, -60; 6.12323e-16, -60], 
      style(color = 3, rgbcolor = {0, 0, 
        255}), 
      Line(origin = {-26.0, -60.0}, 
        points = {{-30.0, 0.0}, {30.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealClosingSwitch6.n, idealClosingSwitch2.n)
    annotation (points = [6.12323e-16, -60; 60, -60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {34.0, -60.0}, 
        points = {{-30.0, 0.0}, {26.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode1.n, idealClosingSwitch1.p)
    annotation (points = [-40, 
      60; -60, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-46.0, 60.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode3.n, idealClosingSwitch3.p)
    annotation (points = [23, 60; 
      -6.12323e-16, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {15.5, 60.0}, 
        points = {{12.0, 0.0}, {-12.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode5.n, idealClosingSwitch5.p)
    annotation (points = [80, 60; 
      60, 60], 
      style(color = 3, rgbcolor = {0, 0, 255}));
  connect(idealDiode4.p, idealClosingSwitch4.n)
    annotation (points = [-40, 
      -60; -60, -60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-46.0, -60.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode6.p, idealClosingSwitch6.n)
    annotation (points = [20, -60; 
      6.12323e-16, -60], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {14.0, -60.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode2.p, idealClosingSwitch2.n)
    annotation (points = [80, 
      -60; 60, -60], 
      style(color = 3, rgbcolor = {0, 0, 255}));
  connect(voltageSensor.p, pSupply)
    annotation (Line(origin = {-95.0, 45.0}, 
      points = {{9.0, -21.0}, {9.0, -5.0}, {-5.0, -5.0}}, 
      color = {0, 0, 255}));
  connect(voltageSensor.n, nSupply)
    annotation (Line(origin = {-95.0, -25.0}, 
      points = {{9.0, 29.0}, {9.0, -35.0}, {-5.0, -35.0}, {-5.0, -15.0}}, 
      color = {0, 0, 255}));
  connect(pLoad.pin[1], idealClosingSwitch4.p)
    annotation (points = [0, 
      -100.667; 0, -70; -75, -70; -75, 0; -60, 0; -60, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-33.5, -50.3335}, 
        points = {{34.0, -50.0}, {34.0, -20.0}, {-38.0, -20.0}, {-38.0, 48.0}, {-23.0, 48.0}, {-23.0, 10.0}}, 
        color = {0, 0, 255}));
  connect(pLoad.pin[2], idealClosingSwitch6.p)
    annotation (points = [0, -100; 0, -70; -20, -70; -20, -6; -6.12303e-16, -6; -6.12303e-16, 
      -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-6.0, -53.0}, 
        points = {{6.0, -47.0}, {6.0, -17.0}, {-10.0, -17.0}, {-10.0, 47.0}, {10.0, 47.0}, {10.0, 13.0}}, 
        color = {0, 0, 255}));
  connect(pLoad.pin[3], idealClosingSwitch2.p)
    annotation (points = [0, -99.3333; 0, -70; 39, -70; 39, -6; 60, -6; 60, -40], 
      style(
        color = 3, rgbcolor = {0, 0, 255}));
  connect(vDC, voltageSensor.v)
    annotation (Line(origin = {10.0, -30.0}, 
      points = {{100.0, -30.0}, {74.0, -30.0}, {74.0, -50.0}, {-86.0, -50.0}, {-86.0, 44.0}}, 
      color = {0, 0, 127}));
  connect(idealDiode1.p, idealClosingSwitch1.n)
    annotation (points = [-40, 40; -60, 40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-46.0, 40.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode3.p, idealClosingSwitch3.n)
    annotation (points = [23, 40; 
      6.12323e-16, 40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {15.5, 40.0}, 
        points = {{12.0, 0.0}, {-12.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode5.p, idealClosingSwitch5.n)
    annotation (points = [80, 40; 60, 40], 
      style(color = 3, rgbcolor = {0, 0, 255}));
  connect(idealDiode4.n, idealClosingSwitch4.p)
    annotation (points = [-40, -40; -60, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {-46.0, -40.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode6.n, idealClosingSwitch6.p)
    annotation (points = [20, -40; 
      -6.12323e-16, -40], 
      style(color = 3, rgbcolor = {0, 0, 255}), 
      Line(origin = {14.0, -40.0}, 
        points = {{10.0, 0.0}, {-10.0, 0.0}}, 
        color = {0, 0, 255}));
  connect(idealDiode2.n, idealClosingSwitch2.p)
    annotation (points = [80, -40; 60, 
      -40], 
      style(color = 3, rgbcolor = {0, 0, 255}));
  connect(idealClosingSwitch1.control, pulse[1])
    annotation (Line(origin = {27.5, 25.0}, 
      points = {{-77.0, 25.0}, {-74.0, 25.0}, {-74.0, -25.0}, {73.0, -25.0}}, 
      color = {255, 0, 255}));
  connect(pulse[2], idealClosingSwitch3.control)
    annotation (Line(origin = {57.5, 25.0}, 
      points = {{43.0, -25.0}, {-41.0, -25.0}, {-41.0, 25.0}, {-47.0, 25.0}}, 
      color = {255, 0, 255}));
  connect(pulse[3], idealClosingSwitch5.control)
    annotation (Line(origin = {83.5, 25.0}, 
      points = {{17.0, -25.0}, {-14.0, -25.0}, {-14.0, 25.0}, {-17.0, 25.0}}, 
      color = {255, 0, 255}));
  connect(pulse[4], idealClosingSwitch4.control)
    annotation (Line(origin = {27.5, -25.0}, 
      points = {{73.0, 25.0}, {-74.0, 25.0}, {-74.0, -25.0}, {-77.0, -25.0}}, 
      color = {255, 0, 255}));
  connect(pulse[5], idealClosingSwitch6.control)
    annotation (Line(origin = {57.5, -25.0}, 
      points = {{43.0, 25.0}, {-41.0, 25.0}, {-41.0, -25.0}, {-47.0, -25.0}}, 
      color = {255, 0, 255}));
  connect(pulse[6], idealClosingSwitch2.control)
    annotation (Line(points = {{100, 0}, {70, 0}, {70, -50}, {67, -50}}, color = {255, 0, 255}));
  annotation (defaultComponentName = "DCAC", 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-50.0, 60.0}, 
      extent = {{0.0, 20.0}, {0.0, -20.0}}, 
      textString = "DC"), Text(origin = {50.0, -70.0}, 
      extent = {{0.0, 20.0}, {0.0, -20.0}}, 
      textString = "AC"), Rectangle(origin = {0.0, 0.0}, 
      fillColor = {240, 245, 250}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-90.0, 90.0}, {90.0, -90.0}}), Polygon(origin = {0.0, 0.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{90.0, 90.0}, {90.0, -90.0}, {-90.0, -90.0}}), Ellipse(origin = {0.0, 2.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-50.0, 50.0}, {50.0, -50.0}}), Line(origin = {60.0, 60.0}, 
      points = {{-40.0, -40.0}, {40.0, 40.0}}), Line(origin = {-50.0, -50.0}, 
      points = {{-40.0, -40.0}, {40.0, 40.0}}), Ellipse(origin = {-11.0, -11.0}, 
      fillColor = {255, 104, 32}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 1.0}, {1.0, -1.0}}), Ellipse(origin = {9.0, 9.0}, 
      fillColor = {255, 104, 32}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 1.0}, {1.0, -1.0}}), Line(origin = {10.0, 10.0}, 
      points = {{-15.0, 15.0}, {15.0, -15.0}}, 
      color = {0, 0, 255}, 
      fillPattern = FillPattern.Solid), Line(origin = {40.0, 0.0}, 
      points = {{0.0, 0.0}, {0.0, 0.0}}, 
      color = {255, 0, 255}, 
      fillColor = {215, 215, 215}, 
      fillPattern = FillPattern.Solid), Polygon(origin = {-10.0, -10.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{20.0, 20.0}, {10.0, -20.0}, {-20.0, 10.0}, {20.0, 20.0}}), Line(origin = {0.0, 0.0}, 
      points = {{-28.0, -28.0}, {28.0, 28.0}}, 
      color = {0, 0, 255}), Text(origin = {-50.0, 60.0}, 
      extent = {{0.0, 20.0}, {0.0, -20.0}}, 
      textString = "DC"), Text(origin = {50.0, -70.0}, 
      extent = {{0.0, 20.0}, {0.0, -20.0}}, 
      textString = "AC"), Text(origin = {0.0, -130.0}, 
      extent = {{-90.0, 30.0}, {90.0, -30.0}}, 
      textString = "三相全桥逆变器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {76.0, 0.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "pulse", 
      textStyle = {TextStyle.None}), Text(origin = {84.0, -56.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "vDC", 
      textStyle = {TextStyle.None})}), Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<HTML xmlns:o = \"urn:schemas-microsoft-com:office:office\"><HEAD>
<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>
<META name=GENERATOR content=\"MSHTML 9.00.8112.16545\"></HEAD>
<BODY>
<P><STRONG><IMG style=\"WIDTH: 188px; HEIGHT: 172px\" border=0 hspace=0 alt=\"\" 
align=baseline src=\".\\图片\\34.jpg\" width=362 
height=343></STRONG></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\"><STRONG>输入</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\"></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">输出接口为</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>Positive_Pin</FONT></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">、</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><FONT 
face=Calibri>Negative_Pin</FONT></SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">，为单相电气特性连接器，输入信号包括的势变量、流</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin\">变量分别为直流电源的电压，流过直流电源的电流。</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-SIZE: 12pt\" lang=EN-US><o:p></o:p></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">控制信号</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\" 
lang=EN-US>u</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">，为数值接口。</SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\"><STRONG>输出</STRONG></SPAN></P>
<P><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">输出接口为</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 'Calibri','sans-serif'; FONT-SIZE: 12pt; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\" 
lang=EN-US>pLoad</SPAN><SPAN 
style=\"LINE-HEIGHT: 150%; FONT-FAMILY: 宋体; FONT-SIZE: 12pt; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\">，为多相电气特性连接器，输出信号包括的势变量、流变量分别为逆变器输出的三相电压，流过逆变器的三相电流。</SPAN></P></BODY></HTML>
 "), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {110.0, -13.0}, 
      extent = {{-22.0, 5.0}, {22.0, -5.0}}, 
      textString = "六路开关控制信号", 
      textStyle = {TextStyle.None}), Text(origin = {106.0, -73.0}, 
      extent = {{-12.0, 3.0}, {12.0, -3.0}}, 
      textString = "直流电压,V", 
      textStyle = {TextStyle.None})}));
end ThreePhase;