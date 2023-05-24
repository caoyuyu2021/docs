within ServoWing.Utilities.Blocks;
model Displayplane "动态显示控件"
  Modelica.Blocks.Interfaces.RealInput ecop_yz[2]
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Real y_limit;
  Real z_limit;
equation 
  y_limit = ecop_yz[2] * 9.75;
  z_limit = ecop_yz[1] * 9.75;
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Cross, 
      extent = {{-80.0, 80.0}, {80.0, -80.0}}), Ellipse(origin = DynamicSelect({0, 0}, {z_limit, y_limit}), 
      lineColor = {255, 0, 0}, 
      fillColor = {255, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-5.0, 5.0}, {5.0, -5.0}}), Line(origin = {0.0, 0.0}, 
      points = {{-80.0, 0.0}, {80.0, 0.0}}, 
      thickness = 1.0, 
      arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.0, 0.0}, 
      points = {{0.0, -80.0}, {0.0, 80.0}}, 
      thickness = 1.0, 
      arrow = {Arrow.None, Arrow.Filled}), Text(origin = {75.0, -10.0}, 
      extent = {{-11.0, 6.0}, {11.0, -6.0}}, 
      textString = "Z", 
      textStyle = {TextStyle.None}), Text(origin = {11.0, 74.0}, 
      extent = {{-11.0, 6.0}, {11.0, -6.0}}, 
      textString = "Y", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-90.0, 30.0}, {90.0, -30.0}}, 
      textString = "动态显示组件", 
      textStyle = {TextStyle.None})}));
end Displayplane;