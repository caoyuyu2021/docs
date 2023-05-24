within ServoWing.Motors;
model TerminalBox "Y/D连接盒"
  parameter Integer m = 3 "相数";
  parameter String terminalConnection(start = "Y") "接线方式 Y:星形连接,D:三角形连接" 
    annotation (choices(choice = "Y" "星形连接", choice = "D" "三角形连接"));

  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_sp(final m = m)
    "To positive stator plug" annotation (Placement(transformation(extent = {
      {50, -90}, {70, -110}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_sn(final m = m)
    "To negative stator plug" annotation (Placement(transformation(extent = {
      {-70, -90}, {-50, -110}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Basic.Star star(final m = m) if (
    terminalConnection <> "D") annotation (Placement(transformation(
      origin = {-70, -80}, 
      extent = {{-10, 10}, {10, -10}}, 
      rotation = 180)));
  Modelica.Electrical.MultiPhase.Basic.Delta delta(final m = m) if (
    terminalConnection == "D") annotation (Placement(transformation(extent = 
      {{-20, -70}, {-40, -50}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plugSupply(final m = 
    m) "To grid" annotation (Placement(transformation(extent = {{-10, -70}, 
      {10, -90}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint if (
    terminalConnection <> "D") annotation (Placement(transformation(extent = 
      {{-100, -90}, {-80, -70}}, rotation = 0)));
equation 
  connect(plug_sn, star.plug_p)
    annotation (Line(points = {{-60, -100}, {-60, -80}}, color = {0, 0, 255}));
  connect(plug_sn, delta.plug_n) annotation (Line(points = {{-60, -100}, {-40, -100}, 
    {-40, -60}}, color = {0, 0, 255}));
  connect(delta.plug_p, plug_sp) annotation (Line(points = {{-20, -60}, {60, -60}, 
    {60, -100}}, color = {0, 0, 255}));
  connect(plug_sp, plugSupply) annotation (Line(points = {{60, -100}, {0, -100}, 
    {0, -80}}, color = {0, 0, 255}));
  connect(star.pin_n, starpoint)
    annotation (Line(points = {{-80, -80}, {-90, -80}}, color = {0, 0, 255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, 
    -100}, {100, 100}}), graphics = {Polygon(
    points = {{-80, -80}, {-80, -84}, {-80, -120}, {-40, -140}, {40, -140}, {
    80, -110}, {80, -84}, {76, -80}, {-80, -80}}, 
    lineColor = {95, 95, 95}, 
    fillColor = {135, 135, 135}, 
    fillPattern = FillPattern.Solid), Text(
    extent = {{-40, -90}, {40, -130}}, 
    lineColor = {0, 0, 0}, 
    textString = "%terminalConnection")}), Documentation(info = "<html>
TerminalBox: at the bottom connected to both machine plugs, connect at the top to the grid as usual,<br>
choosing Y-connection (StarDelta=Y) or D-connection (StarDelta=D).
</html>"));
end TerminalBox;