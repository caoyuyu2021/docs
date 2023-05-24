within ServoWing.Interfaces.HeatInterfaces;
connector HeatPort_b "热流接口b"
  Modelica.SIunits.Temperature T "温度";
  flow Modelica.SIunits.HeatFlowRate Q_flow "热流";
  annotation (defaultComponentName = "port_b", 
    Documentation(info = "<HTML>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>
   T       Temperature in [Kelvin].
   Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></HTML>
"), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      lineColor = {191, 0, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-50.0, 50.0}, {50.0, -50.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}), 
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
      100, 100}}), graphics = {Rectangle(
      extent = {{-100, 100}, {100, -100}}, 
      lineColor = {191, 0, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid)}));
end HeatPort_b;