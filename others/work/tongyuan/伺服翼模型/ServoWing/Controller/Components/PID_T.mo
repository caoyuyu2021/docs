within ServoWing.Controller.Components;
model PID_T "普通PID控制器"
  extends Icons.BasicModel;
  //参数
  parameter Real kP = 1 "比例系数";
  parameter Real kI = 1 "积分系数";
  parameter Real kD = 1 "微分系数";
  parameter Modelica.SIunits.Time T = 1 / 180 "时间常数";
  //实例化
  Modelica.Blocks.Math.Gain KP(k = kP)
    annotation (Placement(transformation(extent = {{-20, -10}, {0, 10}})));
  Modelica.Blocks.Math.Gain KI(k = kI)
    annotation (Placement(transformation(extent = {{0, 30}, {20, 50}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
  Modelica.Blocks.Continuous.Derivative derivative(T = T)
    annotation (Placement(transformation(extent = {{-40, -50}, {-20, -30}})));
  Modelica.Blocks.Math.Gain KD(k = kD)
    annotation (Placement(transformation(extent = {{0, -50}, {20, -30}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent = {{60, -10}, {80, 10}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(origin = {110.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(KI.u, integrator.y)
    annotation (Line(points = {{-2, 40}, {-19, 40}}, color = {0, 0, 127}));
  connect(KD.u, derivative.y)
    annotation (Line(points = {{-2, -40}, {-19, -40}}, color = {0, 0, 127}));
  connect(integrator.u, u)
    annotation (Line(points = {{-42, 40}, {-60, 40}, {-60, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(KP.u, u)
    annotation (Line(points = {{-22, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(derivative.u, u)
    annotation (Line(points = {{-42, -40}, {-60, -40}, {-60, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(KI.y, add3_1.u1)
    annotation (Line(points = {{21, 40}, {40, 40}, {40, 8}, {58, 8}}, color = {0, 0, 127}));
  connect(KP.y, add3_1.u2)
    annotation (Line(points = {{1, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(KD.y, add3_1.u3)
    annotation (Line(points = {{21, -40}, {40, -40}, {40, -8}, {58, -8}}, color = {0, 0, 127}));
  connect(add3_1.y, y)
    annotation (Line(points = {{81, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-87.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {88.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None}), Text(origin = {-5.0, 0.0}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-45.0, 40.0}, {45.0, -40.0}}, 
      textString = "PID", 
      textStyle = {TextStyle.None}, 
      textColor = {255, 104, 32}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "PID控制器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end PID_T;