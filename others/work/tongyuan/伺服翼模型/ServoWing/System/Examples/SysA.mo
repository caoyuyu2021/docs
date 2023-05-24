within ServoWing.System.Examples;
model SysA "频率特性"
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
    Diagram(coordinateSystem(extent = {{-300.0, -220.0}, {380.0, 140.0}}, 
      grid = {2.0, 2.0})), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 0.0001, Algorithm = Rkfix4, Tolerance = 0.0001, IntegratorStep = 0.0001, DoublePrecision = true, StoreEventValue = false));

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
    annotation (Placement(transformation(origin = {28.0, 8.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Subsystems.ElectricalSystem electricalSystem(U_dc = 220)
    annotation (Placement(transformation(origin = {-42.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Subsystems.PMSM pMSM(J_Rotor = 45e-6, p = 2, Rs = 0.06, Lssigma = 4e-5, Lmd = 0.16e-3, Lmq = 0.16e-3, 
    terminalConnection = "Y", torque_max = 1.2, Va = 220) annotation (Placement(transformation(origin = {-4.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));


  Subsystems.MeasureSystem measureSystem
    annotation (Placement(transformation(origin = {150.0, -46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.PMSMControllerX controlSystem(Kp3 = 2142 * 180 / pi, 
    p = 2, 
    U_dc = 220, T_PWM = 1e-4, Kp1 = 2.607, Ki1 = 0, T1 = 1e-5, Kp2 = 0.456, Ki2 = 0.01, T2 = 1e-4, u_max3 = 18000 * 2 * pi / 60, u_max2 = 120, 
    T3 = 0.001, 
    u_max1 = 220, 
    u_max4 = 8.5 / 180 * pi)

    annotation (Placement(transformation(origin = {-80.0, -24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = true)
    annotation (Placement(transformation(origin = {-124.0, -34.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Sources.Constant const2(k = 0)
    annotation (Placement(transformation(origin = {-161.0, -11.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Sources.Step step(height = 4 / 57.3, startTime = 0.1)
    annotation (Placement(transformation(origin = {-221.0, -37.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));



  Loads.JetNozzleX jetNozzle2_1

    annotation (Placement(transformation(origin = {202.0, -30.0}, 
      extent = {{-22.0, -22.0}, {22.0, 22.0}})));
  Subsystems.MechanicsSystem2 mechanicsSystem2_1(Ph = 4, eta = 0.7, 
    s0_start = 407.5 / 1000, 
    zA1 = 17, zB1 = 57, 
    zA2 = 1, zB2 = 1)


    annotation (Placement(transformation(origin = {71.00000000000003, -18.999999999999986}, 
      extent = {{-11.0, -11.0}, {11.0, 11.0}})));


  Controller.Components.Cal_fai_L cal_fai_L(w = 10)
    annotation (Placement(transformation(origin = {-70.0, -90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Components.SineSignal sineSignal(w = 3.14, 
    delta = 2) annotation (Placement(transformation(origin = {-194.0, -24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(thermalSystem.port, pMSM.port)
    annotation (Line(origin = {-11.0, 20.0}, 
      points = {{29.0, -12.0}, {7.0, -12.0}, {7.0, -30.0}}, 
      color = {191, 0, 0}));
  connect(electricalSystem.plug_n, measureSystem.plug_p)
    annotation (Line(origin = {14.0, -11.0}, 
      points = {{-46.0, -13.0}, {-42.0, -13.0}, {-42.0, -41.0}, {126.0, -41.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.plug_n, pMSM.plug_n)
    annotation (Line(origin = {-8.0, -37.0}, 
      points = {{148.0, -11.0}, {-10.0, -11.0}, {-10.0, 13.0}, {-6.0, 13.0}}, 
      color = {0, 0, 255}));


  connect(electricalSystem.pin_ap, pMSM.pin_ap)
    annotation (Line(origin = {-34.0, -16.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(electricalSystem.pin_an, pMSM.pin_an)
    annotation (Line(origin = {-34.0, -20.0}, 
      points = {{2.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(measureSystem.i, controlSystem.i_f)
    annotation (Line(origin = {2.0, 7.0}, 
      points = {{159.0, -55.0}, {164.0, -55.0}, {164.0, -71.0}, {-100.0, -71.0}, {-100.0, -36.0}, {-93.0, -36.0}}, 
      color = {0, 0, 127}));
  connect(controlSystem.pulse, electricalSystem.pulse)
    annotation (Line(origin = {-61.0, -20.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, controlSystem.signal)
    annotation (Line(origin = {-110.0, -31.0}, 
      points = {{-9.0, -3.0}, {19.0, -3.0}, {19.0, -2.0}}, 
      color = {255, 0, 255}));
  connect(measureSystem.w, controlSystem.w)
    annotation (Line(origin = {45.0, -37.0}, 
      points = {{116.0, -15.0}, {119.0, -15.0}, {119.0, -23.0}, {-151.0, -23.0}, {-151.0, 23.0}, {-136.0, 23.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, measureSystem.flange_a)
    annotation (Line(origin = {43.0, -31.0}, 
      points = {{-37.0, 11.0}, {-21.0, 11.0}, {-21.0, -13.0}, {97.0, -13.0}}));
  connect(const2.y, controlSystem.w_ref)
    annotation (Line(origin = {-123.0, -16.0}, 
      points = {{-33.0, 5.0}, {-21.0, 5.0}, {-21.0, -6.0}, {32.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(measureSystem.phi, controlSystem.phi)
    annotation (Line(origin = {34.0, -42.0}, 
      points = {{127.0, -2.0}, {136.0, -2.0}, {136.0, -26.0}, {-136.0, -26.0}, {-136.0, 25.0}, {-125.0, 25.0}}, 
      color = {0, 0, 127}));
  connect(jetNozzle2_1.angle_Y_rad, controlSystem.phi_pg)
    annotation (Line(origin = {106.0, 18.0}, 
      points = {{120.0, -44.0}, {134.0, -44.0}, {134.0, 22.0}, {-212.0, 22.0}, {-212.0, -29.0}, {-197.0, -29.0}}, 
      color = {0, 0, 127}));
  connect(pMSM.flange_a, mechanicsSystem2_1.flange_a)
    annotation (Line(origin = {37.0, -19.0}, 
      points = {{-31.0, -1.0}, {23.0, -1.0}, {23.0, 0.0}}));
  connect(mechanicsSystem2_1.flange_t, measureSystem.flange_a1)
    annotation (Line(origin = {117.0, -29.0}, 
      points = {{-35.0, 10.0}, {-23.0, 10.0}, {-23.0, -11.0}, {23.0, -11.0}}, 
      color = {0, 127, 0}));
  connect(controlSystem.phi_pg, cal_fai_L.signal)
    annotation (Line(origin = {-96.0, -51.0}, 
      points = {{5.0, 40.0}, {-16.0, 40.0}, {-16.0, -41.0}, {15.0, -41.0}}, 
      color = {0, 0, 127}));
  connect(cal_fai_L.signal_ref, controlSystem.phi_ref)
    annotation (Line(origin = {-117.0, -55.0}, 
      points = {{36.0, -31.0}, {-37.0, -31.0}, {-37.0, 30.0}, {26.0, 30.0}}, 
      color = {0, 0, 127}));
  connect(sineSignal.y, controlSystem.phi_ref)
    annotation (Line(origin = {-142.0, -12.0}, 
      points = {{-41.0, -12.0}, {-38.0, -12.0}, {-38.0, -13.0}, {51.0, -13.0}}, 
      color = {0, 0, 127}));
  connect(mechanicsSystem2_1.flange_t, jetNozzle2_1.flange_y)
    annotation (Line(origin = {131.0, -20.0}, 
      points = {{-49.0, 1.0}, {49.0, 1.0}, {49.0, -1.0}}, 
      color = {0, 127, 0}));
end SysA;