within ServoWing.Motors.Components;
model strayInductance "漏电感(杂散电感)"
  parameter SI.Inductance L(start = 1) = 1 "Inductance";
  SI.Voltage v[2] "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current i[2] "Current flowing from pin p to pin n";

  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, -9.0}, 
      lineColor = {255, 255, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, -15.0}, {60.0, 15.0}}), Text(origin = {3.0, -77.0}, 
      extent = {{-141.0, 17.0}, {141.0, -17.0}}, 
      textString = "L=%L"), Text(origin = {-2.0, 59.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
      textString = "%name", 
      textColor = {0, 0, 255}), Ellipse(origin = {-45.0, 6.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}}), Ellipse(origin = {-15.0, 6.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}}), Ellipse(origin = {15.0, 6.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}}), Ellipse(origin = {45.0, 6.0}, 
      lineColor = {0, 0, 255}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}}), Line(origin = {75.0, 4.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 0, 255}), Line(origin = {-75.0, 4.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 0, 255}), Rectangle(origin = {3.0, -19.0}, 
      lineColor = {255, 255, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-71.0, 23.0}, {71.0, -23.0}})}));
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_a
    annotation (Placement(transformation(origin = {-100.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_b
    annotation (Placement(transformation(origin = {100.0, 4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  v = spacePhasor_a.v_ - spacePhasor_b.v_;
  zeros(2) = spacePhasor_a.i_ + spacePhasor_b.i_;
  i = spacePhasor_a.i_;
  L * der(i) = v;
end strayInductance;