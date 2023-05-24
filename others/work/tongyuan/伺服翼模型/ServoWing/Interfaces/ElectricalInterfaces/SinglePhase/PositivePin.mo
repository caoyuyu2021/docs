within ServoWing.Interfaces.ElectricalInterfaces.SinglePhase;
connector PositivePin "单相正极电接口"
  Modelica.SIunits.Voltage v "电势" annotation (
    unassignedMessage = "An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
  flow Modelica.SIunits.Current i "电流" annotation (
    unassignedMessage = "An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
  annotation (defaultComponentName = "pin_p", 
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 
      100}}), graphics = {Rectangle(
      extent = {{-100, 100}, {100, -100}}, 
      lineColor = {0, 0, 255}, 
      fillColor = {0, 0, 255}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      lineColor = {0, 0, 255}, 
      fillColor = {0, 0, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 40.0}, {40.0, -40.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));
end PositivePin;