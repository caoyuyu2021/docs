within ServoWing.Controller.Components;
model SignalSwitch "信号切换"
  extends Icons.BasicModel;
  Modelica.Blocks.Interfaces.RealInput w_ref_in " 速度指令" 
    annotation (Placement(transformation(origin = {-110.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput w_ref_phi_in " 角度PID运算后指令" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput w_ref_out " 输出速度指令" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.BooleanInput signal "切换信号，false-速度闭环，true-位置闭环" 
    annotation (Placement(transformation(origin = {-110.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  if signal then 
    w_ref_out = w_ref_phi_in;
  else
    w_ref_out = w_ref_in;
  end if;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {-54.0, 28.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 2.0, 
      extent = {{-2.0, 2.0}, {2.0, -2.0}}), Ellipse(origin = {-54.0, -30.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 2.0, 
      extent = {{-2.0, 2.0}, {2.0, -2.0}}), Line(origin = {-1.0, 16.0}, 
      points = {{-51.0, 12.0}, {51.0, -12.0}}, 
      thickness = 1.0), Ellipse(origin = {48.0, 4.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 2.0, 
      extent = {{-2.0, 2.0}, {2.0, -2.0}}), Line(origin = {-4.0, 43.0}, 
      points = {{0.0, 25.0}, {0.0, -25.0}}, 
      color = {255, 0, 255}, 
      pattern = LinePattern.Dash, 
      thickness = 1.0), Line(origin = {-70.0, 28.0}, 
      points = {{18.0, 0.0}, {-18.0, 0.0}}, 
      thickness = 2.0), Line(origin = {-70.0, -30.0}, 
      points = {{18.0, 0.0}, {-18.0, 0.0}}, 
      thickness = 2.0), Line(origin = {66.0, 4.0}, 
      points = {{18.0, 0.0}, {-18.0, 0.0}}, 
      thickness = 2.0), Text(origin = {-62.0, 41.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "w_ref_in", 
      textStyle = {TextStyle.None}), Text(origin = {-46.0, 1.0}, 
      extent = {{-60.0, 10.0}, {60.0, -10.0}}, 
      textString = "w_ref_phi_in", 
      textStyle = {TextStyle.None}), Text(origin = {-70.0, -43.0}, 
      extent = {{-30.0, 10.0}, {30.0, -10.0}}, 
      textString = "signal", 
      textStyle = {TextStyle.None}), Text(origin = {56.0, -5.0}, 
      extent = {{-45.0, 10.0}, {45.0, -10.0}}, 
      textString = "w_ref_out", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "信号切换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end SignalSwitch;