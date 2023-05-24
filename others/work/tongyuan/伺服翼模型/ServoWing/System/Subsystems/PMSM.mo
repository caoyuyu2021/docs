within ServoWing.System.Subsystems;
model PMSM "永磁同步电机"
  extends Icons.BasicModel;
  //电机参数
  parameter Modelica.SIunits.Inertia J_Rotor = 45e-6 "转子转动惯量" 
    annotation (Dialog(tab = "电机"));
  parameter Boolean useSupport = false "使用支撑还是固定定子,true:使用支撑(定子转动),false:固定定子" 
    annotation (Dialog(tab = "电机"));
  parameter Integer m = 3 "相数" 
    annotation (Dialog(tab = "电机"));
  parameter Integer p(min = 1) = 2 "极对数" 
    annotation (Dialog(tab = "电机"));
  parameter Real FluxLinkage(unit = "V.s") = 0.04018 "由磁铁建立的磁链" 
    annotation (Dialog(tab = "电机"));


  parameter Modelica.SIunits.Resistance Rs = 0.06 "定子相电阻" 
    annotation (Dialog(tab = "电机", group = "电阻和电感"));
  parameter Modelica.SIunits.Inductance Lssigma = 4e-5 "定子相漏感" 
    annotation (Dialog(tab = "电机", group = "电阻和电感"));

  parameter Modelica.SIunits.Inductance Lmd = 0.16e-3 "d轴电感" 
    annotation (Dialog(tab = "电机", group = "电阻和电感"));
  parameter Modelica.SIunits.Inductance Lmq = 0.16e-3 "q轴电感" 
    annotation (Dialog(tab = "电机", group = "电阻和电感"));

  // parameter Modelica.SIunits.Angle phi_start(displayUnit = "rad") = 0 "电机初始角度" 
  //   annotation (Dialog(tab = "电机", group = "初始条件"));
  // parameter Modelica.SIunits.AngularVelocity w_start = 0 "电机初始角速度" 
  //   annotation (Dialog(tab = "电机", group = "初始条件"));

  //接线盒参数
  parameter String terminalConnection(start = "Y") = "Y" "接线方式 Y:星形连接,D:三角形连接" 
    annotation (choices(choice = "Y" "星形连接", choice = "D" "三角形连接"), Dialog(tab = "接线盒"));

    //失电制动器参数
  parameter SI.Voltage Va = 220 "额定电压" 
    annotation (Dialog(tab = "失电制动器", group = "电气参数"));
  parameter Real n = 0.8 "断电电压系数,小于额定电压的n倍则视为断电" 
    annotation (Dialog(tab = "失电制动器", group = "电气参数"));
  final parameter SI.Resistance Ra = 7.5 "电阻" 
    annotation (Dialog(tab = "失电制动器", group = "电气参数"));
  parameter SI.Torque torque_max(final min = 0, start = 1) = 1.2 "摩擦盘最大力矩" 
    annotation (Dialog(tab = "失电制动器", group = "电气参数"));
  //变量
  Real phi_rpm(unit = "rev/min") = pMSM.phi_rpm "电机转速";
  output SI.Power power_out = pMSM.power_out "电机功率输出";

  // SI.Current i1 "三相电流";
  // SI.Current i2 "三相电流";
  // SI.Current i3 "三相电流";
  // SI.Current i_d "直轴电流";
  // SI.Current i_q "交轴电流";

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (extent = [90, -10; 110, 10]);
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_n "三相电" 
    annotation (Placement(transformation(origin = {-104.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.HeatInterfaces.HeatPort_a port[3] "热接口" annotation (Placement(transformation(origin = {0.0, 98.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Motors.PMSM pMSM(useSupport = useSupport, m = m, p = p, Rs = Rs, J_Rotor = J_Rotor, Lmd = Lmd, Lmq = Lmq, Lssigma = Lssigma)


    annotation (Placement(transformation(origin = {-1.0, -67.00000000000003}, 
      extent = {{-15.000000000000014, -14.999999999999986}, {15.000000000000014, 14.999999999999986}})));
  Motors.TerminalBox terminalBox(terminalConnection = terminalConnection)
    annotation (Placement(transformation(origin = {-1.0000000000000266, -26.99999999999998}, 
      extent = {{-11.000000000000021, -11.000000000000021}, {11.000000000000021, 11.000000000000025}})));
  Motors.ElectricLossBrake VCM(Va = Va, n = n, torque_max = torque_max) annotation (Placement(transformation(origin = {57.0, -67.0}, 
    extent = {{-13.0, -13.0}, {13.0, 13.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.PositivePin pin_ap "失电制动器电源正极" 
    annotation (Placement(transformation(origin = {-102.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.NegativePin pin_an "失电制动器电源负极" 
    annotation (Placement(transformation(origin = {-102.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  annotation (Line(points = {{0, 10}, {-130, 10}, {-130, -110}, {-10, -110}, {-10, -100}, 
    {20, -100}}, color = {0, 0, 127}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {20.0, 0.0}, 
      fillColor = {153, 204, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-60.0, -60.0}, {60.0, 60.0}}), Rectangle(origin = {-50.0, 0.0}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-10.0, -60.0}, {10.0, 60.0}}), Rectangle(origin = {90.0, 0.0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), Rectangle(origin = {0.0, 60.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, -10.0}, {40.0, 10.0}}), Polygon(origin = {15.0, -65.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{-65.0, -25.0}, {-55.0, -25.0}, {-25.0, 35.0}, {25.0, 35.0}, {55.0, -25.0}, {65.0, -25.0}, {65.0, -35.0}, {-65.0, -35.0}, {-65.0, -25.0}}), Rectangle(origin = {15.0, -92.5}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-65.0, -7.5}, {65.0, 7.5}}), Rectangle(origin = {90.0, 0.0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-90.0, -30.0}, {90.0, 30.0}}, 
      textString = "永磁同步电机", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  connect(terminalBox.plug_sn, pMSM.plug_sn)
    annotation (Line(origin = {-6.0, 0.0}, 
      points = {{-2.0, -38.0}, {-2.0, -52.0}, {-1.0, -52.0}}, 
      color = {0, 0, 255}));
  connect(terminalBox.plug_sp, pMSM.plug_sp)
    annotation (Line(origin = {7.0, 0.0}, 
      points = {{-1.0, -38.0}, {-1.0, -52.0}, {-2.0, -52.0}}, 
      color = {0, 0, 255}));
  connect(plug_n, terminalBox.plugSupply)
    annotation (Line(origin = {-49.0, 9.0}, 
      points = {{-55.0, -49.0}, {-11.0, -49.0}, {-11.0, -27.0}, {48.0, -27.0}, {48.0, -45.0}}, 
      color = {0, 0, 255}));
  connect(port, pMSM.heatPort)
    annotation (Line(origin = {15.0, 48.0}, 
      points = {{-15.0, 50.0}, {15.0, 50.0}, {15.0, -109.0}, {-1.0, -109.0}}, 
      color = {191, 0, 0}));
  connect(pMSM.flange_a, VCM.flange_a)
    annotation (Line(origin = {34.0, -40.0}, 
      points = {{-20.0, -27.0}, {10.0, -27.0}}, 
      color = {0, 0, 0}));
  connect(VCM.flange_b, flange_a)
    annotation (Line(origin = {86.0, -4.0}, 
      points = {{-16.0, -63.0}, {-4.0, -63.0}, {-4.0, 4.0}, {14.0, 4.0}}, 
      color = {0, 0, 0}));
  connect(VCM.pin_ap, pin_ap)
    annotation (Line(origin = {-22.0, 12.0}, 
      points = {{74.0, -66.0}, {74.0, 28.0}, {-80.0, 28.0}}, 
      color = {0, 0, 255}));
  connect(VCM.pin_an, pin_an)
    annotation (Line(origin = {-17.0, 20.0}, 
      points = {{79.0, -74.0}, {79.0, -20.0}, {-85.0, -20.0}}, 
      color = {0, 0, 255}));
end PMSM;