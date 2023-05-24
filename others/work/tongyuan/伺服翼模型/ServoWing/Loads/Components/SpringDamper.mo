within ServoWing.Loads.Components;
model SpringDamper "刚度、阻尼模型"
  extends Icons.BasicModel;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates(
    s_rel(fixed
       = true, start
       = 0));


  parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 0.8e7
    "刚度";
  parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 3.5e5
    "阻尼";
  final parameter SI.Position s_rel0 = 0 "";
protected 
  Modelica.SIunits.Force f_c "弹簧力";
  Modelica.SIunits.Force f_d "阻尼力";
equation 
  f_c = c * (s_rel - s_rel0);
  f_d = d * v_rel;
  f = f_c + f_d;
  annotation (
    Documentation(info = "<html>
<p>
A <i>spring and damper element connected in parallel</i>.
The component can be
connected either between two sliding masses to describe the elasticity
and damping, or between a sliding mass and the housing (model Fixed),
to describe a coupling of the sliding mass with the housing via a spring/damper.
</p>
</html>"), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {0.0, 40.0}, 
      points = {{-80.0, 0.0}, {-60.0, 0.0}, {-45.0, -30.0}, {-15.0, 30.0}, {15.0, -30.0}, {45.0, 30.0}, {60.0, 0.0}, {80.0, 0.0}}), Line(origin = {-80.0, -15.0}, 
      points = {{0.0, 55.0}, {0.0, -55.0}}), Line(origin = {-66.0, -70.0}, 
      points = {{-14.0, 0.0}, {14.0, 0.0}}), Rectangle(origin = {-7.0, -70.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-45.0, 21.0}, {45.0, -21.0}}), Line(origin = {8.0, -49.0}, 
      points = {{-60.0, 0.0}, {60.0, 0.0}}), Line(origin = {9.0, -91.0}, 
      points = {{-60.0, 0.0}, {60.0, 0.0}}), Line(origin = {59.0, -70.0}, 
      points = {{-21.0, 0.0}, {21.0, 0.0}}), Line(origin = {80.0, -15.0}, 
      points = {{0.0, 55.0}, {0.0, -55.0}}), Line(origin = {-85.0, 0.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}), Line(origin = {85.0, 0.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}), Polygon(origin = {38.0, -18.0}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid, 
      points = {{15.0, 0.0}, {-15.0, 10.0}, {-15.0, -10.0}, {15.0, 0.0}}), Line(origin = {-17.0, -18.0}, 
      points = {{-40.0, 0.0}, {40.0, 0.0}}), Line(origin = {-52.5, -90.0}, 
      points = {{-47.5, -10.0}, {-47.5, 10.0}, {47.5, 10.0}}, 
      color = {191, 0, 0}, 
      pattern = LinePattern.Dot), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "刚度阻尼", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, 
      {100, 100}}), graphics = {Line(
      points = {{-80, 32}, {-58, 32}, {-43, 2}, {-13, 62}, {17, 2}, {47, 62}, {62, 
      32}, {80, 32}}, 
      color = {0, 0, 0}, 
      thickness = 0.5), Line(points = {{-100, 31}, {-100, 96}}, color = {128, 
      128, 128}), Line(points = {{100, 29}, {100, 94}}, color = {128, 128, 128}), 
      Line(points = {{-98, 82}, {100, 82}}, color = {128, 128, 128}), Polygon(
      points = {{90, 85}, {100, 82}, {90, 79}, {90, 85}}, 
      lineColor = {128, 128, 128}, 
      fillColor = {128, 128, 128}, 
      fillPattern = FillPattern.Solid), Text(
      extent = {{-63, 83}, {46, 103}}, 
      lineColor = {0, 0, 255}, 
      textString = "s_rel"), Rectangle(
      extent = {{-52, -28}, {38, -72}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid), Line(points = {{-51, -72}, {69, -72}}, 
      color = {0, 0, 0}), Line(points = {{-52, -28}, {68, -28}}, color = {0, 0, 0}), 
      Line(points = {{38, -50}, {80, -50}}, color = {0, 0, 0}), Line(points = {{-80, 
      -50}, {-52, -50}}, color = {0, 0, 0}), Line(points = {{-80, 32}, {-80, -50}}, 
      color = {0, 0, 0}), Line(points = {{80, 32}, {80, -50}}, color = {0, 0, 0}), 
      Line(points = {{-90, 0}, {-80, 0}}, color = {0, 0, 0}), Line(points = {{90, 0}, 
      {80, 0}}, color = {0, 0, 0})}));
end SpringDamper;