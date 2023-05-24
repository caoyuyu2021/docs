within ServoWing.Interfaces.ElectricalInterfaces.MultiPhase;
connector NegativePlug "多相负极电接口 "
  parameter Integer m(final min = 1) = 3 "相数";
  Modelica.Electrical.Analog.Interfaces.Pin pin[m];
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {
      100, 100}}), graphics = {Ellipse(
      extent = {{-100, 100}, {100, -100}}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 40.0}, {40.0, -40.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));
end NegativePlug;