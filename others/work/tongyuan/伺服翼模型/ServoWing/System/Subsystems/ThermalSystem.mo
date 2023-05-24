within ServoWing.System.Subsystems;
model ThermalSystem "热控系统"
  extends Icons.BasicModel;
  parameter Boolean UseExtra = false "是否用外部输入,true:使用外部输入温度,false:使用固定温度输入" 
    annotation (Dialog(group = "模型配置"));
  parameter Modelica.SIunits.Temperature T = 288.15 "外界温度" 
    annotation (Dialog(group = "模型参数", enable = not UseExtra));

  Interfaces.HeatInterfaces.HeatPort_a port[3] "热接口" 
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature[3](T = T) if not UseExtra
    annotation (Placement(transformation(origin = {-24.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature[3] if UseExtra
    annotation (Placement(transformation(origin = {-24.0, -36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput T_input(unit = "K") if UseExtra "外部输入温度,单位K" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, -30.0}, {60.0, 30.0}}, 
      textString = "热控系统", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Line(origin = {-24.0, 28.0}, 
      points = {{-60.0, 0.0}, {60.0, 0.0}}, 
      color = {191, 0, 0}, 
      thickness = 0.5), Polygon(origin = {47.0, 28.0}, 
      lineColor = {191, 0, 0}, 
      fillColor = {191, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-15.0, -10.0}, {-15.0, 10.0}, {15.0, 0.0}, {-15.0, -10.0}}), Rectangle(origin = {69.0, 0.0}, 
      lineColor = {191, 0, 0}, 
      fillColor = {191, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-7.0, 40.0}, {7.0, -40.0}}), Line(origin = {-24.0, 0.0}, 
      points = {{-60.0, 0.0}, {60.0, 0.0}}, 
      color = {191, 0, 0}, 
      thickness = 0.5), Polygon(origin = {47.0, 0.0}, 
      lineColor = {191, 0, 0}, 
      fillColor = {191, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-15.0, -10.0}, {-15.0, 10.0}, {15.0, 0.0}, {-15.0, -10.0}}), Line(origin = {-24.0, -28.0}, 
      points = {{-60.0, 0.0}, {60.0, 0.0}}, 
      color = {191, 0, 0}, 
      thickness = 0.5), Polygon(origin = {47.0, -28.0}, 
      lineColor = {191, 0, 0}, 
      fillColor = {191, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-15.0, -10.0}, {-15.0, 10.0}, {15.0, 0.0}, {-15.0, -10.0}})}));
  connect(fixedTemperature.port, port)
    annotation (Line(origin = {43.0, 0.0}, 
      points = {{-57.0, 0.0}, {57.0, 0.0}}, 
      color = {191, 0, 0}));
  connect(prescribedTemperature.port, port)
    annotation (Line(origin = {43.0, -18.0}, 
      points = {{-57.0, -18.0}, {-13.0, -18.0}, {-13.0, 18.0}, {57.0, 18.0}}, 
      color = {191, 0, 0}));
  connect(T_input, prescribedTemperature[1].T)
    annotation (Line(origin = {-73.0, -18.0}, 
      points = {{-37.0, 18.0}, {-7.0, 18.0}, {-7.0, -18.0}, {37.0, -18.0}}, 
      color = {0, 0, 127}));
  connect(T_input, prescribedTemperature[2].T)
    annotation (Line(origin = {-73.0, -18.0}, 
      points = {{-37.0, 18.0}, {-7.0, 18.0}, {-7.0, -18.0}, {37.0, -18.0}}, 
      color = {0, 0, 127}));
  connect(T_input, prescribedTemperature[3].T)
    annotation (Line(origin = {-73.0, -18.0}, 
      points = {{-37.0, 18.0}, {-7.0, 18.0}, {-7.0, -18.0}, {37.0, -18.0}}, 
      color = {0, 0, 127}));
end ThermalSystem;