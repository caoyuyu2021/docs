within ServoWing.Controller.Components;
model Cal_fai_L "计算相位滞后和幅值衰减"
  extends Icons.BasicModel;
  //只针对输入正弦信号测试频率的工况
  parameter SI.AngularVelocity w = 1 "信号的角速度";
  parameter SI.Time T_PWM = 1e-5 "周期";
  //
  SI.Time t1;
  SI.Time t2;
  //
  SI.Time T "信号周期";
  //
  Real amp1(start = 0);
  Real amp2(start = 0);
  Real signal_ref_dic;
  Real signal_dic;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "滞后和衰减测量", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Line(origin = {-1.0, 1.0}, 
      points = {{-95.0, -61.0}, {-43.0, 39.0}, {-25.0, 59.0}, {1.0, 69.0}, {37.0, 41.0}, {95.0, -69.0}}, 
      thickness = 2.0, 
      smooth = Smooth.Bezier), Line(origin = {20.0, -27.0}, 
      points = {{-80.0, -73.0}, {-18.0, 43.0}, {0.0, 63.0}, {26.0, 73.0}, {62.0, 41.0}, {80.0, 7.0}}, 
      color = {0, 128, 0}, 
      thickness = 2.0, 
      smooth = Smooth.Bezier), Line(origin = {34.0, 66.0}, 
      points = {{-46.0, 0.0}, {46.0, 0.0}}), Line(origin = {59.0, 42.0}, 
      points = {{-21.0, 0.0}, {21.0, 0.0}}), Line(origin = {-6.0, 7.0}, 
      points = {{0.0, 59.0}, {0.0, -59.0}}), Line(origin = {42.0, -5.0}, 
      points = {{0.0, 47.0}, {0.0, -47.0}}), Text(origin = {79.0, 52.0}, 
      extent = {{-19.0, 10.0}, {19.0, -10.0}}, 
      textString = "L", 
      textStyle = {TextStyle.None}), Text(origin = {19.0, -48.0}, 
      extent = {{-19.0, 10.0}, {19.0, -10.0}}, 
      textString = "fai", 
      textStyle = {TextStyle.None})}));



  Modelica.Blocks.Interfaces.RealInput signal_ref "指令信号" 
    annotation (Placement(transformation(origin = {-110.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput signal "反馈信号" 
    annotation (Placement(transformation(origin = {-110.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput delay_deg "滞后角度" 
    annotation (Placement(transformation(origin = {110.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput amp_dB "幅值衰减" 
    annotation (Placement(transformation(origin = {110.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  when signal_ref < 0 then 
    t1 = time;
  end when;
  when signal < 0 then 
    t2 = time;
  end when;
  T = 2 * pi / w;
  delay_deg = (t1 - t2) / T * 360;
  // algorithm 
  // if signal_ref > amp1 then 
  //   amp1 := signal_ref;
  // else
  //   amp1 := amp1;
  // end if;
  // if signal > amp2 then 
  //   amp2 := signal;
  // else
  //   amp2 := amp2;
  // end if;
algorithm 
  when sample(0, T_PWM) then 
    signal_ref_dic := signal_ref;
    signal_dic := signal;
    if signal_ref_dic > pre(signal_ref_dic) then 
      amp1 := signal_ref_dic;
    end if;
    if signal_dic > pre(signal_dic) then 
      amp2 := signal_dic;
    end if;
  end when;
  // if amp1 <= 0 then 
  //   amp_dB := 0;
  // else
  //   amp_dB := 20 * log10(max(amp2 / (amp1),1e-10));
  // end if;
  amp_dB := noEvent(if amp1 <= 0 then 0 else 20 * log10(max(amp2 / (amp1), 1e-10)));

end Cal_fai_L;