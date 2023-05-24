within ServoWing.Electrical;
model SignalCurrentTP "三相信号电流源"
  parameter Integer m(min = 1) = 3 "Number of phases";
  Modelica.SIunits.Voltage v[m] = plug_p.pin.v - plug_n.pin.v
    "Voltage drops between the two plugs";
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m = m) annotation (Placement(
    transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m = m) annotation (Placement(
    transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput i[m](each unit = "A")
    "Current flowing from pin p to pin n as input signal" annotation (
      Placement(transformation(
        origin = {0, 70}, 
        extent = {{-20, -20}, {20, 20}}, 
        rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m]
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, 
      rotation = 0)));
equation 
  connect(signalCurrent.p, plug_p.pin)
    annotation (Line(points = {{-10, 0}, {-100, 0}}, color = {0, 0, 255}));
  connect(signalCurrent.n, plug_n.pin)
    annotation (Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(i, signalCurrent.i)
    annotation (Line(points = {{0, 70}, {0, 7}}, color = {0, 0, 255}));
  annotation (Icon(graphics = {Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), 
    Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Ellipse(
    extent = {{-50, 50}, {50, -50}}, 
    lineColor = {0, 0, 255}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid), Line(points = {{0, 50}, {0, -50}}, 
    color = {0, 0, 255}), Text(
    extent = {{-150, -110}, {150, -50}}, 
    textString = "%name", 
    lineColor = {0, 0, 255}), Text(
    extent = {{-100, 100}, {-20, 60}}, 
    lineColor = {0, 0, 0}, 
    textString = "m="), Text(
    extent = {{20, 100}, {100, 60}}, 
    lineColor = {0, 0, 0}, 
    textString = "%m"), Polygon(
    points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, 
    lineColor = {0, 0, 255}, 
    fillColor = {0, 0, 255}, 
    fillPattern = FillPattern.Solid)}), Documentation(info = "<HTML>
<p>
Contains m signal controlled current sources (Modelica.Electrical.Analog.Sources.SignalCurrent)
</p>
</HTML>"));
end SignalCurrentTP;