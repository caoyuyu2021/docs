within ServoWing.Controller.Components;
model NXYZ_T1T2 "T1T2计算模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.IntegerInput N
    annotation (extent = [-110, -90; -90, 
      -70], 
      Placement(transformation(origin = {-110.0, -80.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput X
    annotation (extent = [-110, 70; -90, 
      90], 
      Placement(transformation(origin = {-110.0, 80.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Y
    annotation (extent = [-110, 30; -90, 50], 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Z
    annotation (extent = [-110, -10; -90, 10], 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput T1
    annotation (extent = [90, 40; 110, 60], 
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput T2
    annotation (extent = [90, -60; 110, -40], 
      Placement(transformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput T
    annotation (extent = [-110, -50; -90, -30], 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
protected 
  Real Temp1;
  Real Temp2;
equation 
  Temp1 = if N == 1 then -X else 
    if N == 2 then Z else 
    if N == 3 then X else 
    if N == 4 then Y else 
    if N == 5 then -Y else 
    -Z;
  Temp2 = if N == 1 then Z else 
    if N == 2 then Y else 
    if N == 3 then -Y else 
    if N == 4 then -X else 
    if N == 5 then -Z else 
    X;
  if (Temp1 + Temp2) > T then 
    T1 = Temp1 / (Temp1 + Temp2) * T;
    T2 = Temp2 / (Temp1 + Temp2) * T;
  else
    T1 = Temp1;
    T2 = Temp2;
  end if;
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-84.0, 77.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "X", 
      textStyle = {TextStyle.None}), Text(origin = {-84.0, 37.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "Y", 
      textStyle = {TextStyle.None}), Text(origin = {-84.0, -3.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "Z", 
      textStyle = {TextStyle.None}), Text(origin = {-85.0, -41.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "T", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-85.0, -79.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "N", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {80.0, 19.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "T1", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {80.0, -21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "T2", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "T1T2计算", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>计算当前工作扇区中主矢量工作时间和副矢量工作时间输入上一模块计算出的电压过度变量X、Y、Z及当前扇区号N和PWM波形周期T，输出为当前工作扇区中主矢量工作时间T1 和副矢量工作时间T2。</BODY></HTML>"));
end NXYZ_T1T2;