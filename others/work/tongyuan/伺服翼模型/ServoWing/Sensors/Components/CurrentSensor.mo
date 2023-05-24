within ServoWing.Sensors.Components;
model CurrentSensor "单相-理想电流传感器"
  extends ServoLib.Icons.BasicModel;
  extends Modelica.Icons.RotationalSensor;
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
equation 
  p.v = n.v;
  p.i = i;
  n.i = -i;
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
      points = {{-13.0, 0.0}, {13.0, 0.0}}), Line(origin = {0.0, -80.0}, 
      points = {{0.0, -10.0}, {0.0, 10.0}}, 
      color = {0, 0, 255})}), 
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The current sensor converts the current flowing between the two connectors into a real valued signal. The two connectors are in the sensor connected like a short cut. The sensor has to be placed within an electrical connection in series.  It does not influence the current sum at the connected nodes. Therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
end CurrentSensor;