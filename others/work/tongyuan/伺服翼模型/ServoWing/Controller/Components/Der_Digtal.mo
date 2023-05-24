within ServoWing.Controller.Components;
model Der_Digtal "差分模块"
  extends Icons.BasicModel;
  //参数
  parameter SI.Time T = 6.25e-5 "控制周期";
  parameter SI.Angle y_start = 0 "初始角速度";
  //实例化
  Modelica.Blocks.Discrete.UnitDelay unitdelay(
    samplePeriod = T)
    annotation (Placement(transformation(extent = {{19, -9}, {39, 11}})));
  Modelica.Blocks.Discrete.Sampler sampler(
    samplePeriod = T)
    annotation (Placement(transformation(extent = {{-62, -10}, {-42, 10}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  if time <= T then 
    y = y_start;
  else
    y = (unitdelay.u - unitdelay.y) / T;
  end if;
  connect(u, sampler.u)
    annotation (Line(origin = {-87.0, 0.0}, 
      points = {{-29.0, 0.0}, {23.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sampler.y, unitdelay.u)
    annotation (Line(points = {{-41, 0}, {17, 0}, {17, 1}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-5.0, 0.0}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-45.0, 40.0}, {45.0, -40.0}}, 
      textString = "Der", 
      textColor = {255, 104, 32}), Text(origin = {0.0, -130.0}, 
      extent = {{-30.0, 30.0}, {30.0, -30.0}}, 
      textString = "差分", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-89.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {94.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>差分运算模块，将本周期电机机械角度值与上一周期对应值之间差分，得到本周期电机机械转速测量值。初始周期输出转速默认值y_start=0.</BODY></HTML>"));
end Der_Digtal;