within ServoWing.Sensors.Components;
model ToVoltage "转电压"
  extends Icons.BasicModel;
  //参数
  parameter Real Irange = 20;
  parameter Real Vrange = 5;
  //实例化
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  y = Vrange / Irange * u;
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-89.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {94.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-45.0, 30.0}, {45.0, -30.0}}, 
      textString = "转电压", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end ToVoltage;