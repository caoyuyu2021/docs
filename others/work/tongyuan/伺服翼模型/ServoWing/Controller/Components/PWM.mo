within ServoWing.Controller.Components;
model PWM "PWM波模块"
  extends Icons.BasicModel;
  //参数
  parameter Modelica.SIunits.Time T_PWM(final min = Modelica.Constants.small) = 0.000125 "PWM波周期";
  //实例化
  Modelica.Blocks.Interfaces.RealInput Tcm1
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Tcm2
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Tcm3
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.BooleanOutput On[3]
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-27.0, 46.53846153846154}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 104, 32}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-37.0, 3.46153846153846}, {77.0, 33.46153846153846}}, 
      textString = "sine_Input", 
      textColor = {255, 104, 32}, 
      thickness = 0.5), Text(origin = {11.170212765957444, -52.375}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 104, 32}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-53.170212765957444, -27.625}, {44.829787234042556, 6.375}}, 
      textString = "PWM_Out", 
      textColor = {255, 104, 32}, 
      thickness = 0.5), Text(origin = {-72.0, 41.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm1", 
      textStyle = {TextStyle.None}), Text(origin = {-72.0, 1.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm2", 
      textStyle = {TextStyle.None}), Text(origin = {-74.0, -39.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm3", 
      textStyle = {TextStyle.None}), Text(origin = {84.0, 1.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      textString = "On", 
      textStyle = {TextStyle.None}), Line(origin = {0.0, 0.0}, 
      points = {{92.0, 92.0}, {-92.0, -92.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-45.0, 30.0}, {45.0, -30.0}}, 
      textString = "PWM", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>根据运算模块计算出的脉冲的频率与占空比生成三相脉冲波形 输入Ta、Tb 、Tc，该模块将输出三相脉冲信号。 </BODY></HTML>"));
  Modelica.Blocks.Math.Sum sum1(
    nin = 2, 
    k = {1, -1})
    annotation (extent = [0, 50; 20, 70]);
  Modelica.Blocks.Math.Sum sum2(
    nin = 2, k = {1, -1})
    annotation (extent = [0, -10; 20, 10]);
  Modelica.Blocks.Math.Sum sum3(
    nin = 2, k = {1, -1})
    annotation (extent = [0, -70; 20, -50]);
  switch switch1
    annotation (Placement(transformation(extent = {{35, 50}, {55, 70}})));
  switch switch2
    annotation (Placement(transformation(extent = {{30, -10}, {50, 10}})));
  switch switch3
    annotation (Placement(transformation(extent = {{30, -70}, {50, -50}})));
  IsocelesTriangle isocelestriangle(
    amplitude = T_PWM / 2, 
    period = T_PWM)
    annotation (Placement(transformation(extent = {{-80, 80}, {-60, 100}})));
equation 
  connect(Tcm1, sum1.u[2])
    annotation (Line(origin = {-66.0, 60.0}, 
      points = {{-44.0, 0.0}, {64.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(Tcm2, sum2.u[2])
    annotation (Line(origin = {-66.0, 0.0}, 
      points = {{-44.0, 0.0}, {64.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(Tcm3, sum3.u[2])
    annotation (Line(origin = {-66.0, -60.0}, 
      points = {{-44.0, 0.0}, {64.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sum1.y, switch1.u)
    annotation (Line(points = {{21, 60}, {36, 60}}, color = {0, 0, 127}));
  connect(switch1.y, On[1])
    annotation (Line(origin = {73.0, 31.0}, 
      points = {{-28.0, 29.0}, {14.0, 29.0}, {14.0, -31.0}, {37.0, -31.0}}, 
      color = {255, 0, 255}));
  connect(sum2.y, switch2.u)
    annotation (Line(points = {{21, 0}, {31, 0}}, color = {0, 0, 127}));
  connect(switch2.y, On[2])
    annotation (Line(origin = {70.5, 1.0}, 
      points = {{-31.0, -1.0}, {40.0, -1.0}}, 
      color = {255, 0, 255}));
  connect(sum3.y, switch3.u)
    annotation (Line(points = {{21, -60}, {31, -60}}, color = {0, 0, 127}));
  connect(switch3.y, On[3])
    annotation (Line(origin = {70.5, -29.0}, 
      points = {{-31.0, -31.0}, {17.0, -31.0}, {17.0, 29.0}, {40.0, 29.0}}, 
      color = {255, 0, 255}));
  connect(isocelestriangle.y, sum1.u[1])
    annotation (Line(points = {{-59, 89}, {-59, 90}, {-40, 90}, {-40, 60}, {-2, 60}}, color = {0, 0, 127}));
  connect(isocelestriangle.y, sum2.u[1])
    annotation (Line(points = {{-59, 89}, {-59, 90}, {-40, 90}, {-40, 0}, {-2, 0}}, color = {0, 0, 127}));
  connect(isocelestriangle.y, sum3.u[1])
    annotation (Line(points = {{-59, 89}, {-59, 90}, {-40, 90}, {-40, -60}, {-2, -60}}, color = {0, 0, 127}));
end PWM;