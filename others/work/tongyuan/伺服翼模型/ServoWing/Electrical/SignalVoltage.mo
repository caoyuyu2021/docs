within ServoWing.Electrical;
model SignalVoltage "信号电压源"

  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(transformation(extent = {{-110, 
    -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(transformation(extent = {{110, 
    -10}, {90, 10}}, rotation = 0)));
  //SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.Blocks.Interfaces.RealInput v(unit = "V")
    "Voltage from pin p to pin n as input signal" 
    annotation (Placement(transformation(
      origin = {0, 70}, 
      extent = {{-20, -20}, {20, 20}}, 
      rotation = 270)));
equation 
  v = p.v - n.v;
  0 = p.i + n.i;
  annotation (
    Icon(coordinateSystem(
      preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}), graphics = {
      Ellipse(
      extent = {{-50, 50}, {50, -50}}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid), 
      Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), 
      Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), 
      Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), 
      Text(
      extent = {{-150, -120}, {150, -80}}, 
      textString = "%name", 
      lineColor = {0, 0, 255}), 
      Polygon(
      points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, 
      lineColor = {0, 0, 255}, 
      fillColor = {0, 0, 255}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(
      preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}), graphics = {
      Ellipse(
      extent = {{-50, 50}, {50, -50}}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid), 
      Line(points = {{-96, 0}, {-50, 0}}, color = {0, 0, 255}), 
      Line(points = {{50, 0}, {96, 0}}, color = {0, 0, 255}), 
      Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}), 
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
end SignalVoltage;