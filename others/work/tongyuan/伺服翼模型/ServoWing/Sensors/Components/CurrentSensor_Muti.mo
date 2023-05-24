within ServoWing.Sensors.Components;
model CurrentSensor_Muti "三相-理想电流传感器"
  extends ServoLib.Icons.BasicModel;
  extends Modelica.Icons.RotationalSensor;
  //参数
  parameter Integer m(final min = 1) = 3 "相数";
  //实例化
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m = m)
    annotation (Placement(
      transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m = m)
    annotation (Placement(
      transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput i[m] "电流值" 
    annotation (
      Placement(transformation(
        origin = {0, -110}, 
        extent = {{10, -10}, {-10, 10}}, 
        rotation = 90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor[m]
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, 
      rotation = 0)));
equation 
  connect(plug_p.pin, currentSensor.p)
    annotation (Line(points = {{-100, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(currentSensor.n, plug_n.pin)
    annotation (Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(currentSensor.i, i) annotation (Line(
    points = {{0, -10}, {0, -110}}, 
    color = {0, 0, 127}, 
    smooth = Smooth.None));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.5, -40.5}, 
      extent = {{-29.5, 29.5}, {29.5, -29.5}}, 
      textString = "A"), Text(origin = {-60.0, -80.0}, 
      extent = {{-40.0, 20.0}, {40.0, -20.0}}, 
      textString = "m="), Line(origin = {-80.0, 0.0}, 
      points = {{10.0, 0.0}, {-10.0, 0.0}}), Line(origin = {80.0, 0.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}), Line(origin = {0.0, -85.0}, 
      points = {{0.0, -15.0}, {0.0, 15.0}}, 
      color = {0, 0, 127}), Text(origin = {60.0, -80.0}, 
      extent = {{-40.0, 20.0}, {40.0, -20.0}}, 
      textString = "%m"), Text(origin = {0.0, -130.0}, 
      extent = {{-135.0, 30.0}, {135.0, -30.0}}, 
      textString = "理想多相电流传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-14.0, -87.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "i", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<HTML>
<p>
Contains m current sensors (Modelica.Electrical.Analog.Sensors.CurrentSensor),
thus measuring the m currents <i>i[m]</i> flowing from the m pins of plug_p to the m pins of plug_n.
</p>
</HTML>"));
end CurrentSensor_Muti;