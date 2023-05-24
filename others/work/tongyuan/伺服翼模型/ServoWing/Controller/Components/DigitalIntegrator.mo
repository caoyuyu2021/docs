﻿within ServoWing.Controller.Components;
model DigitalIntegrator "离散积分器"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput u "输入信号" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y "输出信号" 
    annotation (Placement(transformation(extent = {{100, -10}, {120, 10}})));
  parameter Real T = 0.001 "采样周期";
equation 
  //通过采样函数sample（）触发事件，然后处理事件，对采样值进行求和
  when sample(0, T) then 
    y = pre(y) + u * T;
  end when;
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
      textString = "离散积分器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-89.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {94.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None})}));
end DigitalIntegrator;