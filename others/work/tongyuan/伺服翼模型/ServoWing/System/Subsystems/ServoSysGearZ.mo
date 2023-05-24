within ServoWing.System.Subsystems;
model ServoSysGearZ
  annotation (Diagram(coordinateSystem(extent = {{-280.0, -200.0}, {300.0, 160.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {-228.0, -46.0}, 
    extent = {{-20.0, 6.0}, {20.0, -6.0}}, 
    textString = "0~1.57rad", 
    textStyle = {TextStyle.None}), Text(origin = {-144.0, -12.0}, 
    extent = {{-20.0, 6.0}, {20.0, -6.0}}, 
    textString = "0~4deg", 
    textStyle = {TextStyle.None})}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Bitmap(origin = {0.0, 0.0}, 
      extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      fileName = "modelica://ServoWing/Pictures/永磁同步电机.svg"), Text(origin = {0.0, -120.0}, 
      extent = {{-60.0, 15.0}, {60.0, -15.0}}, 
      textString = "伺服系统", 
      textStyle = {TextStyle.None})}));


  ThermalSystem thermalSystem
    annotation (Placement(transformation(origin = {12.0, 14.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  ElectricalSystem electricalSystem(U_dc = 220)
    annotation (Placement(transformation(origin = {-58.0, -14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  PMSM pMSM(J_Rotor = 45e-6, p = 2, Rs = 0.06, Lssigma = 4e-5, Lmd = 0.16e-3, Lmq = 0.16e-3, 
    terminalConnection = "Y", torque_max = 1.2, Va = 220) annotation (Placement(transformation(origin = {-20.0, -14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  MeasureSystem measureSystem
    annotation (Placement(transformation(origin = {134.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.PMSMControllerX controlSystem(Kp3 = 2142 * 180 / pi, 
    p = 2, 
    U_dc = 220, T_PWM = 1e-4, Kp1 = 2.607, Ki1 = 0, T1 = 1e-5, Kp2 = 0.456, Ki2 = 0.01, T2 = 1e-4, u_max3 = 18000 * 2 * pi / 60, u_max2 = 120, 
    T3 = 0.001, 
    u_max1 = 220, 
    u_max4 = 8.5 / 180 * pi)

    annotation (Placement(transformation(origin = {-96.0, -18.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = true)
    annotation (Placement(transformation(origin = {-140.0, -28.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Sources.Constant const2(k = 0)
    annotation (Placement(transformation(origin = {-143.0, 5.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  MechanicsSystem2 mechanicsSystem2_1(
    zA1 = 17, zB1 = 57, 
    zA2 = 1, zB2 = 1, 
    s0_start = 0, 
    Ph = 40)

    annotation (Placement(transformation(origin = {55.00000000000006, -12.999999999999979}, 
      extent = {{-11.0, -11.0}, {11.0, 11.0}})));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 57.3 * 10 / 536 / 4)
    annotation (Placement(transformation(origin = {-54.0, 58.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / 57.3 * 10 / 4)
    annotation (Placement(transformation(origin = {-173.0, -19.0}, 
      extent = {{-9.0, -9.0}, {9.0, 9.0}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(origin = {82.0, 34.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {200.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {100.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput u "Input signal connector" 
    annotation (Placement(transformation(origin = {-240.0, -20.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}}), 
      iconTransformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(thermalSystem.port, pMSM.port)
    annotation (Line(origin = {-27.0, 26.0}, 
      points = {{29.0, -12.0}, {7.0, -12.0}, {7.0, -30.0}}, 
      color = {191, 0, 0}));
  connect(electricalSystem.plug_n, measureSystem.plug_p)
    annotation (Line(origin = {-2.0, -5.0}, 
      points = {{-46.0, -13.0}, {-46.0, -41.0}, {126.0, -41.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.plug_n, pMSM.plug_n)
    annotation (Line(origin = {-24.0, -31.0}, 
      points = {{148.0, -11.0}, {-10.0, -11.0}, {-10.0, 13.0}, {-6.0, 13.0}}, 
      color = {0, 0, 255}));
  connect(electricalSystem.pin_ap, pMSM.pin_ap)
    annotation (Line(origin = {-50.0, -10.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(electricalSystem.pin_an, pMSM.pin_an)
    annotation (Line(origin = {-50.0, -14.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.i, controlSystem.i_f)
    annotation (Line(origin = {-14.0, 13.0}, 
      points = {{159.0, -55.0}, {164.0, -55.0}, {164.0, -71.0}, {-100.0, -71.0}, {-100.0, -36.0}, {-93.0, -36.0}}, 
      color = {0, 0, 127}));
  connect(controlSystem.pulse, electricalSystem.pulse)
    annotation (Line(origin = {-77.0, -14.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, controlSystem.signal)
    annotation (Line(origin = {-126.0, -25.0}, 
      points = {{-9.0, -3.0}, {25.0, -3.0}, {25.0, -2.0}, {19.0, -2.0}}, 
      color = {255, 0, 255}));
  connect(measureSystem.w, controlSystem.w)
    annotation (Line(origin = {29.0, -31.0}, 
      points = {{116.0, -15.0}, {119.0, -15.0}, {119.0, -23.0}, {-151.0, -23.0}, {-151.0, 23.0}, {-136.0, 23.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, measureSystem.flange_a)
    annotation (Line(origin = {27.0, -25.0}, 
      points = {{-37.0, 11.0}, {-21.0, 11.0}, {-21.0, -13.0}, {97.0, -13.0}}));
  connect(const2.y, controlSystem.w_ref)
    annotation (Line(origin = {-139.0, -10.0}, 
      points = {{2.0, 15.0}, {13.0, 15.0}, {13.0, -6.0}, {32.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(measureSystem.phi, controlSystem.phi)
    annotation (Line(origin = {18.0, -36.0}, 
      points = {{127.0, -2.0}, {136.0, -2.0}, {136.0, -26.0}, {-136.0, -26.0}, {-136.0, 25.0}, {-125.0, 25.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, mechanicsSystem2_1.flange_a)
    annotation (Line(origin = {21.0, -13.0}, 
      points = {{-31.0, -1.0}, {19.0, -1.0}, {19.0, 0.0}, {23.0, 0.0}}));
  connect(mechanicsSystem2_1.flange_t, measureSystem.flange_a1)
    annotation (Line(origin = {101.0, -23.0}, 
      points = {{-35.0, 10.0}, {-3.0, 10.0}, {-3.0, -11.0}, {23.0, -11.0}}, 
      color = {0, 127, 0}));
  connect(gain1.y, controlSystem.phi_pg)
    annotation (Line(origin = {-39.0, 37.0}, 
      points = {{-26.0, 21.0}, {-79.0, 21.0}, {-79.0, -42.0}, {-68.0, -42.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, controlSystem.phi_ref)
    annotation (Line(origin = {-137.0, -53.0}, 
      points = {{-26.0, 34.0}, {30.0, 34.0}}, 
      color = {0, 0, 127}));
  connect(angleSensor.flange, mechanicsSystem2_1.flange_a)
    annotation (Line(origin = {50.0, 10.0}, 
      points = {{22.0, 24.0}, {-22.0, 24.0}, {-22.0, -24.0}, {-10.0, -24.0}, {-10.0, -23.0}, {-6.0, -23.0}}, 
      color = {0, 0, 0}));
  connect(angleSensor.phi, gain1.u)
    annotation (Line(origin = {31.0, 46.0}, 
      points = {{62.0, -12.0}, {73.0, -12.0}, {73.0, 12.0}, {-73.0, 12.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, flange_a)
    annotation (Line(origin = {144.0, -7.0}, 
      points = {{-154.0, -7.0}, {-116.0, -7.0}, {-116.0, 7.0}, {56.0, 7.0}}, 
      color = {0, 0, 0}));
  connect(gain.u, u)
    annotation (Line(origin = {-212.0, -19.0}, 
      points = {{28.0, 0.0}, {-29.0, 0.0}}, 
      color = {0, 0, 127}));
end ServoSysGearZ;