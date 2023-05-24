within ServoWing.Interfaces.BlockInterfaces;
connector BooleanInput = input Boolean "布尔型输入接口" 
  annotation (defaultComponentName = "u", 
    Icon(graphics = {Polygon(
      points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, 
      lineColor = {255, 0, 255}, 
      fillColor = {255, 0, 255}, 
      fillPattern = FillPattern.Solid)}, 
      coordinateSystem(extent = {{-100, -100}, {100, 100}}, 
        preserveAspectRatio = true, initialScale = 0.2)), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      initialScale = 0.2, 
      grid = {1.0, 1.0}), graphics = {Polygon(origin = {50.0, 0.0}, 
      lineColor = {255, 0, 255}, 
      fillColor = {255, 0, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-50.0, 50.0}, {50.0, 0.0}, {-50.0, -50.0}, {-50.0, 50.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));