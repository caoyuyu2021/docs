within ServoWing.System.Examples;
model SysA2
  extends Icons.Test;
  // output SI.Angle angle_ref = pMSMController.feedback4.u1 "角度指令";
  // output SI.Angle angle = pMSMController.feedback4.u2 "角度反馈";

  // output SI.AngularVelocity angularVelocity_ref = pMSMController.feedback2.u1 "角速度指令";
  // output SI.AngularVelocity angularVelocity = pMSMController.feedback2.u2 "角速度反馈";
  // output SI.Current i_multi[3] = currentMeasure_Muti.y "三相电流";
  // output SI.Current i_d_ref = pMSMController.feedback3.u1 "d轴电流指令";
  // output SI.Current i_d = pMSMController.feedback3.u2 "d轴电流反馈";
  // output SI.Current i_q_ref = pMSMController.feedback1.u1 "q轴电流指令";
  // output SI.Current i_q = pMSMController.feedback1.u2 "q轴电流反馈";



  annotation (
    Diagram(coordinateSystem(extent = {{-280.0, -120.0}, {300.0, 140.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-188.0, -46.0}, 
      extent = {{-20.0, 6.0}, {20.0, -6.0}}, 
      textString = "0~8deg", 
      textStyle = {TextStyle.None})}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 0.001, Algorithm = Dassl, Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));

    // __MWorks(ResultViewerManager(resultViewers = {

    //   ResultViewer(name = "角速度指令输入和反馈", executeTrigger = executeTrigger.PreSimulation, commands = {CreatePlot(id = 1, position = [0, 0, 544, 324], heading = "角速度指令输入和反馈", y = ['pMSMController.feedback2.u1', 'pMSMController.feedback2.u2'])}), 
    //   ResultViewer(name = "三相电流", executeTrigger = executeTrigger.PreSimulation, commands = {CreatePlot(id = 2, position = [544, 0, 544, 324], heading = "三相电流", y = ['currentMeasure_Muti.y[1]', 'currentMeasure_Muti.y[2]', 'currentMeasure_Muti.y[3]'])}), 
    //   ResultViewer(name = "D轴电流指令输入和反馈", executeTrigger = executeTrigger.PreSimulation, commands = {CreatePlot(id = 3, position = [1088, 0, 543, 324], heading = "D轴电流指令输入和反馈", y = ['pMSMController.feedback3.u1', 'pMSMController.feedback3.u2'])}), 
    //   ResultViewer(name = "Q轴电流指令和反馈", executeTrigger = executeTrigger.PreSimulation, commands = {CreatePlot(id = 4, position = [0, 324, 544, 323], heading = "Q轴电流指令和反馈", y = ['pMSMController.feedback1.u1', 'pMSMController.feedback1.u2'])}), 
    //   ResultViewer(name = "角度指令输入和反馈", executeTrigger = executeTrigger.PreSimulation, commands = {CreatePlot(id = 5, position = [544, 324, 544, 323], heading = "角度指令输入和反馈", y = ['pMSMController.feedback4.u1', 'pMSMController.feedback4.u2'])})}))
     //以下为2021版曲线自动显示
     // __MWorks(ResultViewerManager(resultViewers = {
      // ResultViewer(name = "曲线展示", executeTrigger = executeTrigger.SimulationStarted, commands = {
      // CreatePlot(id = 1, position = [0, 0, 544, 324], y = ["pMSMController.feedback2.u1", "pMSMController.feedback2.u2"], x_display_unit = "s", y_display_units = ["", "rad"], y_axis = [1, 1], legend_layout = 1, heading = "角速度指令输入和反馈", fix_time_range = True, fix_time_range_value = 0), 
      // CreatePlot(id = 2, position = [544, 0, 544, 324], y = ["currentMeasure_Muti.y[1]", "currentMeasure_Muti.y[2]", "currentMeasure_Muti.y[3]"], x_display_unit = "s", y_axis = [1, 1, 1], legend_layout = 1, heading = "三相电流", fix_time_range = True, fix_time_range_value = 0), 
      // CreatePlot(id = 3, position = [1088, 0, 543, 324], y = ["pMSMController.feedback3.u1", "pMSMController.feedback3.u2"], x_display_unit = "s", y_axis = [1, 1], legend_layout = 1, heading = "D轴电流指令输入和反馈", fix_time_range = True, fix_time_range_value = 0), 
      // CreatePlot(id = 4, position = [0, 324, 544, 323], y = ["pMSMController.feedback1.u1", "pMSMController.feedback1.u2"], x_display_unit = "s", y_axis = [1, 1], legend_layout = 1, heading = "Q轴电流指令和反馈", fix_time_range = True, fix_time_range_value = 0), 
      // CreatePlot(id = 5, position = [544, 324, 544, 323], y = ["pMSMController.feedback4.u1", "pMSMController.feedback4.u2"], x_display_unit = "s", y_axis = [1, 1], legend_layout = 1, heading = "角度指令输入和反馈", fix_time_range = True, fix_time_range_value = 0), 
      // CreatePlot(id = 6, position = [1088, 324, 543, 323], y = ["mass.s"], x_display_unit = "s", y_display_units = ["m"], y_axis = [1], legend_layout = 1, heading = "负载位移", left_title = "[m]", fix_time_range = True, fix_time_range_value = 0)})}))
  Subsystems.ThermalSystem thermalSystem
    annotation (Placement(transformation(origin = {32.0, 34.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Subsystems.ElectricalSystem electricalSystem(U_dc = 220)
    annotation (Placement(transformation(origin = {-38.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.PMSM pMSM(J_Rotor = 45e-6, p = 2, Rs = 0.06, Lssigma = 4e-5, Lmd = 0.16e-3, Lmq = 0.16e-3, 
    terminalConnection = "Y", torque_max = 1.2, Va = 220) annotation (Placement(transformation(origin = {0.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.MeasureSystem measureSystem
    annotation (Placement(transformation(origin = {154.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.PMSMControllerX controlSystem(Kp3 = 2142 * 180 / pi, 
    p = 2, 
    U_dc = 220, T_PWM = 1e-4, Kp1 = 2.607, Ki1 = 0, T1 = 1e-5, Kp2 = 0.456, Ki2 = 0.01, T2 = 1e-4, u_max3 = 18000 * 2 * pi / 60, u_max2 = 120, 
    T3 = 0.001, 
    u_max1 = 220, 
    u_max4 = 8.5 / 180 * pi)

    annotation (Placement(transformation(origin = {-76.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = true)
    annotation (Placement(transformation(origin = {-120.0, -8.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Sources.Constant const2(k = 0)
    annotation (Placement(transformation(origin = {-157.0, 23.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Subsystems.MechanicsSystem2 mechanicsSystem2_1(
    zA1 = 17, zB1 = 57, 
    zA2 = 1, zB2 = 1, 
    s0_start = 0, 
    Ph = 40)

    annotation (Placement(transformation(origin = {75.00000000000003, 7.000000000000021}, 
      extent = {{-11.0, -11.0}, {11.0, 11.0}})));



  Modelica.Mechanics.Translational.Components.Mass mass(m = 70)
    annotation (Placement(transformation(origin = {187.0, 7.0}, 
      extent = {{-11.0, -11.0}, {11.0, 11.0}})));



  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(origin = {236.99999999999994, 37.0}, 
      extent = {{-11.0, -11.0}, {11.0, 11.0}})));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 57.3 * 10)
    annotation (Placement(transformation(origin = {70.0, 98.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / 57.3 * 10)
    annotation (Placement(transformation(origin = {-192.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1 / 3.14, amplitude = 0.4)
    annotation (Placement(transformation(origin = {-238.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(thermalSystem.port, pMSM.port)
    annotation (Line(origin = {-7.0, 46.0}, 
      points = {{29.0, -12.0}, {7.0, -12.0}, {7.0, -30.0}}, 
      color = {191, 0, 0}));
  connect(electricalSystem.plug_n, measureSystem.plug_p)
    annotation (Line(origin = {18.0, 15.0}, 
      points = {{-46.0, -13.0}, {-46.0, -41.0}, {126.0, -41.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.plug_n, pMSM.plug_n)
    annotation (Line(origin = {-4.0, -11.0}, 
      points = {{148.0, -11.0}, {-10.0, -11.0}, {-10.0, 13.0}, {-6.0, 13.0}}, 
      color = {0, 0, 255}));
  connect(electricalSystem.pin_ap, pMSM.pin_ap)
    annotation (Line(origin = {-30.0, 10.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(electricalSystem.pin_an, pMSM.pin_an)
    annotation (Line(origin = {-30.0, 6.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.i, controlSystem.i_f)
    annotation (Line(origin = {6.0, 33.0}, 
      points = {{159.0, -55.0}, {164.0, -55.0}, {164.0, -71.0}, {-100.0, -71.0}, {-100.0, -36.0}, {-93.0, -36.0}}, 
      color = {0, 0, 127}));
  connect(controlSystem.pulse, electricalSystem.pulse)
    annotation (Line(origin = {-57.0, 6.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, controlSystem.signal)
    annotation (Line(origin = {-106.0, -5.0}, 
      points = {{-9.0, -3.0}, {19.0, -3.0}, {19.0, -2.0}}, 
      color = {255, 0, 255}));
  connect(measureSystem.w, controlSystem.w)
    annotation (Line(origin = {49.0, -11.0}, 
      points = {{116.0, -15.0}, {119.0, -15.0}, {119.0, -23.0}, {-151.0, -23.0}, {-151.0, 23.0}, {-136.0, 23.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, measureSystem.flange_a)
    annotation (Line(origin = {47.0, -5.0}, 
      points = {{-37.0, 11.0}, {-21.0, 11.0}, {-21.0, -13.0}, {97.0, -13.0}}));
  connect(const2.y, controlSystem.w_ref)
    annotation (Line(origin = {-119.0, 10.0}, 
      points = {{-33.0, 13.0}, {-21.0, 13.0}, {-21.0, -6.0}, {32.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(measureSystem.phi, controlSystem.phi)
    annotation (Line(origin = {38.0, -16.0}, 
      points = {{127.0, -2.0}, {136.0, -2.0}, {136.0, -26.0}, {-136.0, -26.0}, {-136.0, 25.0}, {-125.0, 25.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, mechanicsSystem2_1.flange_a)
    annotation (Line(origin = {41.0, 7.0}, 
      points = {{-31.0, -1.0}, {21.0, -1.0}, {21.0, 0.0}, {23.0, 0.0}}));
  connect(mechanicsSystem2_1.flange_t, measureSystem.flange_a1)
    annotation (Line(origin = {121.0, -3.0}, 
      points = {{-35.0, 10.0}, {-23.0, 10.0}, {-23.0, -11.0}, {23.0, -11.0}}, 
      color = {0, 127, 0}));
  connect(mechanicsSystem2_1.flange_t, mass.flange_a)
    annotation (Line(origin = {134.0, 6.0}, 
      points = {{-48.0, 1.0}, {-48.0, 0.0}, {42.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(positionSensor.flange, mass.flange_a)
    annotation (Line(origin = {198.0, 22.0}, 
      points = {{28.0, 15.0}, {-29.0, 15.0}, {-29.0, -15.0}, {-22.0, -15.0}}, 
      color = {0, 127, 0}));
  connect(positionSensor.s, gain1.u)
    annotation (Line(origin = {166.0, 68.0}, 
      points = {{83.0, -31.0}, {84.0, -31.0}, {84.0, 30.0}, {-84.0, 30.0}}, 
      color = {0, 0, 127}));
  connect(gain1.y, controlSystem.phi_pg)
    annotation (Line(origin = {-19.0, 57.0}, 
      points = {{78.0, 41.0}, {-79.0, 41.0}, {-79.0, -42.0}, {-68.0, -42.0}}, 
      color = {0, 0, 127}));
  connect(sine.y, gain.u)
    annotation (Line(origin = {-216.0, 2.0}, 
      points = {{-11.0, -2.0}, {12.0, -2.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, controlSystem.phi_ref)
    annotation (Line(origin = {-117.0, -33.0}, 
      points = {{-64.0, 33.0}, {-39.0, 33.0}, {-39.0, 34.0}, {30.0, 34.0}}, 
      color = {0, 0, 127}));
end SysA2;