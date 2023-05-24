within ServoWing.Motors.Components;
model SpringDamper_endstop "弹簧阻尼、带间隙、带预加载"
  //extends Icons.BasicModel;
  //参数
  parameter SI.TranslationalSpringConstant c_fixed(final min = 0, start = 1) = 1 "固定弹簧刚度";
  parameter SI.Distance s_rel0 = 0 "未拉伸弹簧长度";
  parameter SI.TranslationalDampingConstant d(final min = 0, start = 0) "阻尼系数";
  parameter SI.Length gap = 0 "弹簧两段位移均为0时的气隙距离";

  //变量  
  SI.Position s_rel(start = 0, stateSelect = StateSelect.prefer) "Relative distance (= flange_b.s - flange_a.s)";
  SI.Velocity v_rel(start = 0, stateSelect = StateSelect.prefer) "Relative velocity (= der(s_rel))";
  SI.Force f_spring "弹簧力";
  SI.Force f_damper "阻尼力";
  SI.Force f "和力";
  //实例化
  Interfaces.TranslationalInterfaces.Flange_a flange_a
    "Left flange of compliant 1-dim. translational component" annotation (
      Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.TranslationalInterfaces.Flange_b flange_b
    "Right flange of compliant 1-dim. translational component" annotation (
      Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-28.300000000000004, 34.0}, 
      points = {{-43.7, 0.0}, {-25.7, 0.0}, {-17.7, -20.0}, {-7.7, 20.0}, {2.3, -20.0}, {12.3, 20.0}, {22.3, -20.0}, {32.3, 0.0}}, 
      thickness = 2.0), Line(origin = {-63.4286, -30.0}, 
      points = {{-8.57143, 0.0}, {15.4286, 0.0}}, 
      thickness = 2.0), Rectangle(origin = {-18.0, -31.037}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-30.0, 15.037037037037038}, {30.0, -12.962962962962962}}), Line(origin = {78.0, 0.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}, 
      thickness = 2.0), Polygon(origin = {24.0, 0.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{15.0, 0.0}, {-15.0, 10.0}, {-15.0, -10.0}, {15.0, 0.0}}), Line(origin = {-18.075, 0.0}, 
      points = {{-29.925, 0.0}, {27.075, 0.0}}), Line(origin = {26.0, 34.0}, 
      points = {{-22.0, 0.0}, {22.0, 0.0}}, 
      thickness = 2.0), Line(origin = {-6.0, -16.0}, 
      points = {{-42.0, 0.0}, {26.0, 0.0}, {42.0, 0.0}}, 
      thickness = 2.0), Line(origin = {-6.0, -44.0}, 
      points = {{-42.0, 0.0}, {26.0, 0.0}, {42.0, 0.0}}, 
      thickness = 2.0), Line(origin = {-81.0, 0.0}, 
      points = {{9.0, 0.0}, {-9.0, 0.0}}, 
      thickness = 2.0), Line(origin = {31.6364, -30.0}, 
      points = {{-19.6364, 0.0}, {16.3636, 0.0}}, 
      thickness = 2.0), Line(origin = {48.0, 1.0}, 
      points = {{0.0, 53.0}, {0.0, -53.0}}, 
      thickness = 2.0), Line(origin = {66.0, 1.0}, 
      points = {{0.0, 53.0}, {0.0, -53.0}}, 
      thickness = 2.0), Line(origin = {-72.0, -11.391308333333335}, 
      points = {{0.0, 79.39130833333334}, {0.0, -52.608691666666665}}, 
      thickness = 2.0), Line(origin = {-8.0, 58.0}, 
      points = {{-62.0, 10.0}, {62.0, 10.0}, {62.0, -10.0}}, 
      thickness = 2.0), Line(origin = {-8.0, -53.0}, 
      points = {{-62.0, -11.0}, {62.0, -11.0}, {62.0, 11.0}}, 
      thickness = 2.0), Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "弹簧阻尼带限位", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), Diagram(coordinateSystem(extent = {{-140.0, -180.0}, {140.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})));
equation 
  //相对移动距离
  s_rel = flange_b.s - flange_a.s;
  //移动速度
  v_rel = der(s_rel);
  //弹簧力
  f_spring = if s_rel + gap > 0 then 0 else c_fixed * (s_rel - s_rel0 + gap);
  //阻尼力
  f_damper = if s_rel + gap > 0 then 0 else d * v_rel;
  //弹簧阻尼的合力
  f = if s_rel + gap >= 0 then 0 else f_damper + f_spring;
  //接口方程
  flange_b.f = f;
  flange_a.f = -f;


  // s_rel = flange_b.s - flange_a.s - gap;
  // v_rel = der(s_rel);

  // f_spring = if s_rel - s_rel0 > 0 then 0 else c_fixed * (s_rel - s_rel0 + 2 * gap);
  // f_damper = if s_rel > 0 then 0 else d * der(flange_b.s - flange_a.s + 2 * gap);
  // f = f_damper + f_spring;
  // flange_b.f = f;
  // flange_a.f = -f;
end SpringDamper_endstop;