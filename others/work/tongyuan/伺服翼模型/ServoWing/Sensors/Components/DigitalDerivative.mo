within ServoWing.Sensors.Components;
model DigitalDerivative "离散微分器"
  extends ServoLib.Icons.BasicModel;
  parameter Real ystart = 0;
  //实例化
  Modelica.Blocks.Interfaces.RealInput u "输入信号" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y(start = ystart) "输出信号" 
    annotation (Placement(transformation(extent = {{100, -10}, {120, 10}})));
  parameter Real T = 0.001 "采样周期";
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime = T) annotation (Placement(transformation(origin = {-58.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-2.35222, 139.041}, 
      points = {{52.3522, -87.0407}, {-49.1678, -85.5307}}, 
      thickness = 1.0), Line(origin = {-21.999999999999996, 32.0}, 
      points = {{-30.0, 22.0}, {30.0, -22.0}}, 
      thickness = 1.0), Line(origin = {-24.000000000000007, -15.0}, 
      points = {{32.0, 25.0}, {-32.0, -25.0}}, 
      thickness = 1.0), Line(origin = {-3.0775717920756236, -40.0}, 
      points = {{-52.9224, 0.0}, {51.0776, 0.0}}, 
      thickness = 1.0), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "离散微分器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-87.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {94.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None})}));
equation 
  when sample(0, T) then 
    y = (u - fixedDelay.y) / T;
  end when;
  connect(u, fixedDelay.u)
    annotation (Line(origin = {-90.0, 0.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 127}));
end DigitalDerivative;