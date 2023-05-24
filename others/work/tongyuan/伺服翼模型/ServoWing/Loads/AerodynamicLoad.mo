within ServoWing.Loads;
model AerodynamicLoad "气动力载荷"
  extends Icons.BasicModel;
  //参数
  parameter SI.Area S = 1 "特征面积" 
    annotation (Dialog(group = "气动参数"));
  parameter SI.Length L = 1 "特征长度" 
    annotation (Dialog(group = "气动参数"));
  //变量    
  Real Cxyz[3] "气动力系数";
  Real Mrxyz[3] "气动力矩系数";
  SI.Velocity V "速度大小";
  SI.Pressure q "动压头";
  SI.Force F[3] "气动力";
  SI.Angle Aoa "攻角";
  Real Aoa_limit "攻角";

  //实例化
  Interfaces.BlockInterfaces.RealOutput AeroTorque[3](unit = "N.m") "气动力矩" 
    annotation (Placement(transformation(origin = {110.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-38.0, 68.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Line(origin = {-38.0, 38.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Line(origin = {-38.0, 8.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Line(origin = {36.0, -6.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Line(origin = {36.0, -36.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Line(origin = {36.0, -66.0}, 
      points = {{-50.0, -30.0}, {-20.0, 10.0}, {20.0, -10.0}, {50.0, 30.0}}, 
      color = {75, 0, 130}, 
      thickness = 1.0, 
      smooth = Smooth.Bezier), Text(origin = {62.0, 40.0}, 
      extent = {{-30.0, 20.0}, {30.0, -20.0}}, 
      textString = "Torque", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}), Text(origin = {64.0, -36.0}, 
      extent = {{-25.0, 20.0}, {25.0, -20.0}}, 
      textString = "Force", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}), Text(origin = {0.0, 120.0}, 
      extent = {{60.0, -25.0}, {-60.0, 25.0}}, 
      textString = "%name", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}), Text(origin = {0.0, -120.0}, 
      extent = {{120.0, -40.0}, {-120.0, 40.0}}, 
      textString = "气动力/力矩", 
      fontName = "微软雅黑 Light", 
      textStyle = {TextStyle.Bold})}));
  Interfaces.BlockInterfaces.RealOutput AeroForce[3](unit = "N") "气动力" 
    annotation (Placement(transformation(origin = {110.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.BlockInterfaces.RealInput indata[7] "插值输入" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.C_BADEGHJTablefun_Opt c_BADEGHJTablefun_Opt
    annotation (Placement(transformation(origin = {-24.000000000000004, 0.0}, 
      extent = {{-36.0, -36.0}, {36.0, 36.0}})));
equation 
  //速度大小计算
  V = Modelica.Math.Vectors.length(INVelocity);
  //气动力系数
  Cxyz = c_BADEGHJTablefun_Opt[1:3];
  //气动力矩系数
  Mrxyz[1] = c_BADEGHJTablefun_Opt[4:6];
  //动压头计算
  q = 1 / 2 * AirDensity * V ^ 2;
  //气动力计算
  F = Cxyz * q * S;
  // F[2] = - AirDensity * INVelocity[2] ^ 5 * S;// Cxyz[2]
  // F[3] = Cxyz[3] * q * S;
  F = AeroForce;
  //气动力矩计算
  AeroTorque = Mrxyz * q * S * L;

  // AeroTorque[3] = 0.12 * RudderAngle ^ 3;
  connect(indata[1], c_BADEGHJTablefun_Opt.B)
    annotation (Line(origin = {-83.0, 18.0}, 
      points = {{-27.0, -18.0}, {3.0, -18.0}, {3.0, 14.0}, {19.0, 14.0}}, 
      color = {0, 0, 127}));
  connect(indata[2], c_BADEGHJTablefun_Opt.A)
    annotation (Line(origin = {-83.0, 13.0}, 
      points = {{-27.0, -13.0}, {3.0, -13.0}, {3.0, 9.0}, {19.0, 9.0}}, 
      color = {0, 0, 127}));
  connect(indata[3], c_BADEGHJTablefun_Opt.D)
    annotation (Line(origin = {-83.0, 8.0}, 
      points = {{-27.0, -8.0}, {3.0, -8.0}, {3.0, 3.0}, {19.0, 3.0}}, 
      color = {0, 0, 127}));
  connect(indata[4], c_BADEGHJTablefun_Opt.E)
    annotation (Line(origin = {-83.0, 3.0}, 
      points = {{-27.0, -3.0}, {19.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(indata[5], c_BADEGHJTablefun_Opt.G)
    annotation (Line(origin = {-83.0, -2.0}, 
      points = {{-27.0, 2.0}, {3.0, 2.0}, {3.0, -9.0}, {19.0, -9.0}}, 
      color = {0, 0, 127}));
  connect(indata[6], c_BADEGHJTablefun_Opt.H)
    annotation (Line(origin = {-83.0, -7.0}, 
      points = {{-27.0, 7.0}, {3.0, 7.0}, {3.0, -15.0}, {19.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(indata[7], c_BADEGHJTablefun_Opt.J)
    annotation (Line(origin = {-83.0, -12.0}, 
      points = {{-27.0, 12.0}, {3.0, 12.0}, {3.0, -20.0}, {19.0, -20.0}}, 
      color = {0, 0, 127}));
end AerodynamicLoad;