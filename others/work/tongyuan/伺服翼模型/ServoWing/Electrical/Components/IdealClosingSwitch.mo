within ServoWing.Electrical.Components;
model IdealClosingSwitch "理想开关管"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  //参数
  parameter SI.Resistance Ron(final min = 0) = 1.E-5 "关闭状态开关管电阻";
  parameter SI.Conductance Goff(final min = 0) = 1.E-5 "导通状态开关管电导（电阻倒数）";
  Modelica.Blocks.Interfaces.BooleanInput control "true：导通, false：关闭" 
    annotation (Placement(
      transformation(
        origin = {0, 70}, 
        extent = {{-20, -20}, {20, 20}}, 
        rotation = 270)));
  //变量
protected 
  Real s(final unit = "1") "理想开关管特性辅助变量";
  constant Modelica.SIunits.Voltage unitVoltage = 1 annotation (HideResult = true);
  constant Modelica.SIunits.Current unitCurrent = 1 annotation (HideResult = true);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {-40.0, 0.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-4.0, 4.0}, {4.0, -4.0}}), Line(origin = {-67.0, 0.0}, 
      points = {{-23.0, 0.0}, {23.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {1.5, 26.0}, 
      points = {{-38.5, -24.0}, {38.5, 24.0}}, 
      color = {0, 0, 255}), Line(origin = {65.0, 0.0}, 
      points = {{-25.0, 0.0}, {25.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {0.0, 38.5}, 
      points = {{0.0, 12.5}, {0.0, -12.5}}, 
      color = {0, 0, 255})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {-40.0, 0.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-4.0, 4.0}, {4.0, -4.0}}), Line(origin = {-67.0, 0.0}, 
      points = {{-23.0, 0.0}, {23.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {1.5, 26.0}, 
      points = {{-38.5, -24.0}, {38.5, 24.0}}, 
      color = {0, 0, 255}), Line(origin = {65.0, 0.0}, 
      points = {{-25.0, 0.0}, {25.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {0.0, 38.5}, 
      points = {{0.0, 12.5}, {0.0, -12.5}}, 
      color = {0, 0, 255})}));
equation 
  v = (s * unitCurrent) * (if control then Ron else 1);
  i = (s * unitVoltage) * (if control then 1 else Goff);
end IdealClosingSwitch;