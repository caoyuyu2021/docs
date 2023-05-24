within ServoWing.Interfaces.TranslationalInterfaces;
connector Flange_b "平动输出接口"
  SI.Position s "接口的绝对位移";
  flow SI.Force f "力";
  annotation (defaultComponentName = "flange_b", 
    Icon(coordinateSystem(
      preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {2, 2}), graphics = {Rectangle(
      extent = {{-100, -100}, {100, 100}}, 
      lineColor = {0, 127, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      lineColor = {0, 127, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, -40.0}, {40.0, 40.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));
end Flange_b;