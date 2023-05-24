within ServoWing.Interfaces.RotationalInterfaces;
connector Flange_a "转动输入接口"
  SI.Angle phi "接口的绝对旋转角度";
  flow SI.Torque tau "接口的切割（有效）转矩";
  annotation (defaultComponentName = "flange_a", 
    Icon(coordinateSystem(
      preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {2, 2}), graphics = {Ellipse(
      extent = {{-100, 100}, {100, -100}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {95, 95, 95}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
      fillColor = {135, 135, 135}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 40.0}, {40.0, -40.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));
end Flange_a;