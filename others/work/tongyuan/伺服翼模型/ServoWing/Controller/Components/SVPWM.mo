within ServoWing.Controller.Components;
model SVPWM "矢量空间PWM波模块"
  extends Icons.BasicModel;
  //参数
  parameter Modelica.SIunits.Time T_PWM = 0.000125 "PWM波周期";
  parameter Modelica.SIunits.Voltage U_dc = 28.6 "额定电压";
  //实例化
  Modelica.Blocks.Sources.Constant Ux(
    k = U_dc)
    annotation (extent = [-82, 20; -66, 36], 
      Placement(transformation(origin = {-76.0, 28.0}, 
        extent = {{-8.0, -8.0}, {8.0, 8.0}})));
  Modelica.Blocks.Sources.Constant T(
    k = T_PWM)
    annotation (extent = [-83, 74; -67, 89]);
  Modelica.Blocks.Interfaces.BooleanOutput pulse[6]
    annotation (extent = [98, -10; 118, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Logical.Not not1[3]
    annotation (extent = [68, 14; 78, 24], 
      Placement(transformation(origin = {85.0, 21.0}, 
        extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Interfaces.RealInput U_beta
    annotation (extent = [-100, -50; -80, -30], 
      Placement(transformation(origin = {-110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput U_alpha
    annotation (extent = [-102, 31; -82, 49], 
      Placement(transformation(origin = {-110.0, 20.0}, 
        extent = {{-10.0, -9.0}, {10.0, 9.0}})));
  Controller.Components.ab_N ab_n
    annotation (extent = [-51, 2; -31, 21]);
  Controller.Components.abTU_XYZ abtu_xyz
    annotation (extent = [-54, 41; -34, 61], 
      Placement(transformation(origin = {-42.0, 51.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.NXYZ_T1T2 nxyz_t1t2_1
    annotation (extent = [-24, 41; -5, 61]);
  Controller.Components.T1T2_Tabc t1t2_tabc
    annotation (extent = [7, 41; 27, 61]);
  Controller.Components.Tabc_Tcm tabc_tcm
    annotation (extent = [40, 41; 60, 61]);
  Controller.Components.PWM pwm(
    T_PWM = T_PWM)
    annotation (extent = [71, 41; 91, 61]);
equation 
  connect(not1[:].y, pulse[4:6])
    annotation (points = [79, 19; 108, 19; 108, -0], 
      style(rgbcolor = {255, 0, 255}), 
      Line(origin = {93.5, 9.5}, 
        points = {{-3.0, 12.0}, {6.0, 12.0}, {6.0, -10.0}, {17.0, -10.0}}, 
        color = {255, 0, 255}));
  connect(Ux.y, abtu_xyz.Ux)
    annotation (points = [-66, 28; -60, 28; -60, 45; -54, 45], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-60.0, 36.5}, 
        points = {{-7.0, -9.0}, {0.0, -9.0}, {0.0, 9.0}, {7.0, 9.0}}, 
        color = {0, 0, 127}));
  connect(U_beta, ab_n.U_beta)
    annotation (points = [-90, -40; -66, -40; -66, 7; -51, 7], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-70.5, -16.5}, 
        points = {{-40.0, -24.0}, {8.0, -24.0}, {8.0, 23.0}, {19.0, 23.0}}, 
        color = {0, 0, 127}));
  connect(ab_n.U_alpha, U_alpha)
    annotation (points = [-51, 16; -92, 16; -92, 40], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-71.5, 28.0}, 
        points = {{31.0, -17.0}, {-23.0, -17.0}, {-23.0, 12.0}, {-39.0, 12.0}}, 
        color = {0, 0, 127}));
  connect(T.y, abtu_xyz.T)
    annotation (points = [-66, 82; -60, 82; -60, 49; -54, 49], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-60.0, 65.5}, 
        points = {{-6.0, 16.0}, {0.0, 16.0}, {0.0, -17.0}, {8.0, -17.0}}, 
        color = {0, 0, 127}));
  connect(U_alpha, abtu_xyz.U_alpha)
    annotation (points = [-92, 40; -63, 40; -63, 57; -54, 57], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-73.0, 48.5}, 
        points = {{-37.0, -9.0}, {-21.0, -9.0}, {-21.0, 9.0}, {20.0, 9.0}}, 
        color = {0, 0, 127}));
  connect(U_beta, abtu_xyz.U_beta)
    annotation (points = [-90, -40; -62, -40; -62, 53; -54, 53], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-72.0, 6.5}, 
        points = {{-38.0, -47.0}, {10.0, -47.0}, {10.0, 47.0}, {19.0, 47.0}}, 
        color = {0, 0, 127}));
  connect(abtu_xyz.X, nxyz_t1t2_1.X)
    annotation (points = [-34, 57; -28, 57; -28, 59; -24, 59], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-29.0, 58.0}, 
        points = {{-3.0, -1.0}, {1.0, -1.0}, {1.0, 1.0}, {5.0, 1.0}}, 
        color = {0, 0, 127}));
  connect(abtu_xyz.Y, nxyz_t1t2_1.Y)
    annotation (points = [-34, 51; -28, 51; -28, 55; -24, 55], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-29.0, 53.0}, 
        points = {{-3.0, -2.0}, {1.0, -2.0}, {1.0, 2.0}, {5.0, 2.0}}, 
        color = {0, 0, 127}));
  connect(abtu_xyz.Z, nxyz_t1t2_1.Z)
    annotation (points = [-34, 45; -26, 45; -26, 51; -24, 51], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-29.0, 48.0}, 
        points = {{-2.0, -3.0}, {1.0, -3.0}, {1.0, 3.0}, {4.0, 3.0}}, 
        color = {0, 0, 127}));
  connect(nxyz_t1t2_1.T, T.y)
    annotation (points = [-24, 47; -32, 47; -32, 82; -66, 82], 
      style(rgbcolor = {0, 0, 127}), 
      Line(origin = {-45.0, 64.5}, 
        points = {{20.0, -18.0}, {17.0, -18.0}, {17.0, 17.0}, {-21.0, 17.0}}, 
        color = {0, 0, 127}));
  connect(ab_n.N, nxyz_t1t2_1.N)
    annotation (points = [-31, 12; -28, 12; -28, 43; -24, 43], 
      style(rgbcolor = {255, 127, 0}));
  connect(nxyz_t1t2_1.T1, t1t2_tabc.T1)
    annotation (points = [-5, 56; 7, 56], 
      style(rgbcolor = {0, 0, 127}));
  connect(nxyz_t1t2_1.T2, t1t2_tabc.T2)
    annotation (points = [-5, 46; 7, 46], 
      style(rgbcolor = {0, 0, 127}));
  connect(t1t2_tabc.T, T.y)
    annotation (points = [7, 51; 0, 51; 0, 82; -66, 82], 
      style(rgbcolor = {0, 0, 127}));
  connect(t1t2_tabc.Ta, tabc_tcm.Ta)
    annotation (points = [27, 56; 40, 56; 40, 57], 
      style(rgbcolor = {0, 0, 127}));
  connect(t1t2_tabc.Tb, tabc_tcm.Tb)
    annotation (points = [27, 51; 40, 51; 40, 53], 
      style(rgbcolor = {0, 0, 127}));
  connect(t1t2_tabc.Tc, tabc_tcm.Tc)
    annotation (points = [27, 46; 34, 46; 34, 49; 40, 49], 
      style(rgbcolor = {0, 0, 127}));
  connect(ab_n.N, tabc_tcm.N)
    annotation (points = [-31, 12; 36, 12; 36, 45; 40, 45], 
      style(rgbcolor = {255, 127, 0}));
  connect(tabc_tcm.Tcm1, pwm.Tcm1)
    annotation (points = [60, 57; 72, 57], 
      style(rgbcolor = {0, 0, 127}));
  connect(tabc_tcm.Tcm2, pwm.Tcm2)
    annotation (points = [60, 51; 72, 51], 
      style(rgbcolor = {0, 0, 127}));
  connect(tabc_tcm.Tcm3, pwm.Tcm3)
    annotation (points = [60, 45; 72, 45], 
      style(rgbcolor = {0, 0, 127}));
  connect(pwm.On[:], not1[:].u)
    annotation (points = [90, 51; 98, 51; 98, 32; 67, 32; 67, 19], 
      style(rgbcolor = {255, 0, 255}), 
      Line(origin = {82.5, 35.0}, 
        points = {{10.0, 16.0}, {16.0, 16.0}, {16.0, -3.0}, {-10.0, -3.0}, {-10.0, -14.0}, {-4.0, -14.0}}, 
        color = {255, 0, 255}));
  connect(pwm.On[:], pulse[1:3])
    annotation (points = [90, 51; 108, 51; 108, -0], 
      style(rgbcolor = {255, 0, 255}), 
      Line(origin = {99.0, 25.5}, 
        points = {{-7.0, 26.0}, {1.0, 26.0}, {1.0, -26.0}, {11.0, -26.0}}, 
        color = {255, 0, 255}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {0.7000000000000028, -0.10000000000000142}, 
      points = {{0.004299999999997195, -84.02000000000001}, {-45.830000000000005, -84.02000000000001}, {-99.3, 0.0003300000000014264}, {-45.830000000000005, 84.02000000000001}, {45.839999999999996, 84.02000000000001}, {99.3, 0.0003300000000014264}, {45.839999999999996, -84.02000000000001}, {0.004299999999997195, -84.02000000000001}}), Line(origin = {0.7049999999999983, -0.10000000000000142}, 
      points = {{-45.835, 84.02000000000001}, {45.835, -84.02000000000001}}, 
      arrow = {Arrow.Filled, Arrow.Filled}), Line(origin = {0.7049999999999983, -0.10000000000000142}, 
      points = {{45.835, 84.02000000000001}, {-45.835, -84.02000000000001}}, 
      arrow = {Arrow.Filled, Arrow.Filled}), Line(origin = {25.8278, 13.464465}, 
      points = {{-24.8522, -13.515535}, {24.8522, 13.515535}}, 
      color = {255, 0, 255}, 
      thickness = 0.5, 
      arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.7000000000000028, -0.09967}, 
      points = {{-99.3, 0.0}, {99.3, 0.0}}, 
      arrow = {Arrow.Filled, Arrow.Filled}), Text(origin = {-86.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uα", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-85.0, -25.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uβ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {76.0, 0.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "pulse", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-90.0, 30.0}, {90.0, -30.0}}, 
      textString = "矢量空间PWM", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end SVPWM;