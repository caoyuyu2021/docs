within ServoWing.Electrical.Components;
model IdealDiode "理想二极管"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  //参数
  parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-5 "正向导通状态二极管电阻";
  parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-5 "反向关闭状态二极管电导（电阻倒数）";
  parameter Modelica.SIunits.Voltage Vknee(final min = 0) = 0 "正向导通阈值电压";
  //变量
  Boolean off(start = true) "开关状态";
protected 
  Real s(start = 0, final unit = "1") "理想二极管特性辅助变量, s=0:在拐点处 s<0:二极管导通 s>0:二极管关闭 ";
  constant Modelica.SIunits.Voltage unitVoltage = 1 annotation (HideResult = true);
  constant Modelica.SIunits.Current unitCurrent = 1 annotation (HideResult = true);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{30.0, 0.0}, {-30.0, 40.0}, {-30.0, -40.0}, {30.0, 0.0}}), Line(origin = {-25.0, 0.0}, 
      points = {{-65.0, 0.0}, {65.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {65.0, 0.0}, 
      points = {{-25.0, 0.0}, {25.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {30.0, 0.0}, 
      points = {{0.0, 40.0}, {0.0, -40.0}}, 
      color = {0, 0, 255})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {0.0, 0.0}, 
      points = {{-80.0, 0.0}, {80.0, 0.0}}, 
      color = {128, 128, 128}), Polygon(origin = {75.0, 0.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-5.0, 4.0}, {5.0, 0.0}, {-5.0, -4.0}, {-5.0, 4.0}}), Line(origin = {0.0, 0.0}, 
      points = {{0.0, 80.0}, {0.0, -80.0}}, 
      color = {128, 128, 128}), Polygon(origin = {0.0, 75.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{-4.0, -5.0}, {0.0, 5.0}, {4.0, -5.0}, {-4.0, -5.0}}), Text(origin = {15.0, 75.0}, 
      lineColor = {128, 128, 128}, 
      extent = {{-5.0, 5.0}, {5.0, -5.0}}, 
      textString = "i", 
      textColor = {128, 128, 128}), Text(origin = {75.0, -15.0}, 
      lineColor = {128, 128, 128}, 
      extent = {{-5.0, 5.0}, {5.0, -5.0}}, 
      textString = "v", 
      textColor = {128, 128, 128}), Line(origin = {-20.0, 15.0}, 
      points = {{-60.0, -55.0}, {0.0, -25.0}, {40.0, -5.0}, {60.0, 55.0}}, 
      thickness = 0.5), Line(origin = {20.0, 4.5}, 
      points = {{0.0, 4.5}, {0.0, -4.5}}, 
      color = {128, 128, 128}, 
      pattern = LinePattern.Dot), Text(origin = {30.0, -5.0}, 
      lineColor = {128, 128, 128}, 
      pattern = LinePattern.Dot, 
      extent = {{-10.0, 5.0}, {10.0, -5.0}}, 
      textString = "Vknee", 
      textColor = {128, 128, 128}), Text(origin = {30.0, 65.0}, 
      lineColor = {128, 128, 128}, 
      pattern = LinePattern.Dot, 
      extent = {{-10.0, 5.0}, {10.0, -5.0}}, 
      textString = "Ron", 
      textColor = {128, 128, 128}), Text(origin = {-10.0, 5.0}, 
      lineColor = {128, 128, 128}, 
      pattern = LinePattern.Dot, 
      extent = {{-10.0, 5.0}, {10.0, -5.0}}, 
      textString = "Goff", 
      textColor = {128, 128, 128}), Ellipse(origin = {20.0, 10.0}, 
      lineColor = {0, 0, 255}, 
      pattern = LinePattern.Dot, 
      extent = {{-2.0, 2.0}, {2.0, -2.0}})}));
equation 
  off = s < 0;
  v = (s * unitCurrent) * (if off then 1 else Ron) + Vknee;
  i = (s * unitVoltage) * (if off then Goff else 1) + Goff * Vknee;
end IdealDiode;