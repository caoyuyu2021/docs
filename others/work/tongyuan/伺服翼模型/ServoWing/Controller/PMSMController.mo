within ServoWing.Controller;
model PMSMController "永磁同步电机控制器"
  extends Icons.BasicModel;
  //参数
  parameter SI.Time T_PWM = 6.25e-5 "PWM波周期";
  parameter SI.Voltage U_dc = 28 "额定电压";
  parameter Real p = 8 "电机极对数";
  final parameter Real theata_offset = 0;

  parameter Real Kp1 = 10 "比例系数" 
    annotation (Dialog(tab = "电流环参数"));
  parameter Real Ki1 = 4 "积分系数" 
    annotation (Dialog(tab = "电流环参数"));
  parameter Real Kd1 = 0 "微分系数" 
    annotation (Dialog(tab = "电流环参数"));
  parameter Real u_max1 = 100 "d轴,q轴电压指令限幅,V" 
    annotation (Dialog(tab = "电流环参数"));
  parameter SI.Time T1 = 1e-3 "电流环控制周期" 
    annotation (Dialog(tab = "电流环参数"));

  parameter Real Kp2 = 2 "比例系数" 
    annotation (Dialog(tab = "角速度环参数"));
  parameter Real Ki2 = 0.1 "积分系数" 
    annotation (Dialog(tab = "角速度环参数"));
  parameter Real Kd2 = 0 "微分系数" 
    annotation (Dialog(tab = "角速度环参数"));
  parameter Real u_max2 = 10 "交轴电流指令限幅,A" 
    annotation (Dialog(tab = "角速度环参数"));
  parameter SI.Time T2 = 1e-2 "角速度环控制周期" 
    annotation (Dialog(tab = "角速度环参数"));

  parameter Real Kp3 = 1 "比例系数" 
    annotation (Dialog(tab = "位置环参数"));
  parameter Real Ki3 = 0 "积分系数" 
    annotation (Dialog(tab = "位置环参数"));
  parameter Real Kd3 = 0 "微分系数" 
    annotation (Dialog(tab = "位置环参数"));
  parameter Real u_max3 = 5 "角速度指令限幅,rad/s" 
    annotation (Dialog(tab = "位置环参数"));
  parameter SI.Time T3 = 0.01 "位置环控制周期" 
    annotation (Dialog(tab = "位置环参数"));

  parameter Boolean IsUsePosLoop = true "true:位置闭环，false:位置开环（位置闭环反馈断开）" 
    annotation (Dialog(tab = "高级"));


    //变量
  //SI.AngularVelocity w = der_Digtal.y "角速度反馈,rad/s";
  //实例化
  Modelica.Blocks.Interfaces.BooleanOutput pulse[6] "六路开关控制信号" 
    annotation (Placement(transformation(origin = {187.05, 0.284}, 
      extent = {{-7.05, -7.07}, {7.05, 7.07}}), 
      iconTransformation(origin = {110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput phi "角度反馈,rad" 
    annotation (Placement(transformation(origin = {-18.545, 107.335}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0), 
      iconTransformation(origin = {-110.0, 66.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = 360.0)));
  Modelica.Blocks.Interfaces.RealInput i_f[2] "a b相电流,A" 
    annotation (Placement(transformation(origin = {59.46, 109.34}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0), 
      iconTransformation(origin = {-110.0, -54.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = 360.0)));

  Modelica.Blocks.Interfaces.RealInput w_ref "角速度指令,rad/s" 
    annotation (Placement(transformation(origin = {-130.2, 51.5979}, 
      extent = {{-10.2, -10.1879}, {10.2, 10.1879}}), 
      iconTransformation(origin = {-110.0, 24.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Park park
    annotation (Placement(transformation(origin = {121.78999999999999, 30.07}, 
      extent = {{-10.14, -10.14}, {10.14, 10.14}}, 
      rotation = -180.0)));
  Modelica.Blocks.Math.Feedback feedback2
    annotation (Placement(transformation(origin = {-52.0, 6.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Blocks.Sources.Constant i(
    k = 0)
    annotation (Placement(transformation(origin = {-12.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Feedback feedback3
    annotation (Placement(transformation(origin = {16.0, 0.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(origin = {3.9800000000000004, -49.99}, 
      extent = {{-10.0, 10.000000000000004}, {10.0, -10.0}})));
  Modelica.Blocks.Math.Gain gain(
    k = p)
    annotation (Placement(transformation(origin = {67.49, 66.11}, 
      extent = {{-9.499999999999998, -10.0}, {9.5, 10.0}})));
  Components.rPark rpark
    annotation (Placement(transformation(origin = {128.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.SVPWM svpwm(T_PWM = T_PWM, U_dc = U_dc)
    annotation (Placement(transformation(origin = {157.995, 0.024999999999999467}, 
      extent = {{-9.995000000000005, -9.995000000000001}, {9.99499999999999, 9.995000000000001}})));
  Components.DigitalPID_Sat REG1(
    Kp = Kp1, T = T1, Ki = Ki1, 
    I_max = u_max1, 
    Kd = Kd3)

    annotation (Placement(transformation(origin = {41.61, -0.08000000000000007}, 
      extent = {{-10.77, -10.91}, {10.770000000000003, 10.91}})));

  Modelica.Blocks.Math.Feedback feedback4
    annotation (Placement(transformation(origin = {-70.0, -111.985}, 
      extent = {{-10.0, 10.015}, {10.0, -10.015}})));
  Modelica.Blocks.Interfaces.RealInput phi_ref "角度指令,rad" 
    annotation (Placement(transformation(origin = {-130.0, -80.757}, 
      extent = {{-10.0, -10.023}, {10.0, 10.023}}), 
      iconTransformation(origin = {-110.0, -14.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(origin = {29.79, 65.99}, 
      extent = {{-10.0, -9.999999999999993}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(
    k = theata_offset)
    annotation (Placement(transformation(origin = {-9.770000000000003, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Clark3 clark2_1 annotation (Placement(transformation(origin = {152.0, 32.0}, 
    extent = {{10.0, 10.0}, {-10.0, -10.0}})));
  Components.DigitalPID_Sat SpeedRegulator1(
    Kp = Kp2, 
    T = T2, 
    Ki = Ki2, 
    I_max = u_max2, 
    Kd = Kd2)



    annotation (Placement(transformation(origin = {-47.99500000000002, -49.98}, 
      extent = {{-10.004999999999995, -10.0}, {10.005000000000003, 9.999999999999996}})));
  Components.DigitalPID_Sat REG2(Kp = Kp1, 
    T = T1, 
    Ki = Ki1, 
    I_max = u_max1, 
    Kd = Kd3)


    annotation (Placement(transformation(origin = {39.61, -50.08}, 
      extent = {{-10.77, -10.91}, {10.770000000000003, 10.91}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = u_max1)
    annotation (Placement(transformation(origin = {78.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = u_max1)
    annotation (Placement(transformation(origin = {76.0, -50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.DigitalPID_Sat REG3(Kp = Kp3, 
    T = T3, 
    Ki = Ki3, 
    I_max = u_max3, 
    Kd = Kd1)


    annotation (Placement(transformation(origin = {-40.39, -112.08000000000004}, 
      extent = {{-10.77, -10.91}, {10.770000000000003, 10.91}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = u_max3)
    annotation (Placement(transformation(origin = {-4.0, -112.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Interfaces.RealOutput i_d "直轴电流,A" 
    annotation (Placement(transformation(origin = {190.0, -70.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_q "交轴电流,A" 
    annotation (Placement(transformation(origin = {190.0, -92.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.BooleanInput signal "切换信号，false-速度闭环，true-位置闭环" 
    annotation (Placement(transformation(origin = {-130.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {-110.0, -94.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.SignalSwitch signalSwitch
    annotation (Placement(transformation(origin = {-84.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  import SI = Modelica.SIunits;
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = u_max2)
    annotation (Placement(transformation(origin = {-20.0, -50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = if IsUsePosLoop then phi else 0)
    annotation (Placement(transformation(origin = {-93.0, -80.0}, 
      extent = {{-16.0, -15.0}, {16.0, 15.0}}, 
      rotation = 360.0)));
  Modelica.Blocks.Interfaces.RealInput w "角速度反馈,rad/s" 
    annotation (Placement(transformation(origin = {-76.545, 111.335}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0), 
      iconTransformation(origin = {-110.0, 96.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = 360.0)));
equation 
  connect(i.y, feedback3.u1)
    annotation (Line(origin = {-25.5, 0.0}, 
      points = {{25.0, 0.0}, {34.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(park.i_d, feedback3.u2)
    annotation (Line(origin = {2.5, 22.0}, 
      points = {{108.0, 10.0}, {14.0, 10.0}, {14.0, -14.0}}, 
      color = {0, 0, 127}));
  connect(feedback3.y, REG1.u)
    annotation (Line(origin = {7.5, 0.0}, 
      points = {{18.0, 0.0}, {22.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(rpark.U_alpha, svpwm.U_alpha)
    annotation (Line(origin = {137.0, 6.0}, 
      points = {{2.0, -4.0}, {10.0, -4.0}}, 
      color = {0, 0, 127}));
  connect(rpark.U_beta, svpwm.U_beta)
    annotation (Line(origin = {137.0, -6.0}, 
      points = {{2.0, 4.0}, {10.0, 4.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, rpark.theta)
    annotation (Line(origin = {63.5, 38.0}, 
      points = {{14.0, 28.0}, {43.0, 28.0}, {43.0, -34.0}, {54.0, -34.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, park.theta)
    annotation (Line(origin = {69.0, 47.0}, 
      points = {{9.0, 19.0}, {67.0, 19.0}, {67.0, -21.0}, {64.0, -21.0}}, 
      color = {0, 0, 127}));
  connect(park.i_q, feedback1.u2)
    annotation (Line(origin = {-4.5, 1.0}, 
      points = {{115.0, 27.0}, {8.0, 27.0}, {8.0, -43.0}}, 
      color = {0, 0, 127}));

  connect(svpwm.pulse[:], pulse[:])
    annotation (Line(origin = {143.0, 0.0}, 
      points = {{26.0, 0.0}, {44.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(phi, add.u1)
    annotation (Line(origin = {-44.0, 93.5}, 
      points = {{25.0, 14.0}, {25.0, -22.0}, {62.0, -22.0}}, 
      color = {0, 0, 127}));
  connect(add.y, gain.u)
    annotation (Line(origin = {2.5, 70.0}, 
      points = {{38.0, -4.0}, {54.0, -4.0}}, 
      color = {0, 0, 127}));
  connect(const.y, add.u2)
    annotation (Line(origin = {-33.5, 57.0}, 
      points = {{35.0, -7.0}, {44.0, -7.0}, {44.0, 3.0}, {51.0, 3.0}}, 
      color = {0, 0, 127}));
  connect(clark2_1.i_alpha, park.i_alpha)
    annotation (Line(origin = {123.0, 28.0}, 
      points = {{18.0, 2.0}, {10.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(clark2_1.i_beta, park.i_beta)
    annotation (Line(origin = {115.0, 37.0}, 
      points = {{26.0, -3.0}, {18.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(SpeedRegulator1.u, feedback2.y)
    annotation (Line(origin = {-59.0, -22.0}, 
      points = {{0.0, -28.0}, {-4.0, -28.0}, {-4.0, 2.0}, {31.0, 2.0}, {31.0, 28.0}, {16.0, 28.0}}, 
      color = {0, 0, 127}));
  connect(feedback1.y, REG2.u)
    annotation (Line(origin = {9.0, -50.0}, 
      points = {{4.0, 0.0}, {19.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(REG1.y, limiter.u)
    annotation (Line(origin = {49.0, 0.0}, 
      points = {{4.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(REG2.y, limiter1.u)
    annotation (Line(origin = {45.0, -50.0}, 
      points = {{6.0, 0.0}, {19.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(REG3.y, limiter2.u)
    annotation (Line(origin = {-22.0, -112.0}, 
      points = {{-7.0, 0.0}, {6.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(feedback4.y, REG3.u)
    annotation (Line(origin = {-56.0, -112.0}, 
      points = {{-5.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {29.0, -5.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {175, 175, 175}, 
      fillPattern = FillPattern.Solid, 
      points = {{-39.0, -17.0}, {39.0, 39.0}, {39.0, 17.0}, {-39.0, -39.0}, {-39.0, -17.0}}), Polygon(origin = {8.0, -28.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {20.0, -37.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 1.0}, {2.0, 7.0}, {6.0, -1.0}, {-2.0, -7.0}, {-6.0, 1.0}}), Polygon(origin = {22.0, -52.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 8.0}, {4.0, 14.0}, {4.0, -8.0}, {-4.0, -14.0}, {-4.0, 8.0}}), Polygon(origin = {6.0, -46.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, 20.0}, {8.0, 10.0}, {12.0, 2.0}, {12.0, -20.0}, {10.0, -20.0}, {10.0, 2.0}, {8.0, 6.0}, {-12.0, 16.0}, {-12.0, 20.0}}), Polygon(origin = {-19.0, 56.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-1.0, 2.0}, {-5.0, -6.0}, {3.0, 0.0}, {5.0, 6.0}, {-1.0, 2.0}}), Polygon(origin = {-20.0, 41.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 9.0}, {4.0, 15.0}, {4.0, -9.0}, {-4.0, -15.0}, {-4.0, 9.0}}), Polygon(origin = {-14.0, 42.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, -14.0}, {-12.0, 8.0}, {-8.0, 16.0}, {12.0, 6.0}, {12.0, 2.0}, {-8.0, 12.0}, {-10.0, 8.0}, {-10.0, -16.0}, {-12.0, -14.0}}), Polygon(origin = {-8.0, 56.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {28.0, -12.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {40.0, -21.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 1.0}, {2.0, 7.0}, {6.0, -1.0}, {-2.0, -7.0}, {-6.0, 1.0}}), Polygon(origin = {42.0, -36.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 8.0}, {4.0, 14.0}, {4.0, -8.0}, {-4.0, -14.0}, {-4.0, 8.0}}), Polygon(origin = {26.0, -30.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, 20.0}, {8.0, 10.0}, {12.0, 2.0}, {12.0, -20.0}, {10.0, -20.0}, {10.0, 2.0}, {8.0, 6.0}, {-12.0, 16.0}, {-12.0, 20.0}}), Polygon(origin = {48.0, 2.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {60.0, -7.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 1.0}, {2.0, 7.0}, {6.0, -1.0}, {-2.0, -7.0}, {-6.0, 1.0}}), Polygon(origin = {62.0, -22.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 8.0}, {4.0, 14.0}, {4.0, -8.0}, {-4.0, -14.0}, {-4.0, 8.0}}), Polygon(origin = {46.0, -16.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, 20.0}, {8.0, 10.0}, {12.0, 2.0}, {12.0, -20.0}, {10.0, -20.0}, {10.0, 2.0}, {8.0, 6.0}, {-12.0, 16.0}, {-12.0, 20.0}}), Polygon(origin = {68.0, 16.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {80.0, 7.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 1.0}, {2.0, 7.0}, {6.0, -1.0}, {-2.0, -7.0}, {-6.0, 1.0}}), Polygon(origin = {82.0, -8.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 8.0}, {4.0, 14.0}, {4.0, -8.0}, {-4.0, -14.0}, {-4.0, 8.0}}), Polygon(origin = {66.0, -2.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, 20.0}, {8.0, 10.0}, {12.0, 2.0}, {12.0, -20.0}, {10.0, -20.0}, {10.0, 2.0}, {8.0, 6.0}, {-12.0, 16.0}, {-12.0, 20.0}}), Polygon(origin = {-39.0, 42.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-1.0, 2.0}, {-5.0, -6.0}, {3.0, 0.0}, {5.0, 6.0}, {-1.0, 2.0}}), Polygon(origin = {-40.0, 27.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 9.0}, {4.0, 15.0}, {4.0, -9.0}, {-4.0, -15.0}, {-4.0, 9.0}}), Polygon(origin = {-34.0, 28.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, -14.0}, {-12.0, 8.0}, {-8.0, 16.0}, {12.0, 6.0}, {12.0, 2.0}, {-8.0, 12.0}, {-10.0, 8.0}, {-10.0, -16.0}, {-12.0, -14.0}}), Polygon(origin = {-28.0, 42.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {-59.0, 28.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-1.0, 2.0}, {-5.0, -6.0}, {3.0, 0.0}, {5.0, 6.0}, {-1.0, 2.0}}), Polygon(origin = {-60.0, 13.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 9.0}, {4.0, 15.0}, {4.0, -9.0}, {-4.0, -15.0}, {-4.0, 9.0}}), Polygon(origin = {-54.0, 14.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, -14.0}, {-12.0, 8.0}, {-8.0, 16.0}, {12.0, 6.0}, {12.0, 2.0}, {-8.0, 12.0}, {-10.0, 8.0}, {-10.0, -16.0}, {-12.0, -14.0}}), Polygon(origin = {-48.0, 28.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {-79.0, 12.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-1.0, 2.0}, {-5.0, -6.0}, {3.0, 0.0}, {5.0, 6.0}, {-1.0, 2.0}}), Polygon(origin = {-80.0, -3.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 127}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, 9.0}, {4.0, 15.0}, {4.0, -9.0}, {-4.0, -15.0}, {-4.0, 9.0}}), Polygon(origin = {-74.0, -2.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {191, 191, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-12.0, -14.0}, {-12.0, 8.0}, {-8.0, 16.0}, {12.0, 6.0}, {12.0, 2.0}, {-8.0, 12.0}, {-10.0, 8.0}, {-10.0, -16.0}, {-12.0, -14.0}}), Polygon(origin = {-68.0, 12.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-6.0, 8.0}, {14.0, -2.0}, {6.0, -8.0}, {-14.0, 2.0}, {-6.0, 8.0}}), Polygon(origin = {-40.0, -17.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {75, 75, 75}, 
      fillPattern = FillPattern.Solid, 
      points = {{-30.0, 27.0}, {30.0, -5.0}, {30.0, -27.0}, {-30.0, 5.0}, {-30.0, 27.0}}), Polygon(origin = {-1.0, 22.0}, 
      lineColor = {95, 95, 95}, 
      fillColor = {160, 160, 164}, 
      fillPattern = FillPattern.Solid, 
      points = {{-69.0, -12.0}, {-9.0, -44.0}, {69.0, 12.0}, {9.0, 44.0}, {-69.0, -12.0}}), Text(origin = {-82.0, 68.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "phi", 
      textStyle = {TextStyle.None}), Text(origin = {-84.0, -54.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "i_f", 
      textStyle = {TextStyle.None}), Text(origin = {-74.0, 24.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "w_ref", 
      textStyle = {TextStyle.None}), Text(origin = {-68.0, -14.0}, 
      extent = {{-35.0, 10.0}, {35.0, -10.0}}, 
      textString = "phi_ref", 
      textStyle = {TextStyle.None}), Text(origin = {74.0, 42.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "pulse", 
      textStyle = {TextStyle.None}), Text(origin = {82.0, 0.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "i_d", 
      textStyle = {TextStyle.None}), Text(origin = {80.0, -36.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "i_q", 
      textStyle = {TextStyle.None}), Text(origin = {-72.0, -92.0}, 
      extent = {{-25.0, 10.0}, {25.0, -10.0}}, 
      textString = "signal", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-45.0, 30.0}, {45.0, -30.0}}, 
      textString = "控制器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-86.0, 98.0}, 
      extent = {{-15.0, 10.0}, {15.0, -10.0}}, 
      textString = "w", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-120.0, -140.0}, {180.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-19.0, 121.0}, 
      extent = {{-19.0, 3.0}, {19.0, -3.0}}, 
      textString = "角度反馈,rad", 
      textStyle = {TextStyle.None}), Text(origin = {63.0, 119.0}, 
      extent = {{-15.0, 3.0}, {15.0, -3.0}}, 
      textString = "a b相电流,A", 
      textStyle = {TextStyle.None}), Text(origin = {-128.0, 69.0}, 
      extent = {{-20.0, 5.0}, {20.0, -5.0}}, 
      textString = "角速度指令,rad/s", 
      textStyle = {TextStyle.None}), Text(origin = {-127.0, -95.0}, 
      extent = {{-17.0, 5.0}, {17.0, -5.0}}, 
      textString = "角度指令,rad", 
      textStyle = {TextStyle.None}), Text(origin = {-129.0, -36.0}, 
      extent = {{-35.0, 10.0}, {35.0, -10.0}}, 
      textString = "切换信号，
false-速度闭环，true-位置闭环", 
      textStyle = {TextStyle.None}), Text(origin = {191.0, -13.0}, 
      extent = {{-17.0, 3.0}, {17.0, -3.0}}, 
      textString = "六路开关控制信号", 
      textStyle = {TextStyle.None}), Text(origin = {215.0, -69.0}, 
      extent = {{-15.0, 3.0}, {15.0, -3.0}}, 
      textString = "直轴电流,A", 
      textStyle = {TextStyle.None}), Text(origin = {215.0, -91.0}, 
      extent = {{-15.0, 3.0}, {15.0, -3.0}}, 
      textString = "交轴电流,A", 
      textStyle = {TextStyle.None}), Text(origin = {-21.0, -32.0}, 
      extent = {{-15.0, 4.0}, {15.0, -4.0}}, 
      textString = "交轴电流指令,A", 
      textStyle = {TextStyle.None}), Text(origin = {-11.0, 19.0}, 
      extent = {{-11.0, 3.0}, {11.0, -3.0}}, 
      textString = "直轴电流指令,A", 
      textStyle = {TextStyle.None}), Text(origin = {-47.0, 29.0}, 
      extent = {{-11.0, 3.0}, {11.0, -3.0}}, 
      textString = "角速度反馈,rad/s", 
      textStyle = {TextStyle.None}), Text(origin = {-63.0, 13.0}, 
      extent = {{-11.0, 3.0}, {11.0, -3.0}}, 
      textString = "角速度指令,rad/s", 
      textStyle = {TextStyle.None}), Text(origin = {-69.0, -95.0}, 
      extent = {{-11.0, 3.0}, {11.0, -3.0}}, 
      textString = "角度反馈,rad", 
      textStyle = {TextStyle.None}), Text(origin = {75.0, 36.0}, 
      extent = {{-17.0, 4.0}, {17.0, -4.0}}, 
      textString = "直轴电流反馈电流,A", 
      textStyle = {TextStyle.None}), Text(origin = {71.0, 24.0}, 
      extent = {{-17.0, 4.0}, {17.0, -4.0}}, 
      textString = "交轴电流反馈电流,A", 
      textStyle = {TextStyle.None}), Text(origin = {-75.0, 119.0}, 
      extent = {{-19.0, 3.0}, {19.0, -3.0}}, 
      textString = "角速度反馈,rad/s", 
      textStyle = {TextStyle.None})}));
  connect(signalSwitch.w_ref_out, feedback2.u1)
    annotation (Line(origin = {-69.0, 6.0}, 
      points = {{-4.0, 0.0}, {9.0, 0.0}}, 
      color = {0, 0, 127}));



  connect(signal, signalSwitch.signal)
    annotation (Line(origin = {-112.0, -9.0}, 
      points = {{-18.0, -11.0}, {2.0, -11.0}, {2.0, 11.0}, {17.0, 11.0}}, 
      color = {255, 0, 255}));
  connect(limiter.y, rpark.U_d)
    annotation (Line(origin = {99.0, 0.0}, 
      points = {{-10.0, 0.0}, {18.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(limiter1.y, rpark.U_q)
    annotation (Line(origin = {98.0, -26.0}, 
      points = {{-11.0, -24.0}, {10.0, -24.0}, {10.0, 22.0}, {19.0, 22.0}}, 
      color = {0, 0, 127}));
  connect(w_ref, signalSwitch.w_ref_in)
    annotation (Line(origin = {-112.0, 31.0}, 
      points = {{-18.0, 21.0}, {6.0, 21.0}, {6.0, -21.0}, {17.0, -21.0}}, 
      color = {0, 0, 127}));
  connect(phi_ref, feedback4.u1)
    annotation (Line(origin = {-104.0, -96.0}, 
      points = {{-26.0, 15.0}, {-16.0, 15.0}, {-16.0, -16.0}, {26.0, -16.0}}, 
      color = {0, 0, 127}));



  connect(park.i_d, i_d)
    annotation (Line(origin = {142.0, -19.0}, 
      points = {{-31.0, 51.0}, {-48.0, 51.0}, {-48.0, -51.0}, {48.0, -51.0}}, 
      color = {0, 0, 127}));
  connect(park.i_q, i_q)
    annotation (Line(origin = {146.0, -32.0}, 
      points = {{-35.0, 60.0}, {-44.0, 60.0}, {-44.0, -60.0}, {44.0, -60.0}}, 
      color = {0, 0, 127}));
  connect(i_f[1], clark2_1.i_a)
    annotation (Line(origin = {116.0, 69.0}, 
      points = {{-57.0, 40.0}, {-57.0, 15.0}, {56.0, 15.0}, {56.0, -39.0}, {47.0, -39.0}}, 
      color = {0, 0, 127}));
  connect(i_f[2], clark2_1.i_b)
    annotation (Line(origin = {116.0, 71.0}, 
      points = {{-57.0, 38.0}, {-57.0, 13.0}, {56.0, 13.0}, {56.0, -39.0}, {47.0, -39.0}}, 
      color = {0, 0, 127}));
  connect(limiter2.y, signalSwitch.w_ref_phi_in)
    annotation (Line(origin = {-43.0, -53.0}, 
      points = {{50.0, -59.0}, {63.0, -59.0}, {63.0, -13.0}, {-63.0, -13.0}, {-63.0, 59.0}, {-52.0, 59.0}}, 
      color = {0, 0, 127}));
  connect(SpeedRegulator1.y, limiter3.u)
    annotation (Line(origin = {-34.0, -50.0}, 
      points = {{-3.0, 0.0}, {2.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(limiter3.y, feedback1.u1)
    annotation (Line(origin = {-6.0, -50.0}, 
      points = {{-3.0, 0.0}, {2.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, feedback4.u2)
    annotation (Line(origin = {-72.0, -92.0}, 
      points = {{-3.0, 12.0}, {2.0, 12.0}, {2.0, -12.0}}, 
      color = {0, 0, 127}));
  connect(w, feedback2.u2)
    annotation (Line(origin = {-64.0, 63.0}, 
      points = {{-13.0, 48.0}, {-13.0, 1.0}, {12.0, 1.0}, {12.0, -49.0}}, 
      color = {0, 0, 127}));
end PMSMController;