within ServoWing.Interfaces.BlockInterfaces;
connector RealOutput = output Real "实型输出接口" 
  annotation (defaultComponentName = "y", 
    Icon(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}), 
      graphics = {Polygon(
      points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, 
      lineColor = {0, 0, 127}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {-50.0, 0.0}, 
      lineColor = {0, 0, 127}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-50.0, 50.0}, {50.0, 0.0}, {-50.0, -50.0}, {-50.0, 50.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));