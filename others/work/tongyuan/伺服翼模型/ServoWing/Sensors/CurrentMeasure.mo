within ServoWing.Sensors;
model CurrentMeasure "单相-采样电流传感器"
  extends ServoLib.Icons.BasicModel;
  extends Modelica.Icons.RotationalSensor;
  //参数
  parameter Real Irange(final unit = "A") = 30 "电流量程";
  parameter Real Vrange(final unit = "V") = 30 "电压量程";
  parameter Real T(final unit = "s") = 6.25e-5 "采样周期";
  parameter Integer n_num = 12 "采集器位数";
  //实例化
  Modelica.Electrical.Analog.Interfaces.PositivePin p "正极" 
    annotation (Placement(
      transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "负极" 
    annotation (Placement(
      transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput i(unit = "A") "电流值" 
    annotation (Placement(transformation(
      origin = {0, -100}, 
      extent = {{10, -10}, {-10, 10}}, 
      rotation = 90)));

  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.5, -40.5}, 
      extent = {{-29.5, 29.5}, {29.5, -29.5}}, 
      textString = "A"), Line(origin = {-80.0, 0.0}, 
      points = {{10.0, 0.0}, {-10.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {80.0, 0.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {0.0, -80.0}, 
      points = {{0.0, -10.0}, {0.0, 10.0}}, 
      color = {0, 0, 127}), Text(origin = {0.0, -130.0}, 
      extent = {{-105.0, 30.0}, {105.0, -30.0}}, 
      textString = "理想电流传感器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Text(origin = {-18.0, -87.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "i", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-83.0, 0.0}, 
      points = {{13.0, 0.0}, {-13.0, 0.0}}), Line(origin = {83.0, 0.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}})}), 
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The current sensor converts the current flowing between the two connectors into a real valued signal. The two connectors are in the sensor connected like a short cut. The sensor has to be placed within an electrical connection in series.  It does not influence the current sum at the connected nodes. Therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
  Components.CurrentSensor currentSensor
    annotation (Placement(transformation(origin = {0.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.A_D a_d(n = n_num, 
    min = 0, 
    max = Vrange, 
    samplePeriod = T)
    annotation (Placement(transformation(origin = {1.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  Modelica.Blocks.Discrete.UnitDelay unitdelay(samplePeriod = T)
    annotation (Placement(transformation(origin = {0.0, -58.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToVoltage tovoltage(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {0.0, 46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  Components.ToCurrent tocurrent(
    Irange = Irange, 
    Vrange = Vrange)
    annotation (Placement(transformation(origin = {0.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
equation 
  connect(p, currentSensor.p)
    annotation (Line(origin = {-54.0, 0.0}, 
      points = {{-46.0, 0.0}, {-6.0, 0.0}, {-6.0, 80.0}, {44.0, 80.0}}, 
      color = {0, 0, 255}));
  connect(currentSensor.n, n)
    annotation (Line(origin = {56.0, 0.0}, 
      points = {{-46.0, 80.0}, {4.0, 80.0}, {4.0, 0.0}, {44.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(currentSensor.i, tovoltage.u)
    annotation (Line(origin = {0.0, 64.0}, 
      points = {{0.0, 6.0}, {0.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(tovoltage.y, a_d.u)
    annotation (Line(origin = {1.0, 26.0}, 
      points = {{-1.0, 9.0}, {-1.0, -9.0}, {0.0, -9.0}}, 
      color = {0, 0, 127}));
  connect(a_d.y, tocurrent.u)
    annotation (Line(origin = {1.0, -10.0}, 
      points = {{0.0, 5.0}, {-1.0, 5.0}, {-1.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(tocurrent.y, unitdelay.u)
    annotation (Line(origin = {0.0, -41.0}, 
      points = {{0.0, 4.0}, {0.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(unitdelay.y, i)
    annotation (Line(origin = {0.0, -84.0}, 
      points = {{0.0, 15.0}, {0.0, -16.0}}, 
      color = {0, 0, 127}));
end CurrentMeasure;