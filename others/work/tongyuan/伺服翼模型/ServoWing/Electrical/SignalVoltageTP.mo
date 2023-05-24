within ServoWing.Electrical;
model SignalVoltageTP "三相信号电压源"
  parameter Integer m(min = 1) = 3 "Number of phases";
  Modelica.SIunits.Current i[m] = plug_p.pin.i
    "Currents flowing into positive plugs";
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m = m) annotation (Placement(
    transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m = m) annotation (Placement(
    transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v[m](each unit = "V")
    "Voltage between pin p and n (= p.v - n.v) as input signal" annotation (
      Placement(transformation(
        origin = {0, 70}, 
        extent = {{-20, -20}, {20, 20}}, 
        rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage[m]
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, 
      rotation = 0)));
equation 
  connect(signalVoltage.p, plug_p.pin)
    annotation (Line(points = {{-10, 0}, {-100, 0}}, color = {0, 0, 255}));
  connect(signalVoltage.n, plug_n.pin)
    annotation (Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(v, signalVoltage.v)
    annotation (Line(points = {{0, 70}, {0, 7}}, color = {0, 0, 255}));
  annotation (Icon(graphics = {Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), 
    Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Ellipse(
    extent = {{-50, 50}, {50, -50}}, 
    lineColor = {0, 0, 255}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid), Line(points = {{-50, 0}, {50, 0}}, 
    color = {0, 0, 255}), Text(
    extent = {{-150, -110}, {150, -50}}, 
    textString = "%name", 
    lineColor = {0, 0, 255}), Text(
    extent = {{20, 100}, {100, 60}}, 
    lineColor = {0, 0, 0}, 
    textString = "%m"), Text(
    extent = {{30, 60}, {110, 0}}, 
    lineColor = {0, 0, 255}, 
    textString = "-"), Text(
    extent = {{-110, 60}, {-30, 0}}, 
    lineColor = {0, 0, 255}, 
    textString = "+")}), Documentation(info = "<HTML>
<p>
Contains m signal controlled voltage sources (Modelica.Electrical.Analog.Sources.SignalVoltage)
</p>
</HTML>"));
end SignalVoltageTP;